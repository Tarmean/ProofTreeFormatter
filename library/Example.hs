{-# Language OverloadedStrings #-}
{-# Language TypeFamilies #-}
module Example (main)  where
import Debug.Trace
import Text.Megaparsec
import Data.Char (isSpace)
import Text.Megaparsec.Char
import Control.Monad
import qualified Text.Megaparsec.Char.Lexer as L
import qualified Data.Text as T
import Data.Void
import System.Environment as E
import Data.Text.IO as TIO
import AsciiMath as AM
import Data.Ord (compare)
import qualified Data.ByteString.Char8 as B8
import Data.List (span)

main :: IO ()
main = do
    [a, b] <- getArgs
    doIt a b
doIt :: FilePath -> FilePath ->  IO ()
doIt a b = do
    c <- TIO.readFile a
    B8.writeFile b $ B8.pack $ T.unpack (elaborateFormat c)

elaborateFormat :: T.Text -> T.Text
elaborateFormat t = T.unlines $ base <> (concatMap step $  runP pFormat t)
  where
    base = [
        "---",
        "header-includes:",
        "  - \\usepackage{bussproofs}",
        "  - \\usepackage{graphicx}",
        "  - \\usepackage{amsmath}",
        "  - \\usepackage{bsymb}",
        "---"
         ]
    step (CL l0)
      | (l, r) <- T.span (==' ') l0, T.length l >= 4 = [latexExpr r]
      | otherwise = [l0]
    step (CP p) = latexProof p
    step (CC c) = [c]
pCodeBlock :: Parser [C]
pCodeBlock =  do
    l <- T.unpack <$> string "```"
    let go = fmap T.unpack (string "```") <|> ((:) <$> anySingle  <*> go)
    r <- go
    return [CC . T.pack $ l <> r]
pFormat :: Parser [C]
pFormat = fmap concat $ some (  pCodeBlock <|> lhs <|> rhs) <* (skipStart eof)
 where

    lhs = map CP <$> (try $ skipStart parseProof)
    rhs = pure . CL <$> pLine
    pLine =  takeWhileP Nothing (/= '\n') <* newline
    skipStart a = void (many (satisfy isSpace)) *> a
data C = CL T.Text | CP Proof | CC T.Text

type Parser = Parsec Void T.Text

type StepLabel = Maybe T.Text
type ProofBody = T.Text

data ProofToken = Line StepLabel | Proof ProofBody | ProofEnd | NestedProof Proof
  deriving (Show, Eq, Ord)

data Proof = P Judgement StepLabel [Proof]
  deriving (Show, Eq, Ord)
data Judgement = R T.Text
  deriving (Show, Eq, Ord)

latexExpr :: T.Text -> T.Text
latexExpr = T.concatMap subst  -- T.pack . map subst . AM.run . T.unpack
  where
      subst '§' = ":"
      subst '\\' = "\\textbackslash{}"
      subst c  = T.singleton c

latexProof :: Proof -> [T.Text]
latexProof ls0 = ["\\begin{prooftree}"]<> go ls0 <> ["\\end{prooftree}"]
  where
      go (P (R j) m ls) = pushArgs ls <> pushLine m <> pushRes j ls
      pushArgs = concatMap  go
      pushLine m
        | Just a <- m = ["\\RightLabel{\\scriptsize(" <> a <> ")}"]
        | otherwise = []
      pushRes j ls = case length ls of
           0 -> ["\\AxiomC{}", "\\UnaryInfC{" <> e  <> "}"]
           1 -> ["\\UnaryInfC{" <> e <>  "}"]
           2 -> ["\\BinaryInfC{" <> e  <> "}"]
           3 -> ["\\TrinaryInfC{" <> e  <> "}"]
           4 -> ["\\QuaternaryInfC{" <> e  <> "}"]
           5 -> ["\\QuinaryInfC{" <> e  <> "}"]
           _ -> error ("Only up to 5 inferences")
       where e = latexExpr j

parseLine :: Parser (Maybe T.Text)
parseLine = label "sepLine" $ atLeast 4 ('-' <$ string "\212\196\187" <|> char '⎯' <|> char '-') >> optional (many (satisfy (==' '))>> nonemptyString)
  where
    nonemptyString = takeWhile1P Nothing (not . (=='\n'))
    atLeast i a = do
      r <- many a
      guard (length r >= i)
parseProofBody :: Parser [ProofToken]
parseProofBody = do
    b <- label "proofBody" $ T.pack <$> some (noneOf ("\n;":: String))
    m <- optional parseProofEnd
    case m of
        Just _ -> pure [ProofEnd, Proof b]
        Nothing -> pure [Proof b]
  where
    parseProofEnd = (label "proofSep" $ char ';' <|> char '.')


runP :: (Token v ~ Char, Stream v, ShowErrorComponent e) => Parsec e v a -> v -> a
runP p v = case runParser (p) "" v of
    Left e -> error (errorBundlePretty e)
    Right a -> a

pProofToken :: Parser [ProofToken]
pProofToken = pure . Line <$> parseLine <|> parseProofBody
parseProofTokens :: Parser [(Pos, ProofToken)]
parseProofTokens = do
  let go ls = do
           void $ optional newline
           void $ takeWhileP Nothing (==' ')
           i <- L.indentLevel
           if unPos i == 1
           then pure (ls)
           else (do
                p <- pProofToken
                go $ map ((,)i) p<>ls) <|> pure (ls)
  a <- go []
  guard (not $ null a)
  pure a

parseProof :: Parser [Proof]
parseProof = do
  ls <- parseProofTokens
  pure ( parseTokens0 ls)
  
-- Proofs with the same indentation are stacked by default
-- [d] 
--   [c]            [c] 
--   ---n2          ---n2   
--   [b]   =>   [d] [b]
-- ---r1        -------r1
-- [a]          [a]
--
-- Alternatively a semicolon can be used to split a block with the same indentation
--   [d]       [d]
--   [c];      [c] [b]
--   [b]    => ------
-- [a]         [a]
--
--
-- If we only write a single proof on top the additional indentation can be elided
--
-- We output a rose tree of proofs and a list of tokens that aren't processed yet. Currently this list is always empty.
-- We could make indentation mandatory to avoid semicolons - not sure if that tradeoff is worthwhile since semicolon is the rare case
--
parseTokens0 = reverse . parseTokens
parseTokens :: [(Pos, ProofToken)] -> [Proof]
parseTokens ((_, ProofEnd) : rs) = parseTokens rs
parseTokens ((p, Proof b) : (p1, Line n):rs)
  | p == p1 =  P (R b) n  (parseTokens0 l) : parseTokens r
  where (l,r) = splitStep p rs
parseTokens ((p, Proof b):rs)
  | l == [] = P (R b) Nothing [] : parseTokens r
  where (l,r) = splitStep p rs
parseTokens [] = []
parseTokens ls = error ("unknown pattern: " <> show ls)

splitStep :: Pos -> [(Pos, ProofToken)] -> ([(Pos, ProofToken)], [(Pos, ProofToken)])
splitStep p ls = (e <> c, r)
  where
    (e,m) = split (==p) ls
    (c,r) = span ((>p).fst) m
    split f = span (\i -> f (fst i) && snd i /= ProofEnd)
testd :: T.Text
testd = T.unlines $ map T.pack $ map ("  " <>)
    [
        "      she",
        "      ----",
        "      np",
        "                in",
        "                ----",
        "                ((s\\np)\\(s\\np))/np ",
        "                        the",
        "                        ---- ",
        "                        np/n",
        "                            park",
        "                            ----",
        "                            n",
        "                    ----  >",
        "                    np",
        "            ----  >",
        "            ((s\\np)\\(s\\np))      ",
        "         ----  <",
        "         s\\np",
        "    ----  <",
        "    s"]

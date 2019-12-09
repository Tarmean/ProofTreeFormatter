---
header-includes:
  - \usepackage{bussproofs}
  - \usepackage{graphicx}
  - \usepackage{amsmath}
  - \usepackage{bsymb}
---
|          |                    |
|----------|--------------------|
| Subject  | Grammar Formalisms |
| Homework | 3                  |
| Name     | Cyril Fahlenbock   |
| MatNr    | 2280776            |
# 1

### a)

> She runs regularly in the park

| Word      | Cat                     |
|-----------|-----------------------|
| she       | np                    |
| runs      | s\\np                 |
| regularly | (s\\np)\\(s\\np)      |
| in        | ((s\\np)\\(s\\np))/np |
| the       | np/n                  |
| park      | n                     |
\begin{prooftree}
\AxiomC{she}
\UnaryInfC{np}
\AxiomC{runs}
\UnaryInfC{s\textbackslash{}np}
\AxiomC{regularly}
\UnaryInfC{(s\textbackslash{}np)\textbackslash{}(s\textbackslash{}np)}
\RightLabel{\scriptsize(<)}
\BinaryInfC{s\textbackslash{}np}
\AxiomC{in}
\UnaryInfC{((s\textbackslash{}np)\textbackslash{}(s\textbackslash{}np))/np}
\AxiomC{the}
\UnaryInfC{np/n}
\AxiomC{park}
\UnaryInfC{n}
\RightLabel{\scriptsize(>)}
\BinaryInfC{np}
\RightLabel{\scriptsize(>)}
\BinaryInfC{(s\textbackslash{}np)\textbackslash{}(s\textbackslash{}np)       }
\RightLabel{\scriptsize(<)}
\BinaryInfC{s\textbackslash{}np}
\RightLabel{\scriptsize(<)}
\BinaryInfC{s}
\end{prooftree}




#### b)

> They named their son Stan and daughter Shelly

| Word     | Cat               |
|----------|-----------------|
| they     | np              |
| named    | ((s\\np)/np)/np |
| their    | np/n            |
| son      | n               |
| daughter | n               |
| and      | (X\\X)/X        |
| Shelly   | np              |
| Stan     | np              |
\begin{prooftree}
\AxiomC{they}
\UnaryInfC{np}
\RightLabel{\scriptsize(T)}
\UnaryInfC{s/(s\textbackslash{}np)}
\AxiomC{named}
\UnaryInfC{((s\textbackslash{}np)/np)/np}
\RightLabel{\scriptsize(>B2)}
\BinaryInfC{(s/np)/np}
\AxiomC{their son Stan and their daughter Shelly}
\UnaryInfC{s\textbackslash{}((s/np)/np)}
\RightLabel{\scriptsize(<)}
\BinaryInfC{s}
\end{prooftree}
\begin{prooftree}
\AxiomC{their son}
\UnaryInfC{np}
\RightLabel{\scriptsize(T)}
\UnaryInfC{(s/np)\textbackslash{}((s/np)/np)}
\AxiomC{Stan}
\UnaryInfC{np}
\RightLabel{\scriptsize(T)}
\UnaryInfC{s\textbackslash{}(s/np)}
\RightLabel{\scriptsize(<B)}
\BinaryInfC{s\textbackslash{}((s/np)/np)}
\end{prooftree}
\begin{prooftree}
\AxiomC{their daughter}
\UnaryInfC{np}
\RightLabel{\scriptsize(T)}
\UnaryInfC{(s/np)\textbackslash{}((s/np)/np)}
\AxiomC{Shelly}
\UnaryInfC{np}
\RightLabel{\scriptsize(T)}
\UnaryInfC{s\textbackslash{}(s/np)}
\RightLabel{\scriptsize(<B)}
\BinaryInfC{s\textbackslash{}((s/np)/np)}
\end{prooftree}
\begin{prooftree}
\AxiomC{their daughter Shelly}
\UnaryInfC{s\textbackslash{}((s/np)/np)}
\AxiomC{and}
\UnaryInfC{(X\textbackslash{}X)/X}
\AxiomC{their son Stan}
\UnaryInfC{s\textbackslash{}((s/np)/np)}
\RightLabel{\scriptsize(andrule)}
\TrinaryInfC{s\textbackslash{}((s/np)/np)}
\end{prooftree}
\begin{prooftree}
\AxiomC{their}
\UnaryInfC{np/n}
\AxiomC{daughter}
\UnaryInfC{n}
\RightLabel{\scriptsize(>)}
\BinaryInfC{np}
\end{prooftree}
\begin{prooftree}
\AxiomC{their}
\UnaryInfC{np/n}
\AxiomC{son}
\UnaryInfC{n}
\RightLabel{\scriptsize(>)}
\BinaryInfC{np}
\end{prooftree}


### c)

> The wine that she bought gave me a headache

| Word     | Cat                |
|----------|------------------|
| The      | np/n             |
| wine     | n                |
| that     | (np\\np)/(s\\np) |
| she      | np               |
| bought   | (s\\np)/np       |
| gave     | ((s\\np)/np)/np  |
| me       | np               |
| a        | np/n             |
| headache | n                |
\begin{prooftree}
\AxiomC{The}
\UnaryInfC{np/n}
\AxiomC{wine}
\UnaryInfC{n}
\AxiomC{that}
\UnaryInfC{(n\textbackslash{}n)/(s/np)}
\AxiomC{she}
\UnaryInfC{np}
\RightLabel{\scriptsize(T)}
\UnaryInfC{s/(s\textbackslash{}np)}
\AxiomC{bought}
\UnaryInfC{(s\textbackslash{}np)/np}
\RightLabel{\scriptsize(>B)}
\BinaryInfC{s/np}
\RightLabel{\scriptsize(>)}
\BinaryInfC{n\textbackslash{}n}
\RightLabel{\scriptsize(<)}
\BinaryInfC{n}
\RightLabel{\scriptsize(>)}
\BinaryInfC{np}
\AxiomC{gave me a headache}
\UnaryInfC{s\textbackslash{}np}
\RightLabel{\scriptsize(<)}
\BinaryInfC{s}
\end{prooftree}
\begin{prooftree}
\AxiomC{gave}
\UnaryInfC{((s\textbackslash{}np)/np)/np}
\AxiomC{me}
\UnaryInfC{np}
\RightLabel{\scriptsize(>)}
\BinaryInfC{(s\textbackslash{}np)/np}
\AxiomC{a}
\UnaryInfC{np/n}
\AxiomC{headache}
\UnaryInfC{n}
\RightLabel{\scriptsize(>)}
\BinaryInfC{np}
\RightLabel{\scriptsize(>)}
\BinaryInfC{s\textbackslash{}np}
\end{prooftree}


### d)

> The angry referee should watch and analyse the video

| Word    | Cat                       |
|---------|---------------------------|
| The     | np/n                      |
| angry   | n/n                       |
| referee | n                         |
| should  | ((s\\np)/np)/((s\\np)/np) |
| watch   | (s\\np)/np                |
| and     | ((X\\X)/X)                |
| analyse | (s\\np)/np                |
| the     | np/n                      |
| video   | n                         |
\begin{prooftree}
\AxiomC{should}
\UnaryInfC{((s\textbackslash{}np)/np)/((s\textbackslash{}np)/np)}
\AxiomC{watch}
\UnaryInfC{(s\textbackslash{}np)/np}
\AxiomC{and}
\UnaryInfC{((X\textbackslash{}X)/X)}
\AxiomC{analyse}
\UnaryInfC{(s\textbackslash{}np)/np}
\RightLabel{\scriptsize(andrule)}
\TrinaryInfC{((s\textbackslash{}np)/np)}
\RightLabel{\scriptsize(>)}
\BinaryInfC{(s\textbackslash{}np)/np}
\end{prooftree}
\begin{prooftree}
\AxiomC{the}
\UnaryInfC{np/n}
\AxiomC{angry}
\UnaryInfC{n/n}
\AxiomC{referee}
\UnaryInfC{n}
\RightLabel{\scriptsize(>)}
\BinaryInfC{n}
\RightLabel{\scriptsize(>)}
\BinaryInfC{np}
\end{prooftree}
\begin{prooftree}
\AxiomC{the angry referee}
\UnaryInfC{np}
\AxiomC{should watch and analyse}
\UnaryInfC{(s\textbackslash{}np)/np}
\AxiomC{the}
\UnaryInfC{np/n}
\AxiomC{video}
\UnaryInfC{n}
\RightLabel{\scriptsize(>)}
\BinaryInfC{np}
\RightLabel{\scriptsize(>)}
\BinaryInfC{s\textbackslash{}np}
\RightLabel{\scriptsize(<)}
\BinaryInfC{s}
\end{prooftree}

# 2

> Marshall persuaded Lily to fogive Barney

### a)

Object control since persuade is an object control verb.

### b)
\begin{prooftree}
\AxiomC{Marshall}
\UnaryInfC{np: marshall'}
\AxiomC{persuaded}
\UnaryInfC{((s\textbackslash{}np)/(sto\textbackslash{}np))/np: \textbackslash{}o p s. persuaded'(s, o, p(o))}
\AxiomC{Lily}
\UnaryInfC{np: lily'}
\RightLabel{\scriptsize(>)}
\BinaryInfC{(s\textbackslash{}np)/(sto\textbackslash{}np): \textbackslash{}p s. persuaded'(s, lily', p(lily'))}
\AxiomC{to forgive}
\UnaryInfC{(sto\textbackslash{}np)/np: \textbackslash{}y x. forgive'(x,y)}
\AxiomC{Barney}
\UnaryInfC{np: barney'}
\RightLabel{\scriptsize(>)}
\BinaryInfC{sto\textbackslash{}np: \textbackslash{}x. forgive'(x, barney')}
\RightLabel{\scriptsize(>)}
\BinaryInfC{s\textbackslash{}np: \textbackslash{}s. persuaded'(s, lily', forgive'(lily', barney')}
\RightLabel{\scriptsize(<)}
\BinaryInfC{s: persuaded'(marshall', lily', forgive'(lily', barney')}
\end{prooftree}



---
header-includes:
  - \usepackage{bussproofs}
  - \usepackage{graphicx}
  - \usepackage{amsmath}
  - \usepackage{bsymb}
---
- Norman Nnabhan
- Jonas Schneider
- Cyril Fahlenbock

#1
\begin{prooftree}
\AxiomC{}
\UnaryInfC{$\Gamma \vdash \left(\textrm{p}\Rightarrow \left[s_{1}\right]e\right)\wedge \left(\neg \textrm{p}\Rightarrow \left[s_{2}\right]e\right)$}
\UnaryInfC{$\Gamma \vdash \left[\textrm{if}\textrm{p}\textrm{then}s_{1}\textrm{else}s_{2}\textrm{end}\right]e$}
\end{prooftree}
\begin{prooftree}
\AxiomC{}
\UnaryInfC{$\Gamma ,P\left(X\right),x\in S\vdash Q\left(x,a\right)$}
\RightLabel{\scriptsize(SubstitutionEquality)}
\UnaryInfC{$\Gamma ,P\left(X\right),x\in S\vdash \left[y.=a\right]Q\left(x,y\right)$}
\RightLabel{\scriptsize(R=>)}
\UnaryInfC{$\Gamma ,x\in S\vdash P\left(x\right)\Rightarrow \left[y.=a\right]Q\left(x,y\right)$}
\RightLabel{\scriptsize(SubstitutionAssignIn)}
\UnaryInfC{$\Gamma \vdash \left[x.\in S\right]\left(P\left(x\right)\Rightarrow \left[y.=a\right]Q\left(x,y\right)\right)$}
\AxiomC{}
\UnaryInfC{$\Gamma ,\neg P\left(x\right),x\in S\vdash Q\left(x,b\right)$}
\RightLabel{\scriptsize(SubstitutionEquality)}
\UnaryInfC{$\Gamma ,\neg P\left(x\right),x\in S\vdash \left[y.=b\right]Q\left(x,y\right)$}
\RightLabel{\scriptsize(R=>)}
\UnaryInfC{$\Gamma ,x\in S\vdash \neg P\left(x\right)\Rightarrow \left[y.=b\right]Q\left(x,y\right)$}
\RightLabel{\scriptsize(SubstitutionAssignIn)}
\UnaryInfC{$\Gamma \vdash \left[x.\in S\right]\left(\neg P\left(x\right)\Rightarrow \left[y.=b\right]Q\left(x,y\right)\right)$}
\RightLabel{\scriptsize(SubstitutionIf)}
\BinaryInfC{$\Gamma \vdash \left[x.\in S\right]\left[\textrm{if}P\left(x\right)then\textrm{y}.=\textrm{a}else\textrm{y}.=\textrm{b}end\right]Q\left(x,y\right)$}
\end{prooftree}



#2

Some lemmas to start with:
\begin{prooftree}
\RightLabel{\scriptsize(Hyp)}
\AxiomC{}
\UnaryInfC{$\Gamma \vdash \forall i.\forall j.i\leqslant j\Rightarrow f\left(i\right)\leqslant f\left(j\right)$}
\RightLabel{\scriptsize(Flip)}
\UnaryInfC{$\Gamma \vdash \forall i.\forall j.f\left(j\right)>f\left(i\right)\Rightarrow j>i$}
\end{prooftree}
\begin{prooftree}
\RightLabel{\scriptsize(Triv)}
\AxiomC{}
\UnaryInfC{$v\in f\left[p..q\right]\vdash \exists z.z\in p..q\wedge f\left(z\right)=v$}
\end{prooftree}

Now we can link p/q and r via z


### Feasability
\begin{prooftree}
\RightLabel{\scriptsize(Triv)}
\AxiomC{}
\UnaryInfC{$b\geqslant a\vdash a..b\neq \left\{\right\}$}
\end{prooftree}
\begin{prooftree}
\RightLabel{\scriptsize(Triv)}
\AxiomC{}
\UnaryInfC{$r>p\vdash r+1\geqslant p$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$z\geqslant p,r>z\vdash r+1\geqslant p$}
\RightLabel{\scriptsize(Lemma)}
\AxiomC{}
\UnaryInfC{$\textrm{Sorted},f\left(r\right)>f\left(z\right)\vdash r>z$}
\RightLabel{\scriptsize(Skolemize)}
\BinaryInfC{$\textrm{Sorted},f\left(r\right)<v,v\in f\left[p..q\right],\exists z.\left(z\in p..q\wedge v=f\left(z\right)\right)\vdash r+1\geqslant q$}
\end{prooftree}
.
\begin{prooftree}
\RightLabel{\scriptsize(Triv)}
\AxiomC{}
\UnaryInfC{$p<r\vdash p\leqslant r-1$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$z\geqslant p,r>z\vdash p\leqslant r-1$}
\RightLabel{\scriptsize(Lemma)}
\AxiomC{}
\UnaryInfC{$\textrm{Sorted},f\left(r\right)>f\left(z\right)\vdash z<r$}
\RightLabel{\scriptsize(Skolemize)}
\BinaryInfC{$\textrm{Sorted},f\left(r\right)\geqslant v,f\left(r\right)\neq v,v\in f\left[p..p\right],\exists z.\left(z\in p..q\wedge v=f\left(z\right)\right)\vdash p\leqslant r-1$}
\end{prooftree}

### Variant.

$p-q$

### Nat.

$$
First show that the loop guard implies `p < q` in the loop:
\begin{prooftree}
\RightLabel{\scriptsize(Hyp)}
\AxiomC{}
\UnaryInfC{$p<q\vdash p<q$}
\RightLabel{\scriptsize(LEM)}
\AxiomC{}
\UnaryInfC{$f\left(r\right)\neq f\left(r\right)\vdash \perp $}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$p=q,r=p,v=f\left(p\right),f\left(r\right)\neq v\vdash p<q$}
\RightLabel{\scriptsize(LEM)}
\AxiomC{}
\UnaryInfC{$p>q,r\in p..q\vdash \perp $}
\RightLabel{\scriptsize(By Case)}
\TrinaryInfC{$r\in p..q,v\in f\left[p..q\right],f\left(r\right)\neq v\vdash p<q$}
\end{prooftree}
.
\begin{prooftree}
\RightLabel{\scriptsize(Lemma)}
\AxiomC{}
\UnaryInfC{$\Gamma \vdash p\leqslant q$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$\Gamma \vdash q-p\geqslant 0$}
\end{prooftree}

### Progress.
\begin{prooftree}
\RightLabel{\scriptsize(Triv)}
\AxiomC{}
\UnaryInfC{$r\geqslant p\vdash r+1>p$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$r\geqslant p\vdash -\left(r+1\right)<-p$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$r\geqslant p\vdash q-\left(r+1\right)<q-p$}
\RightLabel{\scriptsize(Eql)}
\UnaryInfC{$r\in p..q\vdash \left[p.=r+1\right]q-p<q-p$}
\end{prooftree}
\begin{prooftree}
\RightLabel{\scriptsize(Triv)}
\AxiomC{}
\UnaryInfC{$r\leqslant q\vdash r<q+1$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$r\leqslant q\vdash r-1-p<q-p$}
\RightLabel{\scriptsize(Eql)}
\UnaryInfC{$r\in p..q\vdash \left[q.=r-1\right]q-p<q-p$}
\end{prooftree}

# 3.

### Proof `(0+n-1)/2 in 0..n-1`
\begin{prooftree}
\RightLabel{\scriptsize(Triv)}
\AxiomC{}
\UnaryInfC{$n>0\vdash \frac{n-1}{2}\leqslant n-1$}
\RightLabel{\scriptsize(Triv)}
\AxiomC{}
\UnaryInfC{$n>0\vdash \frac{n-1}{2}\geqslant 0$}
\RightLabel{\scriptsize(Split)}
\BinaryInfC{$n>0\vdash \frac{0+n-1}{2}\in 0..n-1$}
\end{prooftree}

### Proof `(r + 1 + q)/2 in r+1..q`
\begin{prooftree}
\RightLabel{\scriptsize(Proof in Lemma)}
\AxiomC{}
\UnaryInfC{$\vdash q\geqslant r+1$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$\vdash r+1+q\geqslant \left(r+1\right)\cdot 2$}
\RightLabel{\scriptsize(Proof in Lemma)}
\AxiomC{}
\UnaryInfC{$\vdash r+1\leqslant q$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$\vdash r+1+q\leqslant q\cdot 2$}
\RightLabel{\scriptsize(Split Range)}
\BinaryInfC{$\vdash \frac{r+1+q}{2}\in r+1..q$}
\end{prooftree}

##### Proof `q >= r+1` during loop

We use already know that `p < q` in the loop body.
\begin{prooftree}
\RightLabel{\scriptsize(Triv)}
\AxiomC{}
\UnaryInfC{$r+1<q\vdash r+1<q$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$r+1<q\vdash r+1+q<2q$}
\RightLabel{\scriptsize(Helper Lemma)}
\AxiomC{}
\UnaryInfC{$p<q,p=r+1\vdash r+1<q$}
\RightLabel{\scriptsize(Simpl)}
\BinaryInfC{$p<q,p=r+1\vdash \frac{r+1+q}{2}<q$}
\end{prooftree}

### Proof `(p + r - 1 )/2 in p..r-1`
\begin{prooftree}
\RightLabel{\scriptsize(Proof in Lemma)}
\AxiomC{}
\UnaryInfC{$\vdash r-1\geqslant p$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$\vdash p+r-1\geqslant 2p$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$\vdash \frac{p+r-1}{2}\geqslant p$}
\RightLabel{\scriptsize(Proof in Lemma)}
\AxiomC{}
\UnaryInfC{$\vdash p\leqslant r-1$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$\vdash \left(p+r-1\right)\leqslant 2r-2$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$\vdash \frac{p+r-1}{2}\leqslant r-1$}
\RightLabel{\scriptsize(Split Range)}
\BinaryInfC{$\vdash \frac{p+r-1}{2}\in p..r-1$}
\end{prooftree}

##### Proof `p <= r-1` during loop
\begin{prooftree}
\RightLabel{\scriptsize(Triv)}
\AxiomC{}
\UnaryInfC{$p<r-1\vdash p<r-1$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$p<r-1\vdash \left(p+r-1\right)<2r-2$}
\RightLabel{\scriptsize(Helper Lemma)}
\AxiomC{}
\UnaryInfC{$q=r-1,p<q\vdash p<r-1$}
\RightLabel{\scriptsize(Simpl)}
\BinaryInfC{$q=r-1,p<q\vdash \frac{p+r-1}{2}<r-1$}
\end{prooftree}


```c
int p;
int q;
int r;
#define n 10
const int f[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

int binsearch() {
    p = 0;
    q = n - 1;
    r = (0 + n - 1)/2;
    while (f[r] != v) {
        if f(r) < v {
            p = r + 1;
            r = (r + 1 + q)/2;
        } else {
            q = r - 1;
            r = (p + r - 1)/2
        }
    }
    return 0;
}
```


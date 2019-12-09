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

$n>0$
$f\in 0..n-1\mapsto \mathbb{N}$


$g\in 0..n-1\mapsto \mathbb{N}$
$\forall k.k\in 0..n-1\Rightarrow g\left(k\right)=f\left(n-1-k\right)$


### Ini
\begin{prooftree}
\RightLabel{\scriptsize(Bot)}
\AxiomC{}
\UnaryInfC{$k\in \left\{\right\}\vdash g\left(k\right)=g\left(n-k-1\right)$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$k\in 0..-1\vdash g\left(k\right)=g\left(n-k-1\right)$}
\RightLabel{\scriptsize(Eql)}
\UnaryInfC{$\vdash \left[i.=0\right]\left[g.=f\right]\forall k.k\in 0..i-1\Rightarrow g\left(k\right)=f\left(n-k-1\right)$}
\end{prooftree}
.
\begin{prooftree}
\RightLabel{\scriptsize(Hyp)}
\AxiomC{}
\UnaryInfC{$k\in i..j\vdash g\left(k\right)=g\left(k\right)$}
\RightLabel{\scriptsize(Eql)}
\UnaryInfC{$\vdash \left[g.=f\right]\forall k.k\in i..j\Rightarrow g\left(k\right)=f\left(k\right)$}
\end{prooftree}
.
\begin{prooftree}
\RightLabel{\scriptsize(Bot)}
\AxiomC{}
\UnaryInfC{$k\in \left\{\right\}\vdash f\left(k\right)=f\left(n-k-1\right)$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$k\in n..n-1\vdash f\left(k\right)=f\left(n-k-1\right)$}
\RightLabel{\scriptsize(Eql)}
\UnaryInfC{$\left[j.=n-1\right]\left[g.=f\right]\forall k.k\in j+1..n-1\Rightarrow g\left(k\right)=f\left(n-k-1\right)$}
\end{prooftree}
.

### Inv

Let

$h=\left(\left\{i,j\right\}\domsub\textrm{g}\right)\cup \left\{i\mapsto g\left(j\right),j\mapsto g\left(i\right)\right\}$

This means
\begin{prooftree}
\AxiomC{}
\UnaryInfC{$k\in dom\left(g\right),k\not\in \left\{i,j\right\}\vdash h\left(k\right)=g\left(k\right)$}
\end{prooftree}

Three cases:


For `0..i` Split on

$k\in 0..i\vdash k\in 0..i-1\vee k=i$
\begin{prooftree}
\RightLabel{\scriptsize(EqlRefl)}
\AxiomC{}
\UnaryInfC{$\Gamma \vdash f\left(j\right)=f\left(j\right)$}
\RightLabel{\scriptsize(Eql)}
\UnaryInfC{$\Gamma ,f\left(j\right)=g\left(j\right),i+j=n-1\vdash g\left(j\right)=f\left(n-i-1\right)$}
\RightLabel{\scriptsize(Triv)}
\AxiomC{}
\UnaryInfC{$\vdash j\in i..j$}
\RightLabel{\scriptsize(ImplL)}
\BinaryInfC{$\Gamma ,\forall a.a\in i..j\Rightarrow f\left(a\right)=g\left(a\right)\vdash \left(\left\{i\mapsto g\left(j\right)\right\}\right)\left(i\right)=f\left(n-i-1\right)$}
\RightLabel{\scriptsize(Definition h)}
\UnaryInfC{$\Gamma \vdash h\left(i\right)=f\left(n-i-1\right)$}
\RightLabel{\scriptsize(Eql)}
\UnaryInfC{$\Gamma ,k=i\vdash h\left(k\right)=f\left(n-k-1\right)$}
\RightLabel{\scriptsize(Hyp)}
\AxiomC{}
\UnaryInfC{$\Gamma ,k\in 0..i-1\vdash g\left(k\right)=f\left(n-k-1\right)$}
\RightLabel{\scriptsize(Lemma)}
\UnaryInfC{$\Gamma ,k\in 0..i-1,k\not\in \left\{i,j\right\}\vdash h\left(k\right)=f\left(n-k-1\right)$}
\RightLabel{\scriptsize(OrL)}
\BinaryInfC{$\Gamma ,k\in 0..i-1\cup \left\{i\right\}\vdash h\left(k\right)=f\left(n-k-1\right)$}
\RightLabel{\scriptsize(ImplR)}
\UnaryInfC{$\Gamma \vdash \forall k.k\in 0..i+1-1\Rightarrow h\left(k\right)=f\left(n-k-1\right)$}
\RightLabel{\scriptsize(Eql)}
\UnaryInfC{$\Gamma \vdash \left[g.=h\right]\left[i.=i+1\right]\left[j.=j-1\right]\forall k.k\in 0..i-1\Rightarrow g\left(k\right)=f\left(n-k-1\right)$}
\end{prooftree}
.

For `i+1..j-1` narrow `i..j` invariant
\begin{prooftree}
\RightLabel{\scriptsize(Hyp)}
\AxiomC{}
\UnaryInfC{$\Gamma ,g\left(k'\right)=f\left(k'\right)\vdash g\left(k'\right)=f\left(k'\right)$}
\RightLabel{\scriptsize(Triv)}
\AxiomC{}
\UnaryInfC{$k'\in i+1..j-1\vdash k'\in i..j$}
\RightLabel{\scriptsize(ImplL)}
\BinaryInfC{$\Gamma ,\forall k\in i..j\Rightarrow g\left(k\right)=f\left(k\right),k'\in i+1..j-1\vdash g\left(k'\right)=f\left(k'\right)$}
\RightLabel{\scriptsize(ImplR)}
\UnaryInfC{$\Gamma ,\forall k\in i..j\Rightarrow g\left(k\right)=f\left(k\right)\vdash \forall k\in i+1..j-1\Rightarrow h\left(k\right)=f\left(k\right)$}
\end{prooftree}
.


And `j-1..n-1` is equivalent to 0..i-1
\begin{prooftree}
\RightLabel{\scriptsize(Hyp)}
\AxiomC{}
\UnaryInfC{$\Gamma ,g\left(i\right)=f\left(i\right)\vdash g\left(i\right)=f\left(i\right)$}
\RightLabel{\scriptsize(Triv)}
\AxiomC{}
\UnaryInfC{$\Gamma \vdash i\in i..j$}
\RightLabel{\scriptsize(ImplL)}
\BinaryInfC{$\Gamma ,\forall k.k\in i..j\Rightarrow g\left(k\right)=f\left(k\right)\vdash g\left(i\right)=f\left(i\right)$}
\RightLabel{\scriptsize(Hyp)}
\AxiomC{}
\UnaryInfC{$\Gamma ,k\in j+1..n-1\vdash g\left(k\right)=f\left(n-k-1\right)$}
\RightLabel{\scriptsize(Lemma)}
\UnaryInfC{$\Gamma ,k\in j+1..n-1,k\not\in \left\{i,j\right\}\vdash h\left(k\right)=f\left(n-k-1\right)$}
\RightLabel{\scriptsize(OrL)}
\BinaryInfC{$\Gamma ,k=j\vee k\in j+1..n-1\vdash h\left(k\right)=f\left(n-k-1\right)$}
\RightLabel{\scriptsize(SplitRange)}
\UnaryInfC{$\Gamma ,k\in j-1+1..n-1\vdash h\left(k\right)=f\left(n-k-1\right)$}
\RightLabel{\scriptsize(ImplR)}
\UnaryInfC{$\Gamma \vdash \forall k.k\in j-1+1..n-1\Rightarrow h\left(k\right)=f\left(n-k-1\right)$}
\RightLabel{\scriptsize(Eql)}
\UnaryInfC{$\Gamma \vdash \left[g.=h\right]\left[i.=i+1\right]\left[j.=j-1\right]\forall k.k\in j+1..n-1\Rightarrow g\left(k\right)=f\left(n-k-1\right)$}
\end{prooftree}


### Post

To combine the three invariants they need to have the same shape. So we need to prove that i and j meet in the middle

$\Gamma ,i\geqslant j,g\left(k\right)=f\left(k\right)\vdash g\left(k\right)=f\left(n-k-1\right)$

To do so combine i >= j and i <= j
\begin{prooftree}
\RightLabel{\scriptsize(EqlRefl)}
\AxiomC{}
\UnaryInfC{$\Gamma \vdash f\left(i\right)=f\left(i\right)$}
\RightLabel{\scriptsize(Eql)}
\UnaryInfC{$\Gamma ,i+i=n-1,g\left(i\right)=f\left(i\right)\vdash g\left(i\right)=f\left(n-i-1\right)$}
\RightLabel{\scriptsize(Triv)}
\AxiomC{}
\UnaryInfC{$\vdash i\in i..i$}
\RightLabel{\scriptsize(ImplL)}
\BinaryInfC{$\Gamma ,\forall k.k\in i..i\Rightarrow g\left(k\right)=f\left(k\right)\vdash g\left(i\right)=f\left(n-i-1\right)$}
\RightLabel{\scriptsize(Eql)}
\UnaryInfC{$\Gamma ,i=j,s\in i..j\vdash g\left(s\right)=f\left(n-s-1\right)$}
\RightLabel{\scriptsize(ImplR)}
\UnaryInfC{$\Gamma ,i\geqslant j,i\leqslant j\vdash \forall k.k\in i..j\Rightarrow g\left(k\right)=f\left(n-k-1\right)$}
\end{prooftree}

The other two parts are already in the right shape
\begin{prooftree}
\RightLabel{\scriptsize(Hyp)}
\AxiomC{}
\UnaryInfC{$\Gamma ,\forall k.k\in 0..i-1\Rightarrow g\left(k\right)=f\left(n-k-1\right)\vdash \forall k.k\in 0..i-1\Rightarrow g\left(k\right)=f\left(n-k-1\right)$}
\end{prooftree}
\begin{prooftree}
\RightLabel{\scriptsize(Hyp)}
\AxiomC{}
\UnaryInfC{$\Gamma ,\forall k.k\in j+1..n-1\Rightarrow g\left(k\right)=f\left(n-k-1\right)\vdash \forall k.k\in j+1..n-1\Rightarrow g\left(k\right)=f\left(n-k-1\right)$}
\end{prooftree}


Merge them to prove the Post condition:
\begin{prooftree}
\RightLabel{\scriptsize(Hyp)}
\AxiomC{}
\UnaryInfC{$\Gamma ,\forall k.k\in \left(0..i-1\cup i..j\cup j+1..n-1\right)\Rightarrow g\left(k\right)=f\left(n-k-1\right)\vdash \forall k.k\in \left(0..i-1\cup i..j\cup j+1..n-1\right)\Rightarrow g\left(k\right)=f\left(n-k-1\right)$}
\end{prooftree}


### Nat:

$j+1-i$
\begin{prooftree}
\RightLabel{\scriptsize(Hyp)}
\AxiomC{}
\UnaryInfC{$i\leqslant j+1\vdash j+1\geqslant i$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$i\leqslant j+1\vdash j+1-i\geqslant 0$}
\end{prooftree}

### Progress:
\begin{prooftree}
\RightLabel{\scriptsize(Triv)}
\AxiomC{}
\UnaryInfC{$\vdash 0<2$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$\vdash j-1+1-\left(i+1\right)<j+1-i$}
\RightLabel{\scriptsize(Simpl)}
\UnaryInfC{$\vdash \left[i.=i+1\right]\left[j.=j-1\right]j+1-i<j+1-i$}
\end{prooftree}

```C
int f[10] = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11};
int i;
int j;
#define n 10 

int reverse() {
    i = 0;
    j = n - 1;
    while (i < j) {
        temp = f[i];
        f[i] = f[j]
        f[j] = temp;
        i = i + 1;
        j = j - 1;
    }
    return 0;
}
```


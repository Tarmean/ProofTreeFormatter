Formatter for proof trees. 

Example:

          she
          ----
          np
                runs
                ----
                s\np;
                regularly
                ----
                (s\np)\(s\np)
            ---- <
            s\np
                in
                ----
                ((s\np)\(s\np))/np
                    the
                    ----
                    np/n;
                    park
                    ----
                    n
                ----  >
                np
            ----  >
            ((s\np)\(s\np))       
          ----  <
          s\np
    ----  <
    s

![Rendered](Example.png)


Quick and dirty formatter that compiles ascii syntax into latex bussproof trees. I usually use it within pandoc so it probably should be a pandoc filter instead of a seperate program.

To have multiple proofs on the same level these both work:


      child2
        child1
    ----
    base

and

      child2;
      child1
    ----
    base

the semicolon notation generally is more readable for larger trees. Note that no whitespace is allowed after `----` and `;`

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
            (s\np)\(s\np)       
          ----  <
          s\np
    ----  <
    s




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




       they
       ----
       np
       ----  T
       s/(s\np);
       named
       ----
       ((s\np)/np)/np
     ----  >B2
     (s/np)/np;
     their son Stan and their daughter Shelly
     ----
     s\((s/np)/np)
    ----  <
    s


        their son
        ----
        np
        ----  T
        (s/np)\((s/np)/np)
          Stan
          ----
          np
          ----  T
          s\(s/np)
    ----  <B
    s\((s/np)/np)

        their daughter
        ----
        np
        ----  T
        (s/np)\((s/np)/np)
          Shelly
          ----
          np
          ----  T
          s\(s/np)
    ----  <B
    s\((s/np)/np)

     their daughter Shelly
     ----
     s\((s/np)/np)
       and
       ----
       (X\X)/X
         their son Stan
         ----
         s\((s/np)/np)
    ----  andrule
    s\((s/np)/np)


      their
      ----
      np/n
        daughter
        ----
        n
    ----  >
    np

      their
      ----
      np/n
        son
        ----
        n
    ----  >
    np


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


         The
         ----
         np/n
             wine
             ----
             n
               that
               ----
               (n\n)/(s/np)
                 she
                 ----
                 np
                 ----  T
                 s/(s\np);
                 bought
                 ----
                 (s\np)/np
               ----  >B
               s/np
             ----  >
             n\n
         ----  <
         n
      ----  >
      np;
      gave me a headache
      ----
      s\np
    ----  <
    s


        gave
        ----
        ((s\np)/np)/np
          me
          ----
          np
      ----  >
      (s\np)/np
            a
            ----
            np/n
              headache
              ----
              n
          ----  >
          np
    ----  >
    s\np


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

      should
      ----
      ((s\np)/np)/((s\np)/np)
        watch
        ----
        (s\np)/np
          and
          ----
          ((X\X)/X)
            analyse
            ----
            (s\np)/np
      ---- andrule
      ((s\np)/np)
    ---- >
    (s\np)/np
    

     the
     ----
     np/n
        angry
        ----
        n/n
            referee
            ----
            n
      ---- >
      n
    ---- >
    np

      the angry referee
      ----
      np
        should watch and analyse
        ----
        (s\np)/np
             the
             ----
             np/n
                video
                ----
                n
            ---- >
            np
       ---- >
       s\np
     ---- <
     s

# 2

> Marshall persuaded Lily to fogive Barney

### a)

Object control since persuade is an object control verb.

### b)

      Marshall
      ----
      np: marshall'
            persuaded
            ----
            ((s\np)/(sto\np))/np: \o p s. persuaded'(s, o, p(o))
                Lily
                ----
                np: lily'
          ---- >
          (s\np)/(sto\np): \p s. persuaded'(s, lily', p(lily'))
              to forgive
              ----
              (sto\np)/np: \y x. forgive'(x,y)
                Barney
                ----
                np: barney'
            ---- >
            sto\np: \x. forgive'(x, barney')
        ---- >
        s\np: \s. persuaded'(s, lily', forgive'(lily', barney')
    ---- <
    s: persuaded'(marshall', lily', forgive'(lily', barney')

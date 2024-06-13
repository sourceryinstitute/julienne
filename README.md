Julienne
========

Spun off from the [Sourcery] proving ground and inspired by [Veggies], Julienne provides unit-testing and string-handling capabilities for modern Fortran. 
Julienne's originator developed Sourcery, enjoyed using Veggies, and sought to capture a thin slice of the Veggies capabilities while avoiding the compiler limitations that prevented use of Sourcery or Veggies.
Julienne is achieved through minimalism and isolation.
offering a thin slice of the capabilities of Veggies with no external dependencies. 
This is accomplished by incorporating only those parts of Sourcery that the recent versions of most Fortran compilers support.
The latter parts are mostly related to strings.

Building and Testing
--------------------
### GNU (`gfortran`)
```
fpm test
```

### NAG (`nagfor`)
```
fpm test --compiler nagfor --flag -fpp
```

### LLVM Flang
**Experimental**
```
fpm test --compiler flang-new --flag "-mmlir -allow-assumed-rank"
```
LLVM Flang's capabilities are evolving rapidly so we recommend building a recent version of the main branch of llvm-project.
A script that could be helpful for doing so is [here].

Building and Testing
--------------------

[Sourcery]: https://github.com/sourceryinstitute/sourcery
[Veggies]: https://gitlab.com/everythingfunctional/veggies
[here]: https://github.com/rouson/handy-dandy/blob/7caaa4dc3d6e5331914a3025f0cb1db5ac1a886f/src/fresh-llvm-build.sh

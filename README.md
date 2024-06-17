Julienne
========

Spun off from [Sourcery] and inspired by [Veggies], Julienne is a modern-Fortran unit-testing framework and utility for manipulating strings, including command lines and input/output format strings. 
This repository's name derives from the term for vegetables sliced into thin strings: julienn vegetables.
This software repository captures the authors' most frequently used thin slice of the Veggies and Sourcery repositories while avoiding certain compiler limitations.
Julienne achieves portability across compilers through minimalism and isolation.
Thus Julienne has no external dependencies and offers limited but widely useful capabilities.
A need for unit testing support drive the creation of Julienne.
The string-handlikng capabilities are included primarily because they support Julienne's unit-testing code.

Examples
--------
For examples of how to use Julienne, please see the [examples](./examples) subdirectory.

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
where the flags `-mmlir -allow-assumed-rank` turn on LLVM Flang's experimental support for Fortran's assumed-rank dummy arguments.
Flang's capabilities are evolving rapidly so we recommend building a recent version of the main branch of llvm-project.
A script that might be helpful for doing so is in the [handy-dandy] repository.

Documentation
-------------
See our online [documentation] or build the documentation locally by installing [FORD] and executing
```
ford ford.md
```
[Sourcery]: https://github.com/sourceryinstitute/sourcery
[Veggies]: https://gitlab.com/everythingfunctional/veggies
[here]: https://github.com/rouson/handy-dandy/blob/7caaa4dc3d6e5331914a3025f0cb1db5ac1a886f/src/fresh-llvm-build.sh
[documentation]: https://sourceryinstitute.github.io/assert/
[FORD]: https://github.com/Fortran-FOSS-Programmers/ford 
[handy-dandy]: https://github.com/rouson/handy-dandy/blob/7caaa4dc3d6e5331914a3025f0cb1db5ac1a886f/src/fresh-llvm-build.sh

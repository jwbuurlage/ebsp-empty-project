# Empty project for EBSP programs

This repository can serve as a template for [EBSP](http://www.codu.in/ebsp) programs. This README will help you get started on running and writing EBSP programs on your Parallella. We will assume you have access to the following, it should be enough to follow the [getting started guide](https://www.parallella.org/quick-start/) found on the Parallella website.

- A (16-core) [Parallella](http://www.parallella.org) board.
- Installation of version 2016.3 of the ESDK, and an environment variable `EPIPHANY_HOME` should be set to the proper path.

By default all the build tools we need should be available. If this is not the case, installing `make`, `git` and a recent version of `gcc` should be enough.

## Cloning the repository

Open a terminal, or `ssh` into the Parallella, and run the command:

    $ git clone https://github.com/coduin/ebsp-empty-project.git <your project>

Where `<your project>` should be substituted with a suitable name for your project. Afterwards, you can `cd` into the empty project's directory:

    $ cd <your project>

Inside this directory you will find a directory `ext`, which contains the relevant headers and libraries for EBSP, and a directory `src` containing the code for the EBSP program. Also, a `Makefile` is provided which will compile the project using default settings. To build the "Hello World" program that is include by default simply run:

    $ make

This will compile the *host program* and a *kernel*. When you run the host program using:

    $ bin/host_program

It will load the kernel `ecore_program` on each Epiphany core. You should see the following output:

    $08: Hello World from processor 8 / 16
    $01: Hello World from processor 1 / 16
    $07: Hello World from processor 7 / 16
    ...

## Next steps

- Read the [documentation of EBSP](http://www.codu.in/ebsp/docs) in which we explain step-by-step what you can do with the EBSP library.
- Look at the examples in the [EBSP repository](http://www.github.com/coduin/epiphany-bsp).
- If you find any issues please [open an issue on GitHub](http://www.github.com/coduin/epiphany-bsp/issues). If you have general comments or remarks please let us know!

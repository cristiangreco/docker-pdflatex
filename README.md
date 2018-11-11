# pdflatex docker image

[![Docker
hub](https://img.shields.io/docker/pulls/cristiangreco/pdflatex.svg)](https://hub.docker.com/r/cristiangreco/pdflatex/)
[![Size](https://img.shields.io/microbadger/image-size/cristiangreco/pdflatex/latest.svg)](https://hub.docker.com/r/cristiangreco/pdflatex/)



The texlive distribution packaged as a Docker image!

Use this image to compile latex sources without installing all latex packages on your system.

## Basic usage

Simply `cd` into your sources path and run `pdflatex` in the container mounting
current directory as a volume:

```sh
$ docker run --rm -it -v $(pwd):/sources cristiangreco/pdflatex pdflatex doc.tex
```

Output file `doc.pdf` will be placed in your sources directory.

## Multiple passes

If you need to make multiple passes just run `pdflatex` multiple times inside
the container:

```sh
$ docker run --rm -it -v $(pwd):/sources cristiangreco/pdflatex /bin/sh -c "pdflatex doc.tex && pdflatex doc.tex"
```

## Yet another docker image: how is this different?

You can find a number of different images on [Docker
Hub](https://hub.docker.com/search/?isAutomated=0&isOfficial=0&page=1&pullCount=0&q=latex&starCount=0)
which include `pdflatex`.

This image is based on Debian and aims to be as small as possible while still
providing the full latex distribution.

## License

Released under the [MIT license](LICENSE).

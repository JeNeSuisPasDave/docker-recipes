#! /bin/bash
#
docker run -i -t --rm --volume "`pwd`":/tmp texlive pdflatex main

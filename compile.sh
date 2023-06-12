#!/bin/sh

# MIT License
# 
# Copyright (c) 2023 Ken'ichi Fukamachi <fukachan@fmlorg>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


# Configurations
image=fmlorg/texlive-debian-ja 

# functions
usage_show () {
    echo $USAGE
}

version_show () {
    docker run --rm -it -v $PWD:/workdir --user $(id -u):$(id -g) $image ls -l /usr/local/texlive
}

#
# MAIN
#

# parse command line options
flag=""
USAGE="$0 [-hv] ..."
while getopts vh f
do
    case $f in
        v) version_show; exit 0;;
        h)   usage_show; exit 1;;
    esac
done
shift $(expr $OPTIND - 1)

# e.g.
# ./compile.sh "platex -kanji utf8 main.tex ; platex -kanji utf8 main.tex ; dvipdfmx -f ./cid-x.map -o main.pdf main.dvi"
docker run --rm -it -v $PWD:/workdir --user $(id -u):$(id -g) $image sh -c "$*"

exit 0

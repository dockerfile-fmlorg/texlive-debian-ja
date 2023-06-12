# texlive-ja

You can find this docker image at 
[fmlorg/texlive-debian-ja](https://hub.docker.com/r/fmlorg/texlive-debian-ja).


## Usage

This docker image is a TeX compilation wrapper, so you can use it in the following way. 
```
docker run --rm -it -v $(pwd -P):/workdir --user $(id -u):$(id -g) fmlorg/texlive-debian-ja platex -kanji utf8 main.tex
```
This repository provides a utility `compile.sh` for convenience.
```
sh compile.sh platex -kanji utf8 main.tex
```
Also,
```
sh compile.sh -v
```
shows the texlive version details.


## History

- based on 
    - https://hub.docker.com/r/paperist/texlive-ja
    - https://github.com/Paperist/texlive-ja/blob/main/debian/Dockerfile
- faults
    - ? it cannot handle *.eps -> [NOT YET].
    - X it has not "make"      -> [FIXED].

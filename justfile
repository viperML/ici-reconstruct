default:
  just --list

render:
    cd ./src && pandoc -o render.tex --extract-media=media ../main.ipynb

watch:
  tectonic -X watch

build:
  tectonic -X build
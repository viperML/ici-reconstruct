default:
  just --list

render:
    cd ./src && pandoc -o render.tex --extract-media=media --listings ../main.ipynb

watch:
  tectonic -X watch -x "build"

build:
  tectonic -X build

ci:
  just render
  just build
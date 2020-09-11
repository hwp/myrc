#!/bin/bash

SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

PLUGINS='vim-airline vim-fugitive nerdtree syntastic vim-autoformat vim-flake8 vim-tex csv.vim jupytex.vim vjs'

for p in $PLUGINS
do
  >&2 echo "update plugin : ${p}" &&
  ( cd "${SRC_DIR}/bundle/${p}" && git pull )
done

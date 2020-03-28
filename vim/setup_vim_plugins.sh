#!/bin/bash
#pathogen nerdtree syntastic vim-airline vim-fugitive vim-autoformat vim-flake8

SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

>&2 echo 'create directories' &&
mkdir -p $SRC_DIR/{autoload,bundle} &&
>&2 echo 'download pathogen' &&
wget -qc https://tpo.pe/pathogen.vim --directory-prefix=$SRC_DIR/autoload &&
>&2 echo 'download plugins' &&
[ -d bundle/vim-airline ]    || git clone -q git@github.com:vim-airline/vim-airline.git bundle/vim-airline &&
[ -d bundle/vim-fugitive ]   || git clone -q git@github.com:tpope/vim-fugitive.git      bundle/vim-fugitive &&
[ -d bundle/nerdtree ]       || git clone -q git@github.com:scrooloose/nerdtree.git     bundle/nerdtree &&
[ -d bundle/syntastic ]      || git clone -q git@github.com:scrooloose/syntastic.git    bundle/syntastic &&
[ -d bundle/vim-autoformat ] || git clone -q git@github.com:Chiel92/vim-autoformat.git  bundle/vim-autoformat &&
[ -d bundle/vim-flake8 ]     || git clone -q git@github.com:nvie/vim-flake8.git         bundle/vim-flake8 &&
>&2 echo 'download fonts' &&
wget -qc https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf --directory-prefix=$SRC_DIR/fonts &&
>&2 echo 'create links : vimrc' &&
ln -fs $SRC_DIR/vimrc $HOME/.vimrc &&
>&2 echo 'create links : autoload' &&
mkdir -p $HOME/.vim/autoload &&
for x in autoload/*
do 
  ln -fs "$SRC_DIR/${x}" $HOME/.vim/autoload/ || exit 2
done &&
>&2 echo 'create links : bundle' &&
mkdir -p $HOME/.vim/bundle &&
for x in bundle/*
do 
  [ -d "$HOME/.vim/${x}" ] || ln -fs "$SRC_DIR/${x}" $HOME/.vim/bundle/ || exit 2
done &&
>&2 echo 'create links : ftplugin' &&
mkdir -p $HOME/.vim/ftplugin &&
for x in ftplugin/*
do 
  ln -fs "$SRC_DIR/${x}" $HOME/.vim/ftplugin/ || exit 2
done &&
>&2 echo 'create links : fonts' &&
mkdir -p $HOME/.config/fontconfig/conf.d &&
ln -fs $SRC_DIR/fonts/10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d/ &&
mkdir -p $HOME/.fonts &&
ln -fs $SRC_DIR/fonts/PowerlineSymbols.otf $HOME/.fonts &&
>&2 echo 'finished'

#!/bin/bash
#pathogen nerdtree syntastic vim-airline vim-fugitive vim-autoformat vim-flake8

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
cd ~/.vim/bundle/ && \
git clone git@github.com:vim-airline/vim-airline.git && \
git clone git@github.com:tpope/vim-fugitive.git && \
git clone git@github.com:scrooloose/nerdtree.git && \
git clone git@github.com:scrooloose/syntastic.git && \
git clone git@github.com:Chiel92/vim-autoformat.git && \
git clone git@github.com:nvie/vim-flake8.git && \
cd - && \
mkdir -p ~/.config/fontconfig/conf.d && \
ln -s $PWD/10-powerline-symbols.conf ~/.config/fontconfig/conf.d/ && \
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf && \
mkdir ~/.fonts && \
mv PowerlineSymbols.otf ~/.fonts/


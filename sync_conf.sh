#!/bin/bash

set -e

DIR_SHORT=$(dirname "$0")
DIR=$(readlink -f "$DIR_SHORT")

(cd $DIR && git pull)
cp -r $DIR/bash/* ~/

cp ~/.bashrc $DIR/bash
cp ~/.bash_aliases $DIR/bash
cp ~/.bash_functions.sh $DIR/bash
cp ~/.tmux.conf $DIR/bash
cp ~/.vimrc $DIR/bash
cp ~/.Xmodmap $DIR/bash
cp ~/.zshrc $DIR/bash

(cd $DIR && git add .)
(cd $DIR && git commit -m 'Auto commit.')
(cd $DIR && git push)


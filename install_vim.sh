#!/bin/sh
# fork by http://github.com/vgod/vimrc
VIMHOME=~/.vim

warn() {
  echo "$1" >&2
}

die() {
  warn "$1"
  exit 1
}

[ -e "$VIMHOME/vimrc" ] && die "$VIMHOME/vimrc already exists."
[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

git clone git://github.com/s90198123/vimfiles.git "$VIMHOME"
cd "$VIMHOME"
git submodule update --init

echo "source ~/.vim/vimrc" > ~/.vimrc
echo "source ~/.vim/gvimrc" > ~/.gvimrc

cd ~/.vim/bundle/command-t/ruby/command-t
(ruby extconf.rb && make) || warn "Can't compile Command-T."

echo "vimrc is installed."


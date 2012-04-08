# Dotfiles

This is a little repo of what I like to run.  It's composed of:

# Installation

Symlink the dotfiles into your home.

    for f in $(ls -d .*); do ln -is $f ~; done

Make any platform specific modules.

    make

Note: that CommandT is only tested on Darwin

## OS X

Install [brew][brew] into `/usr/local`, [XQuartz][XQuartz] into `/opt`, [rvm][rvm] into `~/.rvm`

    brew install git
    brew install zsh
    brew install macvim --override-system-vim --enable-clipboard
    brew install rxvt-unicode --disable-iso14755
    brew install haskell-platform
    cabal install xmonad
    cabal install xmonad-contrib

Add the [github token](https://github.com/account) and github password to the
keychain under the name `github.token` and `github.password` including the
github account name, or to a chmod 0600 file ~/.github.token

[brew]:https://github.com/mxcl/homebrew/wiki/installation
[rvm]:http://beginrescueend.com/rvm/install/
[XQuartz]:http://xquartz.macosforge.org/trac/wiki/Releases

## vim

  * SlimV
  * CommandT
  * Syntax of source I edit
  * Colorschemes I like

## X11

  * xinitrc for standalone launching for XQuartz.org
  * XMonad for crashless tiled window management
  * Xresources for URxvt and Xft

## zsh

  * Pulling in most of what [cloudhead](https://github.com/cloudhead/dotfiles) has

### Copying

Fork what you want, give attribution if it's needed, my contributions released with CC0 no rights reserved.

  * Command-T: Copyright 2010-2011 Wincent Colaiuta.  Licensed under BSD. https://wincent.com/products/command-t
  * Swank Clojure: Copyright (C) 2008-2011 Jeffrey Chu, Phil Hagelberg, Hugo Duncan, and contributors.  Licensed under the EPL. (See the file COPYING.)
  * Slimv: Public Domain
  * Slime: Public Domain
  * HAML/SASS/SCSS: (c) Tim Pope https://github.com/tpope/vim-haml
  * Solarized: (c) 2011 Ethan Schoonover.  Licensed under MIT. http://ethanschoonover.com/solarized


# Dotfiles

This is a little repo of what I like to run.  It's composed of:

# Installation

Symlink the dotfiles into your home.

    for f in $(ls -d .*); do ln -is $f ~; done

Make any platform specific modules.

    make

Note: that CommandT is only tested on Darwin

## vim

  * SlimeV
  * CommandT
  * Colorschemes I like

## X11

  * xinitrc for standalone launching for XQuartz.org
  * XMonad for crashless tiled window management
  * Xresources for URxvt and Xft

## zsh

  * Pulling in most of what cloudhead has

### Copying

Fork what you want, give attribution if it's needed, my contributions released with CC0 no rights reserved.

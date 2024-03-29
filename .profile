#!/bin/bash

# Loaded in login shells and .xinitrc

# System paths
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Package paths
export PATH=/usr/local/mysql/bin:/usr/local/hadoop/bin:/usr/local/go/bin:/usr/local/gcutil:$PATH

# User paths
export PATH=$HOME/bin:$HOME/sbin:$HOME/.cargo/bin:$HOME/.cabal/bin:$PATH

export MANPATH=/usr/local/man:/usr/local/mysql/man:/opt/man:/opt/share/man:$MANPATH

export EDITOR=vim
export RSH="ssh"
export CVS_RSH="ssh"
export LANG="en_US.UTF-8"
export LC_TYPE="en_US.UTF-8"
export CLICOLOR="true"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_OPTS="-Xmx2048M"
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M -Xmx2048M"

export GOROOT="/usr/local/go"
export GOPATH="$HOME"

export PLAN9=/usr/local/plan9
export PATH=$PATH:$PLAN9/bin
export MANPATH=$MANPATH:$PLAN9/man

[ -s $HOME/.local.profile   ] && . $HOME/.local.profile
[ -s $HOME/.rvm/scripts/rvm ] && . $HOME/.rvm/scripts/rvm
# [ -s $HOME/.nix-profile/etc/profile.d/nix.sh ] && . $HOME/.nix-profile/etc/profile.d/nix.sh 

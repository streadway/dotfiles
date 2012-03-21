#!/bin/sh

# Loaded in login shells and .xinitrc

# System paths
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Package paths
export PATH=/usr/local/mysql/bin:/usr/local/hadoop/bin:$PATH

# User paths
export PATH=$HOME/bin:$HOME/.cabal/bin:$HOME/go/bin:$HOME/.go/bin:$PATH

export MANPATH=/usr/local/man:/usr/local/mysql/man:/opt/man:/opt/share/man:$MANPATH

export EDITOR="vim"
export RSH="ssh"
export CVS_RSH="ssh"
export LANG="en_US.UTF-8"
export LC_TYPE="en_US.UTF-8"
export CLICOLOR="true"

export JAVA_OPTS="-Xmx2048M"
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M -Xmx2048M"

export GOROOT="$HOME/go"
export GOPATH="$HOME/.go:$GOROOT"

[ -s $HOME/.local.profile   ] && . $HOME/.local.profile
[ -s $HOME/.rvm/scripts/rvm ] && . $HOME/.rvm/scripts/rvm

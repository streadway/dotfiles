#!/bin/sh

# Loaded in login shells and .xinitrc

# System paths
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Package paths
export PATH=/usr/local/mysql/bin:/usr/local/hadoop/bin:$PATH

# User paths
export PATH=$HOME/bin:$HOME/.cabal/bin:$HOME/.go/bin:$PATH

export MANPATH=/usr/local/man:/usr/local/mysql/man:/opt/man:/opt/share/man:$MANPATH

export EDITOR="vim"
export RSH="ssh"
export CVS_RSH="ssh"
export LANG="en_US.UTF-8"
export LC_TYPE="en_US.UTF-8"
export CLICOLOR="true"

export HADOOP_HOME=/usr/local/hadoop
export PIG_CLASSPATH=/usr/local/hadoop/conf

export JAVA_OPTS="-Xmx768m"

[ -f $HOME/.local.profile ] && . $HOME/.local.profile

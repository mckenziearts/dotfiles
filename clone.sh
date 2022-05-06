#!/bin/sh

echo "Cloning repositories..."

SITES=$HOME/Sites
ISDG=$SITES/isdg
LARAVEL=$SITES/laravel

# Personal
git clone git@github.com:driesvints/driesvints.com.git $SITES/driesvints.com

# ISDG
git clone git@github.com:blade-ui-kit/awesome-tall-stack.git $ISDG/awesome-tall-stack

# Laravel
git clone git@github.com:laravel/beep.git $LARAVEL/beep

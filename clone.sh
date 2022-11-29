#!/bin/sh

echo "Cloning repositories..."

SITES=$HOME/Sites
SHOPPER=$SITES/shopper
LARAVEL=$SITES/laravel

# Personal
git clone git@github.com:mckenziearts/arthurmonney.me.git $SITES/arthurmonney.me
git clone git@github.com:mckenziearts/dotfiles.git $SITES/dotfiles

# Shopper
git clone git@github.com:shopperlabs/framework.git $SHOPPER/framework
git clone git@github.com:shopperlabs/laravelshopper.dev.git $SHOPPER/laravelshopper.dev
git clone git@github.com:shopperlabs/demo.laravelshopper.io.git $SHOPPER/demo.laravelshopper.io
git clone git@github.com:shopperlabs/veronique.shop.git $SHOPPER/veronique.shop


# Laravel
git clone git@github.com:laravelcm/laravel.cm.git $LARAVEL/laravel.cm
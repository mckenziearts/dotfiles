#!/bin/sh

echo "Cloning repositories..."

SITES=$HOME/Sites
SHOPPERLABS=$SITES/ShopperLabs
LARAVELCM=$SITES/Laravelcm
PROJECTS=$SITES/Projects
OSS=$SITES/OSS

# Projects
git clone git@github.com:mckenziearts/arthurmonney.me.git $PROJECTS/arthurmonney.me
git clone git@github.com:shopperlabs/goshen-tabernacle.com.git $PROJECTS/goshen-tabernacle.com
git clone git@github.com:shopperlabs/veronique.shop.git $PROJECTS/veronique.shop
git clone git@github.com:shopperlabs/misstafessentials.com.git $PROJECTS/misstafessentials.com

# Open Source
git clone git@github.com:shopperlabs/shopper.git $OSS/shopperlabs/shopper
git clone git@github.com:shopperlabs/laravelshopper.dev.git $OSS/shopperlabs/laravelshopper.dev
git clone git@github.com:shopperlabs/demo.laravelshopper.dev.git $OSS/shopperlabs/demo.laravelshopper.dev
git clone git@github.com:shopperlabs/docs.git $OSS/shopperlabs/docs
git clone git@github.com:shopperlabs/starter-kits.git $OSS/shopperlabs/starter-kits
git clone git@github.com:shopperlabs/laravel-sail-starter-kit.git $OSS/shopperlabs/laravel-sail-starter-kit
git clone git@github.com:shopperlabs/shopper-types.git $OSS/shopperlabs/shopper-types
git clone git@github.com:mckenziearts/dotfiles.git $OSS/mckenziearts/dotfiles
git clone git@github.com:mckenziearts/laravel-notify.git $OSS/mckenziearts/laravel-notify
git clone git@github.com:mckenziearts/blade-untitledui-icons.git $OSS/mckenziearts/blade-untitledui-icons
git clone git@github.com:laravelcm/filament-starter-kit.git $OSS/laravelcm/filament-starter-kit
git clone git@github.com:laravelcm/laravel-subscriptions.git $OSS/laravelcm/laravel-subscriptions
git clone git@github.com:laravelcm/livewire-slide-overs.git $OSS/laravelcm/livewire-slide-overs

# Shopper Labs
git clone git@github.com:shopperlabs/art.git $SHOPPERLABS/art
git clone git@github.com:shopperlabs/.github.git $SHOPPERLABS/.github
git clone git@github.com:shopperlabs/shopperlabs.co.git $SHOPPERLABS/shopperlabs.co
git clone git@github.com:shopperlabs/universy-app.git $SHOPPERLABS/universy-app
git clone git@github.com:shopperlabs/institute-saas.git $SHOPPERLABS/universy-saas

# Laravel Cameroon
git clone git@github.com:laravelcm/laravel.cm.git $LARAVELCM/laravel.cm
git clone git@github.com:laravelcm/.github.git $LARAVELCM/.github
git clone git@github.com:laravelcm/laravel-cloud.git $LARAVELCM/laravel-cloud

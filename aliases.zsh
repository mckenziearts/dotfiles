# Shortcuts
alias reloadshell="source $HOME/.zshrc"
alias c="clear"

# Directories
alias dotfiles="cd $DOTFILES"
alias sites="cd $HOME/Sites"
alias projects="sites && cd Projects/"
alias laravelcm="sites && cd Laravelcm/"
alias oss="sites && cd OSS/"
alias shopperlabs="sites && cd ShopperLabs/"

# PHP
alias cu="composer update"
alias ci="composer install"
alias cfresh="rm -rf vendor/ composer.lock && ci"
alias cda="composer du -o"

# Laravel
alias artisan="php artisan"
alias fresh="artisan migrate:fresh --seed"
alias tinker="artisan tinker"
alias seed="artisan db:seed"
alias migrate="artisan migrate"
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run dev"

# Git
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias fetch="git fetch --all"
alias merge="git merge"
alias rebase="git rebase"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias force="git push --force"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"
alias gclone="git clone"

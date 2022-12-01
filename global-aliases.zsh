# Shortcuts
alias reloadshell="source $HOME/.zshrc"
alias c="clear"

# Directories
alias dotfiles="cd $DOTFILES"
alias sites="cd $HOME/Sites"
alias lara="sites && cd laravel/"
alias shopper="sites && cd shopper/"

# PHP
alias cu="composer update"
alias ci="composer install"
alias cfresh="rm -rf vendor/ composer.lock && ci"

# Laravel
alias artisan="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias tinker="php artisan tinker"
alias seed="php artisan db:seed"
alias serve="php artisan serve"

# JS
alias nfresh="rm -rf node_modules/ yarn.lock && yarn"
alias watch="yarn watch"

# Git
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias fetch="git fetch"
alias merge="git merge"
alias rebase="git rebase"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"
alias gcl="git clone"
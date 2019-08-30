# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/vardy/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
eval `dircolors ~/.dir_colors`

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast sudo vscode mix npm ruby capistrano bundler heroku rake asdf autojump command-not-found github gnu-utils history-substring-search cp)

# Date prompt on the right
RPROMPT='%{$fg[yellow]%}[%*]%{$reset_color%}%'

# default text editor
export EDITOR='mousepad'
export VISUAL='mousepad'

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

DEFAULT_USER=vardy #change to your username

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

export PATH=~/bin:$PATH

#################
## GIT ALIASES ##
#################

function gitall() {
    git add .
    if [ "$1" != "" ]
    then
        git commit -m "$1"
    else
        git commit -m update # default commit message is `update`
    fi # closing statement of if-else block
    git push origin HEAD
}
alias pr="prune"
alias prune="git fetch -p; git removed-branches --prune; git-sweep cleanup --force"
alias gb="git checkout -b"
alias gs="git status"
alias ga="gitall"
alias gc="git checkout"
alias gl="git log --oneline --decorate --graph --all"
alias dd="git checkout master; git pull; git fetch -p; git removed-branches --prune; git push dokku master"
alias hd="git checkout master; git pull; git fetch -p; git removed-branches --prune; git push heroku master && heroku run rails db:migrate"

###################
## RAILS ALIASES ##
###################

alias rs="rails server || bundle exec rails server"
alias rt="rails test || bundle exec rails test"
alias rmi="rails db:migrate || rake db:migrate"
alias rc="rails console || bundle exec rails console"
alias srb="bundle exec srb"

####################
## ELIXIR ALIASES ##
####################

alias coverage="MIX_ENV=test mix coveralls.html"
alias mc="mix ecto.create; md; cd assets; npm install; cd ..; mix ecto.migrate"
alias mm="mix ecto.migrate"
alias ms="mix phx.server"
alias mt="mix format && mix test && mix check"
alias md="HEX_HTTP_CONCURRENCY=1 HEX_HTTP_TIMEOUT=120 mix deps.get"
alias mi="iex -S mix"

#################
## SSH ALIASES ##
#################

alias ra="ansible-playbook --ask-become-pass -i /home/vardy/coding/webdev/ansible/hosts /home/vardy/coding/webdev/ansible/main.yml"

alias main="ssh vardy@192.168.1.15"
alias xps13="ssh vardy@192.168.1.11"
alias htpc="ssh vardy@192.168.1.14"

alias htpctransfer="ruby ~/coding/webdev/htpctransfer/htpctransfer.rb"
alias dbbackup="cd ~/coding/webdev/dbbackup/; ./dbbackup.sh"
alias dbreset="~/coding/webdev/dbreset/dbreset.sh"
alias daily="dbbackup; dbreset"

####################
## SYSTEM ALIASES ##
####################

alias y="yay"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

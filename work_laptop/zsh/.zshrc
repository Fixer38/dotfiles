SH_DISABLE_COMPFIX=true
# Completion for kitty
# kitty + complete setup zsh | source /dev/stdin
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#fpath+=('/home/fixer/.npm-global/lib/node_modules/pure-prompt/functions')

# Path to your oh-my-zsh installation.
export ZSH="/home/fixer/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Ca1se-sensitive completion must be off. _ and - will be interchangeable.
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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
source ~/.zplug/init.zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug 'mfaerevaag/wd', as:command, use:"wd.sh", hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"

zplug "lukechilds/zsh-better-npm-completion"
zplug "g-plane/zsh-yarn-autocompletions", hook-build:"./zplug.zsh", defer:2
zplug "hlissner/zsh-autopair"
zplug "MikeDacre/careful_rm"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "denysdovhan/spaceship-prompt", as:theme
zplug "agkozak/zsh-z"

zplug load

# Stop z polluting the home dir
export _Z_DATA="$HOME/.zdata/.z"

source $ZSH/oh-my-zsh.sh
# NPM global path and Homebrew
export PATH=~/.npm-global/bin:$PATH
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)"

fpath+=~/.zfunc

# Paths
export PATH=$HOME/.cargo/bin:$PATH
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/fixer/Downloads/otfcc/bin/release-x64/
export JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64/
export PATH=$PATH:/home/fixer/.rbenv/versions/2.5.0-dev/bin/

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
fpath=($fpath "/home/fixer/.zfunctions")

#WEBASM paths
export PATH=$PATH:/home/fixer/emsdk-portable/
export PATH=$PATH:/home/fixer/emsdk-portable/clang/fastcomp/build_incoming_64/bin/
export PATH=$PATH:/home/fixer/emsdk-portable/node/8.9.1_64bit/bin/
export PATH=$PATH:/home/fixer/emsdk-portable/emscripten/incoming/

# Set Spaceship ZSH as a prompt
#autoload -U promptinit; promptinit
#prompt spaceship

ZSH_GIT_PROMPT="$HOME/.zsh-git-prompt/zshrc.sh"
CUSTOM_GIT="$HOME/scripts/custom_git.zsh"

[ -s $ZSH_GIT_PROMPT ] && source $ZSH_GIT_PROMPT
[ -s $CUSTOM_GIT ] && source $CUSTOM_GIT

ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%}◒"

# Theme settings
SPACESHIP_DIR_COLOR="yellow"
SPACESHIP_USER_SHOW="true"
SPACESHIP_CHAR_COLOR_SUCCESS="white"
SPACESHIP_CHAR_COLOR_FAILURE="white"


SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  custom_git
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  char          # Prompt character
)

fpath=($fpath "/home/fixer/.zfunctions")
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)
# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
fpath=($fpath "/home/fixer/.zfunctions")

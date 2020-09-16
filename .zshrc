# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/cgx/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="spaceship"
# Settings for "agnoster"
# remove user@hostname
#DEFAULT_USER=$USER
#prompt_context(){}

SPACESHIP_PROMPT_ORDER=(
dir
git
golang
venv
pyenv
exec_time
line_sep
char
jobs
exit_code
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true

SPACESHIP_CHAR_SYMBOL="$ "
SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
SPACESHIP_CHAR_COLOR_SECONDARY="blue"
SPACESHIP_EXEC_TIME_COLOR="red"
SPACESHIP_DIR_PREFIX="┌ "
SPACESHIP_CHAR_PREFIX="└ "
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_COLOR="yellow"

SPACESHIP_GIT_BRANCH_COLOR="green"
SPACESHIP_GIT_STATUS_PREFIX=""
SPACESHIP_GIT_STATUS_SUFFIX=""
SPACESHIP_GIT_STATUS_COLOR="yellow"

SPACESHIP_GOLANG_SYMBOL="Go "

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

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
DISABLE_LS_COLORS="true"

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
plugins=(
  git docker docker-compose zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

setopt histignorespace

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$HOME/.gem/ruby/2.5.0/bin
export PATH=$PATH:$HOME/.gem/ruby/2.6.0/bin
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.npm/bin
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_moduls:$NODE_PATH"
export PATH=$PATH:$NPM_PACKAGES/bin
export PATH=$PATH:$HOME/.portable/bin

export STARDICT_DATA_DIR=$HOME/.local/share/stardict

export MANPATH="$NPM_PACKAGES/share/man:$MANPATH"

export UNCRUSTIFY_CONFIG=$HOME/.uncrustify
export SCONS_CACHE=$HOME/.scons/build_cache

export GITHUB_TOKEN=$(cat $HOME/.github_token)

export QT_QPA_PLATFORMTHEME=gtk2


source $(dirname $(gem which colorls))/tab_complete.sh

alias gfd="cd ~/Downloads && colorls -al --sd"
alias gft="cd ~/docs/thesis/doc && colorls -al --sd"
alias gdt="cd ~/gdrive/Surface/Kansei\ Robot && colorls -al --sd"
alias gsc="cd ~/go/src/github.com/cgxeiji/scholar && colorls -al --sd"
alias cfx="cd ~/.cgx && colorls -al --sd"
alias pac="sudo pacman"
alias pacs="sudo pacman -S"

alias l='colorls --sd'
alias la='colorls -a --sd'
alias ll='colorls -la --sd'

#alias clear='[ $[$RANDOM % 10] = 0 ] && timeout 2 cbeams -o; clear || clear'

alias sudocker='sudo docker'

alias def='/usr/bin/sdcv'

alias unzipjp='unzip -O shift-jis'

c() {clear; cd "$@"; pwd; l}
aur() {git clone https://aur.archlinux.org/"$@".git; cd "$@"; less PKGBUILD; makepkg -sirc; cd ..}
alias cx='c ..'
alias units='units --verbose --one-line'

books() {~/.cgx/.scripts/books.sh "$@"}
papers() {~/.cgx/.scripts/papers.sh "$@"}
pdf() {zathura "$@" 2>/dev/null &!}

rpigo() {sudo docker run --rm -ti -v $(go env GOCACHE):/root/.cache/go-build -v "$HOME/go/src":/go/src rpi-zero-opencv-bin /usr/bin/qemu-arm-static /bin/sh -c "cd $(pwd | grep -o 'src.*'); go build --ldflags '-extldflags \"-static\"' -o $@ -v"}
# && scp "$@" pi@192.168.11.30:~/sandbox}
rpi() {ssh -t pi@192.168.0.105 "$@"}
vps() {ssh -t cgx@vps.onchi.me "$@"}

kp() {~/.cgx/.scripts/killprocess.sh}

alias tensor='sudo docker run -u $(id -u):$(id -g) --gpus all -i --rm tensorflow/tensorflow:latest-gpu-jupyter python < '
alias tensorsh='sudo docker run -u $(id -u):$(id -g) --gpus all -it -p 8888:8888 --rm tensorflow/tensorflow:latest-gpu-jupyter bash'

# mergepdf w\ \({1..18}\).pdf
mergepdf() { gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/prepress -sOutputFile=output.pdf "$@" ; echo output.pdf created!; }

# opam configuration
test -r /home/cgx/.opam/opam-init/init.zsh && . /home/cgx/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi
fpath=($fpath "/home/cgx/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

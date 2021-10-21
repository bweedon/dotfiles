# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/bxw002/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="rkj"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Share history between tabs
setopt share_history

# General
export EDITOR="nvim"

# General Stuff
alias untargz="tar -zxvf"
alias untar="tar xvf"

# Go Stuff
export GOROOT=/opt/go

# PCI
export GITHUB_TOKEN=9f257f44acedc1720699e55a6ba626945194744f

# SQLPLUS
export ORACLE_HOME=/usr/lib/oracle/19.6/client64
PATH=$ORACLE_HOME/bin:$PATH
export LD_LIBRARY_PATH=$ORACLE_HOME/lib

# JasperETL
export ETL_HOME=/opt/jasper/studio
alias jasper-etl="cd $ETL_HOME && nohup $ETL_HOME/JETL-linux-gtk-x86.sh &"

# PerfectProcure
export SANDBOX_ROOT=/home/bxw002/workspace/perfectprocure
export PP_UI_HOME=/home/bxw002/workspace/perfectprocure-ui
export JAVA6=/opt/jdk1.6.0_191
export JAVA8=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export JAVA_HOME=/opt/java
export M2_HOME=/opt/mvn
export ANT_HOME=/opt/ant
export NODE_HOME=/opt/node
export SOFTWARE_HOME=/home/bxw002/software
export PYTHON=$(which python2)
export CATALINA_HOME=/opt/tomcat
export ESCOUT_TOMCAT=/opt/escout-tomcat
export COP_TOMCAT=/opt/cop-tomcat
export SO_TOMCAT=/opt/so-tomcat
export SERA_TOMCAT=/opt/sera-tomcat

alias pp-build="/home/bxw002/scripts/pp-build.sh"
alias pp-start="/www/bin/start-escout-jvm.sh debug && sleep 2 && /www/bin/start-cop-jvm.sh debug && sleep 2 && /www/bin/start-so-jvm.sh debug"
alias pp-stop="/www/bin/stop-escout-jvm.sh; /www/bin/stop-cop-jvm.sh; /www/bin/stop-so-jvm.sh"
alias pp-restart="pp-stop; sleep 3 && pp-start"

## Karma/NG Test
alias launchchrome="\"/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe\""
export CHROME_BIN=launchchrome

# Tools
alias bat="batcat"
# Create function to tail with syntax highlighting
btail() {
	tail -f -n 200 $1 | bat --paging=never -l log
}

export PATH=$PATH:$JAVA_HOME/bin:/opt/go/bin:$M2_HOME/bin:$ANT_HOME/bin:$HOME/bin:$NODE_HOME/bin:$SOFTWARE_HOME/bin:/home/bxw002/go/bin:/home/bxw002/bin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /home/bxw002/.config/broot/launcher/bash/br
# load powerline
if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
fi
if [ -f /usr/local/lib/python3.8/dist-packages/powerline/bindings/zsh/powerline.zsh ]; then
    source /usr/local/lib/python3.8/dist-packages/powerline/bindings/zsh/powerline.zsh
fi

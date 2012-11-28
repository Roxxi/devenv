export STORM_HOME=/usr/local/storm-0.7.0

export DEFAULT_PATH=/sw/bin:/opt/local/bin:/usr/local/sbin:/Library/Frameworks/Python.framework/Versions/2.6/bin:/usr/local/bin:/Applications/GridGain221/bin:/Applications/apache-maven-3.0.3/bin/:.:${PATH}:$STORM_HOME/bin


source ~/.zsh.d/mac.zsh

# Editor settings
alias gemacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias gemacsclient='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
# Need to put the full path for emacsclient. The aliases aren't loaded
# as part of the start up context, even if they're in the shell
export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
export ALTERNATE_EDITOR='/Applications/Emacs.app/Contents/MacOS/Emacs'
export SVN_EDITOR='gemacsclient'

#JCLASSLIB (doesn't launch in lion becuase the launcher is not a universal binary)
alias jclasslib="java -jar /Applications/jclasslib\ bytecode\ viewer.app/Contents/Resources/app/bin/jclasslib.jar"

# C dir
alias cdir="cd /Users/Roxxi/Programs/Merced/C"



export TCGREP="-inH"

### ZSHELL Options ###
export CLICOLOR=1
export LSCOLORS=gxfxBxbxcxxxxxxxxx
export PROMPT="[%n@%m %c] "
export LS_IGNORE="--ignore='*.class' --ignore='*~' --ignore='#*#'"

setopt auto_cd
setopt append_history
setopt nobeep
setopt autolist
setopt nohup
#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD
# enabling history file
# number of lines kept in history
export HISTSIZE=1000
# number of lines saved in the history after logout
export SAVEHIST=1000
# location of history
export HISTFILE=~/.zhistory
# append command to history file once executed
setopt inc_append_history

alias resource="source ~/.zshrc"

alias ls="gls --color=tty -BF ${LS_IGNORE}"
#alias ls="ls -F"
cd() {builtin cd "$@" && ls;}
#alias cd='cd $@; ls'
alias clean="rm -f *~; rm -f *.*~; rm -f *.tmp; rm -f *.pyc; rm -f *.o; rm -f *.class; ls"
alias web="cd /Library/WebServer/Documents"

### MySQL ###
#alias mysqlstart="sudo /usr/local/mysql/bin/mysqld_safe --user=mysql &"
#alias mysql="mysql -u root -p"

### POSTGRES ###
alias pgstart='pg_ctl -D /usr/local/var/postgres/data -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

### SSH Short cuts ###
alias kaynne="ssh_with_color  ajbahouth@kaynne.com"

### Hadoop ###
alias dfs="hadoop dfs"

### Merced Stuff ###
#source .zsh.d/merced.zsh

### Analytica Stuff ###
#source .zsh.d/analytica.zsh

### OKL Stuff ###
source .zsh.d/okl.zsh

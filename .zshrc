export PATH=/usr/local/bin:$PATH:$HOME/bin


## For Emacs shell to get rid of ^[[?2004h (only when running zsh)
if [[ $TERM = dumb ]]; then
  unset zle_bracketed_paste
fi


############################################################
### Editor settings
alias gemacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias gemacsclient='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'

# Need to put the full path for emacsclient. The aliases aren't loaded
# as part of the start up context, even if they're in the shell
export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
export ALTERNATE_EDITOR='/Applications/Emacs.app/Contents/MacOS/Emacs'
export SVN_EDITOR='gemacsclient'

############################################################
#JCLASSLIB (doesn't launch in lion becuase the launcher is not a universal binary)
alias jclasslib="java -jar /Applications/jclasslib\ bytecode\ viewer.app/Contents/Resources/app/bin/jclasslib.jar"

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
setopt completeinword
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

# SSH tunneling made simple
ssh-tun() {
	host=$1; shift
	port=$1; shift
	ssh -fN -L $port:localhost:$port $host
}

source ~/.zsh.d/uber.zsh

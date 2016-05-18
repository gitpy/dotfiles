#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

GIT_PS1_SHOWDIRTYSTATE=1

ps_user='\[\e[0;32m\]'
ps_path='\[\e[0;38;5;245m\]'
ps_git='\[\e[0;35m\]'
ps_prompt='\[\e[0;38;5;214m\]'
ps_reset='\[\e[0m\]'

if [ -f ~/.dotfiles/git-completion/git-prompt.sh ]; then
  source ~/.dotfiles/git-completion/git-prompt.sh
  PS1=${ps_user}$'\u03bb'${ps_path}' \w'${ps_git}$(__git_ps1)${ps_prompt}' \$ '${ps_reset}
else
  PS1=${ps_user}$'\u03bb'${ps_path}' \w'${ps_prompt}' $ '${ps_reset}
fi



if [ -f ~/.dotfiles/git-completion/git-completion.bash ]; then
  .  ~/.dotfiles/git-completion/git-completion.bash
fi

## Modified commands ## {{{
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias mkdir='mkdir -p -v'
alias vi='nvim'
# }}}

## New commands ## {{{
alias hist='history | grep'         # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias pgg='ps -Af | grep'           # requires an argument
alias back='cd $OLDPWD'
alias ..='cd ..'
# }}}

# Privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias root='sudo -s'
    alias reboot='sudo systemctl reboot'
    alias poweroff='sudo systemctl poweroff'
    alias netctl='sudo netctl'
fi

## ls ## {{{
alias ls='ls -hF --color=auto --group-directories-first'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
# }}}

## Safety features ## {{{
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       # clear screen for real (it does not work in Terminology)
# }}}

## Make Bash error tollerant ## {{{
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'
# }}}

# pacman aliases (if desired, adapt for your favourite AUR helper)
alias pac="sudo /usr/bin/pacman -S"		# default action	- install one or more packages
alias pacu="sudo /usr/bin/pacman -Syu"		# '[u]pdate'		- upgrade all packages to their newest version
alias pacr="sudo /usr/bin/pacman -Rs"		# '[r]emove'		- uninstall one or more packages
alias pacs="/usr/bin/pacman -Ss"		# '[s]earch'		- search for a package using one or more keywords
alias paci="/usr/bin/pacman -Si"		# '[i]nfo'		- show information about a package
alias paclo="/usr/bin/pacman -Qdt"		# '[l]ist [o]rphans'	- list all packages which are orphaned
alias pacc="sudo /usr/bin/pacman -Scc"		# '[c]lean cache'	- delete all not currently installed package files
alias paclf="/usr/bin/pacman -Ql"		# '[l]ist [f]iles'	- list all files installed by a given package
alias pacexpl="sudo /usr/bin/pacman -D --asexp"	# 'mark as [expl]icit'	- mark one or more packages as explicitly installed
alias pacimpl="sudo /usr/bin/pacman -D --asdep"	# 'mark as [impl]icit'	- mark one or more packages as non explicitly installed

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rs \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"



## functions ##

# cd and ls in one
cl() {
if [ -d "$1" ]; then
	cd "$1"
	ls
	else
	echo "bash: cl: '$1': Directory not found"
fi
}
#copy and go to dir
cpg (){
  if [ -d "$2" ];then
    cp $1 $2 && cd $2
  else
    cp $1 $2
  fi
}
#move and go to dir
mvg (){
  if [ -d "$2" ];then
    mv $1 $2 && cd $2
  else
    mv $1 $2
  fi
}


. /home/cp/torch/install/bin/torch-activate

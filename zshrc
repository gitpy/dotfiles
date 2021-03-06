# Path to your oh-my-zsh installation.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# User configuration

  export PATH="/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.cargo/bin"

  export EDITOR=nvim

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

alias tmux='env TERM=xterm-256color tmux'
alias sf='sk'

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



fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | sf +s --tac | sed 's/ *[0-9]* *//')
}

fkill() {
  local pid
  pid=$(ps -ef | sed 1d | sf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]; then
    echo $pid | xargs kill -${1:-9}
  fi
}


z() {
  local dir
  dir="$(fasd -Rdl "$1" | sf -1 -0 --no-sort --no-multi)" && cd "${dir}" || return 1
}

zf() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | sf --no-multi) &&
  if [ -n "$dir" ]; then
    cd "${dir}"
  fi
}


el() {
  local file

  file=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | sf --read0 -0 -1 --no-multi)"})

  if [ -n "$file" ]; then
    $EDITOR -- "$file"
  fi
}

ef() {
  local file
  file=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type f -print 2> /dev/null | sf -0 -1 --no-multi) &&
  if [ -n "$file" ]; then
    $EDITOR -- "$file"
  fi
}


ol() {
  local file

  file=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | sf --read0 -0 -1 --no-multi)"})

  if [ -n "$file" ]; then
    mimeopen -- "$file" & disown
  fi
}

of() {
  local file
  file=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type f -print 2> /dev/null | sf -0 -1 --no-multi) &&
  if [ -n "$file" ]; then
    mimeopen -- "$file" & disown
  fi
}

ox() {
  local out file key
  IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && mimeopen "$file" & disown || ${EDITOR:-nvim} "$file"
  fi
}


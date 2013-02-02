#!/usr/bin/env zsh

# Colors TODO bold
local azul_clarito=$( printf "\e[38;5;25m")
local azul_oscuro=$( printf "\e[38;5;33m")
local azul=$fg_bold[blue]
local granate=$( printf "\e[38;5;125m")

# Git colors
GIT_PROMPT_COLOR=$( printf "\e[38;5;144m")
GIT_DIRTY_COLOR=$fg_bold[red]
GIT_CLEAN_COLOR=$fg_bold[green]

USER_PROMPT_="%{$azul_clarito%}%n"
HOST_PROMPT_="%{$azul_oscuro%}@%m"

# Battery
function battery_charge {
	echo `$BAT_CHARGE` 2>/dev/null
}

# TODO Python or Ruby
function virtualenv_info {
	[ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '

	if [ -e ~/.rvm/bin/rvm-prompt ]; then
		RUBY_PROMPT_="%{$fg_bold[blue]%}rvm:(%{$fg[green]%}\$(~/.rvm/bin/rvm-prompt s i v g)%{$fg_bold[blue]%})%{$reset_color%} "
	else
	  if which rbenv &> /dev/null; then
		RUBY_PROMPT_="%{$fg_bold[blue]%}rbenv:(%{$fg[green]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$fg_bold[blue]%})%{$reset_color%} "
	  fi
	fi
}

# TODO current folder name with different color
PATH_PROMPT_="%{$azul%}%~%{$reset_color%}"

# Git Prompt
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_COLOR%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔%{$reset_color%}"
GIT_PROMPT="%{$GIT_PROMPT_COLOR%}\$(git_prompt_info)%{$reset_color%}"

PROMPT="$USER_PROMPT_$HOST_PROMPT_$PATH_PROMPT_ "
RPROMPT="$GIT_PROMPT %{$granate%}%T%{$reset_color%}"

# eternal history

# big big history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000000

_eternal_history_histfile=~/.zsh_eternal_history

# timestamp format
export HISTTIMEFORMAT="%Y-%m-%d %T  "
setopt append_history # append rather then overwrite
setopt extended_history # save timestamp
setopt inc_append_history # add history immediately after typing a command
setopt hist_reduce_blanks # remove superfluous blanks

_eternal_history_mark_for_save() {
  __eternal_history_command_entered=true
}

_eternal_history_save() {
  if $__eternal_history_command_entered; then
    echo $$ $USER "$(fc -liD -1)" >> $_eternal_history_histfile
  fi
  __eternal_history_command_entered=false
}

autoload -U add-zsh-hook
add-zsh-hook preexec _eternal_history_mark_for_save
add-zsh-hook precmd _eternal_history_save

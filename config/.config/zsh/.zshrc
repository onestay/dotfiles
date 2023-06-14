# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=$HOME/.config/zsh/histfile
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# completions
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

# aliases
alias ls=exa
alias l=ls
alias vim=nvim
alias grep='grep --color=auto'
alias download='curl -fLO'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
export EDITOR=/usr/bin/nvim

# PATHs
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/git/toolshed:$HOME/bin/gitci:$HOME/bin:$PATH"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
fpath=($HOME/.config/zsh/plugins/zsh-completions/src $fpath)

# ssh agent using gnome keyring
if [[ -e $XDG_RUNTIME_DIR/gcr/ssh ]] then;
    export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
fi

# GPG_TTY
GPG_TTY=$(tty)
export GPG_TTY

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Zoxide
eval "$(zoxide init zsh)"
alias cd=z

# Work
source $HOME/.config/zsh/univention

# Plugins
source $HOME/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
source $HOME/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

# keybindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

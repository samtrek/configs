if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# eval "$(starship init zsh)"

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# Add in Powerlevel10k
# zinit ice depth=1; #zinit light romkatv/powerlevel10k

# Add in zsh plugins
# zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light jeffreytse/zsh-vi-mode
zinit ice wait'1a' silent
zinit load zsh-users/zsh-syntax-highlighting

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet OMZP::systemd
zinit snippet OMZ::plugins/git/git.plugin.zsh

# ** history
function _history_substring_search_config() {
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
}

# NOTE Loading completions is done here since it should be the last plugin
# to be loaded.
# NOTE It should be loaded after zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-history-substring-search#usage
# WAITING https://github.com/zsh-users/zsh-history-substring-search/pull/108
zinit ice wait'1b' silent \
  atload'zicompinit; zicdreplay; _history_substring_search_config' \
  ver'dont-overwrite-config'
 zinit load 'zsh-users/zsh-history-substring-search'
# zinit load 'ericbn/zsh-history-substring-search'
#

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Changing "ls" to "exa"
alias ls='eza --color=always --group-directories-first --icons' # my preferred listing
alias la='ls -a'  # all files and dirs
alias ll='ls -l'  # long format
alias lt='ls -aT' # tree listing
alias l='ls -la'
alias suedit='SUDO_EDITOR=nvim  sudoedit'
alias ot='OLLAMA_URL=http://192.168.1.9:11434 oterm'

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# TRAPUSR1() {
#   if [ $(darkman get) = "light" ];then
#     theme.sh Catppuccin-Latte
#   elif [ $(darkman get) = "dark" ]; then
#     theme.sh Catppuccin-Frappe
#   fi
# }

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

TRAPUSR1() { rehash }

#alisas for kitty ssh service
[ "$TERM" = "xterm-kitty" ] && alias s="kitty +kitten ssh"

autoload -Uz add-zsh-hook
eval "$(register-python-argcomplete pipx)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"


zstyle ':completion:*' menu select
fpath+=~/.zfunc

#compdef handlr
function _clap_dynamic_completer_handlr() {
    local _CLAP_COMPLETE_INDEX=$(expr $CURRENT - 1)
    local _CLAP_IFS=$'\n'

    local completions=("${(@f)$( \
        _CLAP_IFS="$_CLAP_IFS" \
        _CLAP_COMPLETE_INDEX="$_CLAP_COMPLETE_INDEX" \
        COMPLETE="zsh" \
        handlr -- ${words} 2>/dev/null \
    )}")

    if [[ -n $completions ]]; then
        compadd -a completions
    fi
}

compdef _clap_dynamic_completer_handlr handlr

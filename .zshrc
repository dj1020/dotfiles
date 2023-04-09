# Profiling START: https://stevenvanbael.com/profiling-zsh-startup
# zmodload zsh/zprof

# Locale Settings
export LC_ALL=zh_TW.UTF-8
export HISTSIZE=1000
export SAVEHIST=1000
export MAILCHECK=0

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'
#
# 調整自動建議的顏色，處理在 tmux 裡顏色無效問題
# ref: https://github.com/zsh-users/zsh-autosuggestions/issues/229#issuecomment-300675586
export TERM=xterm-256color

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it does not exist or it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

# Composer PATH Settings
export PATH="/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/Users/twinkledj/bin:/Users/twinkledj/.composer/vendor/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Server.app/Contents/ServerRoot/usr/bin:/Applications/Server.app/Contents/ServerRoot/usr/sbin:/usr/local/git/bin"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$PATH:$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin"

# PHP version
# export PATH="/Applications/MAMP/bin/php/php7.2.7/bin:$PATH"
# export PATH="/Applications/MAMP/bin/php/php5.6.33/bin:$PATH"
# export PATH="/Applications/MAMP/bin/php/php7.4.16/bin:$PATH"
# export PATH="/usr/local/opt/php@7.2/bin:/usr/local/opt/php@7.2/sbin:$PATH"
# export PATH="/usr/local/opt/php@7.4/bin:$PATH"
# export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
# export PATH="/usr/local/opt/php@7.2/bin:$PATH"
# export PATH="/usr/local/opt/php@7.2/sbin:$PATH"

# Ruby version
export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:/usr/local/opt/ruby@2.7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby@2.7/lib"
export CPPFLAGS="-I/usr/local/opt/ruby@2.7/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby@2.7/lib/pkgconfig"

# Lua Module Path
export LUA_PATH='/Users/twinkledj/Projects/sandbox/luaRocks/luarocks-3.3.1/./lua_modules/share/lua/5.3/?.lua;/Users/twinkledj/Projects/sandbox/luaRocks/luarocks-3.3.1/./lua_modules/share/lua/5.3/?/init.lua;/usr/local/share/lua/5.3/?.lua;/usr/local/share/lua/5.3/?/init.lua;/usr/local/lib/lua/5.3/?.lua;/usr/local/lib/lua/5.3/?/init.lua;./?.lua;./?/init.lua;/Users/twinkledj/.luarocks/share/lua/5.3/?.lua;/Users/twinkledj/.luarocks/share/lua/5.3/?/init.lua'
export LUA_CPATH='/Users/twinkledj/Projects/sandbox/luaRocks/luarocks-3.3.1/./lua_modules/lib/lua/5.3/?.so;/usr/local/lib/lua/5.3/?.so;/usr/local/lib/lua/5.3/loadall.so;./?.so;/Users/twinkledj/.luarocks/lib/lua/5.3/?.so'
export PATH="$PATH:/Users/twinkledj/Projects/sandbox/luaRocks/luarocks-3.3.1/./lua_modules/bin:/Users/twinkledj/.luarocks/bin:/Applications/MAMP/bin/php/php7.2.7/bin:/opt/local/bin:/opt/local/sbin:/Users/twinkledj/bin:/Users/twinkledj/.composer/vendor/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Server.app/Contents/ServerRoot/usr/bin:/Applications/Server.app/Contents/ServerRoot/usr/sbin:/usr/local/git/bin"

# PDSH
export PDSH_SSH_ARGS_APPEND="-i $HOME/.ssh/id_rsa_kkbox -o StrictHostKeyChecking=no"

# Crowdin CLI
export PATH="/usr/local/opt/crowdin@3/bin:$PATH"

# Bindkey for moving cursor
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# FZF Config
export FZF_DEFAULT_OPTS='--layout=reverse --border --cycle --ansi --no-unicode'
# export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --ignore --iglob '!{node_modules,.git}'"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --no-ignore --follow --exclude .git"
function initFzf() {
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    source /Users/twinkledj/bin/fzf-tab-completion/zsh/fzf-zsh-completion.sh
}
#zstyle ':completion:**' fzf-search-display true

# Zsh vi-mode https://github.com/jeffreytse/zsh-vi-mode
export ZVM_CURSOR_STYLE_ENABLED=false
export ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
export ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
export ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
export ZVM_VI_INSERT_ESCAPE_BINDKEY='jk'

#zvm_after_init_commands+=(initFzf)   # 關閉 FZF 感覺太少用，很慢
#zvm_after_init_commands+=('test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"')
# source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh


# Jenv config
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# PSSH from https://code.google.com/archive/p/parallel-ssh/downloads
export PATH="$HOME/bin/pssh-2.3.1/bin:$PATH"

# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# GCloud, 要 load 很久，暫時不用
# source /Users/twinkledj/Downloads/google-cloud-sdk/completion.zsh.inc
# source /Users/twinkledj/Downloads/google-cloud-sdk/path.zsh.inc

# FASD
# eval "$(fasd --init auto)"
# fasd_cache="$HOME/.fasd-init-bash"
# if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
#     fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
# fi
# source "$fasd_cache"
# unset fasd_cache

# 改用 zoxide
eval "$(zoxide init zsh)"

# Golang env
[[ -s "/Users/twinkledj/.gvm/scripts/gvm" ]] && source "/Users/twinkledj/.gvm/scripts/gvm"
export GOPATH="/Users/twinkledj/Projects/GoPlayground"
export PATH="$PATH:$(go env GOPATH)/bin"

#p10k configurre
ZLE_RPROMPT_INDENT=0

# Forward SSH-KEY https://gitlab.kkinternal.com/web/infra-board/-/issues/68
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
    eval `ssh-agent`
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

# ssh-agent setting
ssh-add -l | grep "The agent has no identities" && echo "Adding SSH Agent..." && ssh-add ~/.ssh/id_rsa_kkbox ~/.ssh/id_rsa_kk_deploy

# John's cli-toolbox https://gitlab.kkinternal.com/luna/cli-toolbox
if [ -f "${HOME}/.luna-scripts/functions.zsh" ];
then
    ln -s "${HOME}/.luna-scripts/_luna.json" \
        "${HOME}/.config/_luna.json" \
        > /dev/null 2>&1
    . "${HOME}/.luna-scripts/functions.zsh"
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ ! "$TMUX" = "" ] || [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ "$TMUX" = "" ] || [[ ! -f ~/.p10k-tmux.zsh ]] || source ~/.p10k-tmux.zsh

# Source ~/.aliases
source ~/.aliases

# Profiling END
# zprof

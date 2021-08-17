# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Paths
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.config/composer/vendor/bin:/usr/local/bin:/opt/jetbrains-toolbox:$PATH

# Environment
export VISUAL=nano
export TERMINAL=kitty
export LC_COLLATE='C'
#export WINEARCH=win64

# Environment Wayland
export WAYLAND_DISPLAY
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export MOZ_ENABLE_WAYLAND=1

# Path to your oh-my-zsh installation.
export ZSH="/home/pipshag/.oh-my-zsh"

# Jetbrains
wmname LG3D
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_PLUGIN_PATH=/usr/lib/qt/plugins
export QT_QPA_PLATFORM=wayland-egl
export SDL_VIDEODRIVER=wayland
export QT_WAYLAND_FORCE_DPI=physical # Use monitor DPI
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1 # Disable window decos

ZSH_THEME="powerlevel10k/powerlevel10k"

PROMPT_EOL_MARK=''

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
#DISABLE_AUTO_TITLE="false"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# zsh-autocomplete zsh-autosuggestions z
plugins=(git z zsh-autocomplete zsh-autosuggestions history sublime copyfile extract sudo autojump zsh-tab-title)

source $ZSH/oh-my-zsh.sh

# Add custom term title
#ZSH_THEME_TERM_TITLE_IDLE="%n %F{blue}%1~"

# Settings for ZSH TAB TITLE
ZSH_TAB_TITLE_ADDITIONAL_TERMS='kitty'
ZSH_TAB_TITLE_ONLY_FOLDER=true
ZSH_TAB_TITLE_CONCAT_FOLDER_PROCESS=false
ZSH_TAB_TITLE_PREFIX='pips'
ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX=true
ZSH_TAB_TITLE_SUFFIX=''

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Settings for zsh
setopt autocd notify pipefail beep
setopt CORRECT
setopt +o nomatch # Disable globbing asterisk

# add cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':completion:*:*:cdr:*:*' menu selection

# Settings for autosuggest
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Settings for zsh-autocomplete
zstyle ':autocomplete:*:ssh:*' users
zstyle ':autocomplete:*' recent-dirs cdr z
zstyle ':autocomplete:*' default-context ''
zstyle ':autocomplete:*' min-input 0
zstyle ':autocomplete:*' list-lines 16  # (integer)

# Settings for nnn file manager
# nnn fifo
export NNN_FIFO='/tmp/nnn.fifo'
# nnn splitg
export SPLIT='v'
# nnn color scheme
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
# nnn plugins
export NNN_PLUG='j:autojump;p:preview-tui;i:imgview;s:suedit;f:fzcd'

# Aliases
alias sudo='sudo ' # Transfer aliases
alias ytdl="youtube-dl --external-downloader aria2c --external-downloader-args '-c -j 3 -x 3 -s 3 -k 1M' -o '~/Downloads/Y/%(title)s-%(id)s.%(ext)s'"
alias torrent="aria2c -d ~/Downloads --seed-time=0"
alias ls="exa --icons"
alias l="exa --icons --long"
alias ll="exa --icons --long --group"
alias wifi="/usr/bin/iw wlan0 link"
alias nnn="nnn -aP p"
alias btm="btm"
alias music="mocp"
alias spotify="ncspot"
alias qrcode='qrencode -m 2 -t utf8 <<< "$1"'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/nvm/init-nvm.sh # Node Version Manager
[[ -s /home/pipshag/.autojump/etc/profile.d/autojump.sh ]] && source /home/pipshag/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

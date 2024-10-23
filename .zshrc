#------------------------------------------------------------------------------
#   export

export FZF_DEFAULT_COMMAND="fd -L . "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -L -t d . "

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
#export FZF_DEFAULT_COMMAND='rg --files --follow'

export HOSTNAME="$(uname -n)"

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=30;41:sg=30;43:ca=30;41:tw=30;44:ow=30;44:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

export BROWSER=w3m
export EDITOR=vim
export PAGER=w3m
export SYSTEMD_PAGER=
export QT_QPA_PLATFORMTHEME=gtk2
export SDCV_HISTSIZE=0
export SDCV_PAGER=w3m
export SVN_EDITOR=vim
export BAT_THEME="zenburn"

# disable ugly ffmpeg colors
export AV_LOG_FORCE_NOCOLOR=1

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

#------------------------------------------------------------------------------
#   alias

# misc
alias bc='bc -l'
alias cal='cal -m'
alias ls='ls --color -h --group-directories-first'
alias djvu2pdf='ddjvu -format=pdf -mode=black '
alias trg_ru='trans -t ru -e google -pager w3m -show-translation-phonetics=n -show-original-phonetics=n -show-prompt-message=n -show-languages=n'
alias trg_en='trans -t en -e google -pager w3m -show-translation-phonetics=n -show-original-phonetics=n -show-prompt-message=n -show-languages=n'
alias try_ru='trans -t ru -e yandex -pager w3m -show-translation-phonetics=n -show-original-phonetics=n -show-prompt-message=n -show-languages=n'
alias try_en='trans -t en -e yandex -pager w3m -show-translation-phonetics=n -show-original-phonetics=n -show-prompt-message=n -show-languages=n'
alias v=vim
alias weather='curl "wttr.in/Novosibirsk?TMQF"'
alias less='less -M'
alias newsboat='cd /tmp/downloads && newsboat --cache-file=~/.cache/newsboat_cache.db'
alias mupdf='mupdf -C AAAAAA'

# web
alias w3m='w3m -B'
alias w3ms="cd /tmp/downloads && firejail w3m -B && cd -"


# media
alias alsamixer='alsamixer -g'
alias mp3norm='find . -iname "*.mp3" -exec mp3gain -s i {} \;'
alias oggnorm='find . -iname "*.ogg" -exec vorbisgain {} \;'
#alias aacnorm='find . -iname "*.m4a" -exec aacgain -s i {} \;'
#alias mp3gain='mp3gain -s i'
alias flacnorm='find . -iname "*.flac" -exec metaflac --add-replay-gain {} \;'

#------------------------------------------------------------------------------
#   shell settings

#   git
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' | %F{magenta}%b%f'
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

export PROMPT='
┌[ %F{blue}%{%}%~%f$vcs_info_msg_0_ ]
└■%f '
#export RPROMPT='%F{yellow}$vcs_info_msg_0_%f'

#setopt autocd
setopt nobeep
setopt histignorealldups
setopt histignorespace
setopt ignoreeof

#vim key mode
bindkey -v
source /usr/share/fzf/key-bindings.zsh
bindkey jj vi-cmd-mode

autoload -Uz compinit
compinit

# gen auto complete only once a day
#autoload -Uz compinit
#for dump in ~/.zcompdump(N.mh+24); do
#  compinit
#done
#compinit -C

#------------------------------------------------------------------------------
#   shell settings

export MPD_HOST=/tmp/mpd
if [ $HOSTNAME = "work" ]; then
    # mail
    #alias mutt='cd /tmp/mutt && firejail mutt && cd -'
    alias mutt='cd /tmp/mutt && mutt && cd -'
    alias fetch_mail="OPENSSL_CONF=$HOME/.fdm_openssl.conf fdm fetch"

    alias picocom='picocom -b 115200'

    # dev
    alias rebuild_tags='gtags -i; ctags -R'
    alias rebuild_gtags='gtags -i'
    alias clear_tags="find . -type f '(' -name tags -o -name GPATH -o -name GRTAGS -o -name GTAGS -o -name gtags.files ')' -exec rm -v {} \;"
    alias clear_formatter_backups='find . -name "*unc-backup*~*" -exec rm -v {} \;'
else
    alias gphoto="gphoto2 --get-all-files"
    alias mpv="firejail --dns=77.88.8.7 mpv"
    alias mpa="firejail --dns=77.88.8.7 mpv --no-video"
    alias mpvns="\mpv"
    alias mpans="\mpv --no-video"
    alias dyv='firejail yt-dlp --proxy socks5://127.0.0.1:1080 --retries infinite --no-cache-dir -S res:360 --no-playlist -o "%(title)s-%(id)s.%(ext)s"'
    alias dya="firejail yt-dlp --proxy socks5://127.0.0.1:1080 --retries infinite --no-cache-dir -f bestaudio --no-playlist -o '%(title)s-%(id)s.%(ext)s'"
    alias dual_monitor='xrandr --output eDP1 --auto --output HDMI1 --auto --right-of eDP1'

    # torrent
    alias aria2cs='firejail aria2c'
    alias transmission-clis='firejail transmission-cli -w . -v '
    alias dmagnet='cd /tmp/downloads && firejail aria2c --bt-metadata-only --bt-save-metadata '
fi

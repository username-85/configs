#echo -en "\e]P0000000" #black
#echo -en "\e]PFFFFFFF" #white
#echo -en "\e]P8777777" #darkgrey
#echo -en "\e]P7a0a0a0" #lightgrey
#echo -en "\e]P1b06060" #darkred
#echo -en "\e]P9bc7c7c" #red
#echo -en "\e]P28ba574" #darkgreen
#echo -en "\e]PA96ae81" #green
#echo -en "\e]P39c9c4d" #darkyellow
#echo -en "\e]PBa9a969" #yellow
#echo -en "\e]P46e819c" #darkblue
#echo -en "\e]PC8b9aaf" #blue
#echo -en "\e]P5a06fa4" #darkmagen4ta
#echo -en "\e]PDa97dad" #magenta
#echo -en "\e]P6669a93" #darkcyan
#echo -en "\e]PE84aea8" #cyan
#clear #for background artifacting

#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec xinit -- :1 -nolisten tcp vt$XDG_VTNR
[[ -z $DISPLAY && -z $SSH_CONNECTION && $XDG_VTNR -eq 1 ]] && exec startx

# disable stop at ctrl-s (to quit that stop i need to pres ctrl-q)
stty -ixon

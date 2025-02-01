if status is-interactive
    # Commands to run in interactive sessions can go here
	set --universal ayu_variant dark && ayu_load_theme

	alias lf='lfcd'
end

set -gx EDITOR vim
alias vimdiff='vim -d'

# for lf
export LF_ICONS=(cat ~/.config/lf/LF_ICONS | tr '\n' ':' )

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/happy/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

conda activate py3.10

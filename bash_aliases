alias godot="/mnt/work/software/godot/bin/godot.x11.tools.64"
alias gd3="/mnt/work/software/Godot_v3.0-alpha1_x11.64"
alias gd="/mnt/work/software/Godot_v2.1.4-stable_x11.64"
alias bl="/mnt/work/software/blender-2.79/blender"
alias bl28="/mnt/work/software/blender-2.80/blender"
alias stremio="/mnt/work/software/Stremio+4.0.0-beta.29.appimage"

PROMPT_DIRTRIM=3
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

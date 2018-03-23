function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh  %s'
export LESS='-R'

# Visual Studio Code Setting
function code
  set location "$PWD/$argv"
  open -n -b "com.microsoft.VSCode" --args $location
end

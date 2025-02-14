#!/bin/bash
onedark_black="#282c34"
onedark_black_deep="#21252b"
onedark_window_black="#1d1e20"
onedark_blue="#61afef"
onedark_yellow="#e5c07b"
onedark_red="#e06c75"
onedark_white="#aab2bf"
onedark_green="#98c379"
onedark_visual_grey="#3e4452"
onedark_comment_grey="#5c6370"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-interval" "1"
set "status-justify" "centre"
set "status-position" "top"

set "status-left-length" "150"
set "status-right-length" "150"
set "status-right-attr" "none"

set "message-fg" "$onedark_white"
set "message-bg" "$onedark_black"

set "message-command-fg" "$onedark_white"
set "message-command-bg" "$onedark_black"

set "status-attr" "none"
set "status-left-attr" "none"
set "status-right-attr" "none"

setw "window-status-fg" "$onedark_black"
setw "window-status-bg" "$onedark_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$onedark_black"
setw "window-status-activity-fg" "$onedark_black"
setw "window-status-activity-attr" "none"

set "window-style" "fg=$onedark_comment_grey,bg=$onedark_window_black"
set "window-active-style" "fg=$onedark_white"

set "pane-border-fg" "$onedark_white"
set "pane-border-bg" "$onedark_black"
set "pane-active-border-fg" "$onedark_green"
set "pane-active-border-bg" "$onedark_black"

set "display-panes-active-colour" "$onedark_yellow"
set "display-panes-colour" "$onedark_blue"

set "status-bg" "$onedark_black_deep"
set "status-fg" "$onedark_white"

set "@prefix_highlight_fg" "$onedark_black"
set "@prefix_highlight_bg" "$onedark_green"
set "@prefix_highlight_copy_mode_attr" "fg=$onedark_black,bg=$onedark_green"
set "@prefix_highlight_output_prefix" "  "

time_format=$(get "@onedark_time_format" "%R")
date_format=$(get "@onedark_date_format" "%Y/%m/%d")

set "status-right" "#[fg=$onedark_white,bg=$onedark_black_deep,nounderscore,noitalics]${time_format} #[fg=$onedark_visual_grey,bg=$onedark_black_deep]#[fg=$onedark_visual_grey,bg=$onedark_visual_grey]#[fg=$onedark_white, bg=$onedark_visual_grey]${date_format} "
set "status-left" "#[fg=$onedark_black,bg=$onedark_green] #S:#I.#P #[fg=$onedark_green,bg=$onedark_black_deep,nobold,nounderscore,noitalics]  "

set "window-status-format" " #[fg=$onedark_visual_grey,bg=$onedark_black_deep] #I:#[fg=$onedark_comment_grey]#W#[fg=$onedark_comment_grey]#F "
set "window-status-current-format" " #[fg=$onedark_green,bg=$onedark_window_black,bold]#{?client_prefix,#[fg=$onedark_red],} #I#[fg=$onedark_comment_grey]:#[fg=$onedark_white]#W#[fg=$onedark_comment_grey]#F "

dir="#(cd #{pane_current_path} && sh $HOME/.tmux/plugins/tmux-onedark-theme/dir.sh)"
set "window-status-format" "#[fg=$onedark_visual_grey,bg=$onedark_black_deep] #I:#[fg=$onedark_comment_grey]${dir}#[fg=$onedark_comment_grey] "
set "window-status-current-format" "#[fg=$onedark_green,bg=$onedark_window_black,bold]#{?client_prefix,#[fg=$onedark_red],} #I#[fg=$onedark_comment_grey]:#[fg=$onedark_white]${dir}#[fg=$onedark_comment_grey] "

#!/bin/bash

# list all directories in the ~/Workspace directory, and extract the names using basename
function choose_directory {
echo "Choose a directory in ~/Workspace:"
select dir in $(ls -d $HOME/Workspace/* | xargs -n1 basename)
do
  # if the user chose a valid directory, break out of the loop
  if [ -n "$dir" ]
  then
    dir=$dir
    path="$HOME/Workspace/$dir"
    break
  fi
  echo "Please choose a valid directory."
done
}

# use the select command to allow the user to choose a folder within the chosen directory, and extract the names using basename
function choose_folder {
  echo "Choose a folder in $path:"
  select folder in $(ls -d $path/* | xargs -n1 basename)
  do
    # if the user chose a valid folder, break out of the loop
    if [ -n "$folder" ]
    then
      path="$path/$folder"
      tmux_session_name="$dir-$folder"
      break
    fi
    echo "Please choose a valid folder."
  done
}

if [ $# -eq 0 ]
  then
  choose_directory
  choose_folder
  echo "Path: $path"
  elif [ $# -eq 1 ]
  then 
    case "$1" in
      ".")
        path=$(pwd)
        current_base=$(basename "$path")
        parent_dir=$(dirname "$path")
        parent_base=$(basename "$parent_dir")
        
        # Remove . from the path, can cause a problem with tmux
        parent=$(echo "$current_base" | sed 's/\.//g')
        current=$(echo "$parent_base" | sed 's/\.//g')
        tmux_session_name="$parent-$current"
        ;;
      *)
        dir=$1
        path="$HOME/Workspace/$dir"
        choose_folder
        ;;
    esac
  elif [ $# -eq 2 ] 
  then
    path="$HOME/Workspace/$1/$2"
    tmux_session_name="$1-$2"
fi

if tmux has-session -t "$tmux_session_name"; 
  then
    tmux attach-session -t "$tmux_session_name"
  else
    cd $path
    tmux new-session -d -s "$tmux_session_name"
    tmux new-window -t "$tmux_session_name" -n "terminal" 
    tmux new-window -t "$tmux_session_name" -n "editor" "nvim ."
    tmux kill-window -t "$tmux_session_name:0"
    tmux attach-session -t "$tmux_session_name"
fi

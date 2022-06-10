#!/bin/bash
terminal_cmd="gnome-terminal --wait"
path_prefix="/tmp/vim_clip_edit_"
if compgen -G "$path_prefix*" > /dev/null; then
    rm $tmp_file
    $terminal_cmd -- /bin/sh -c "echo \"tmp file pattern exists! another instance may be running. Otherwise, delete stale files with prefix $path_prefix\"; press_any_key_to_cont.sh"
    exit 1
fi
now=$(date +%s)
tmp_file="$path_prefix$now.txt"
xclip -o > $tmp_file 
$terminal_cmd -- vim $tmp_file
cat $tmp_file | xclip -i
rm $tmp_file

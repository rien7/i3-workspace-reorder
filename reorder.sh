#!/bin/sh

MSG=i3-msg
CUR_WORKSPACE=$($MSG -t get_workspaces | jq '.[].name')
REGEX='"[0-9]{1,2}(.*)"'
IFS=$'\n'
i=1
for name in $CUR_WORKSPACE; do
    if [[ $name =~ $REGEX ]]; then
        new_name="$i${BASH_REMATCH[1]}"
        $MSG "rename workspace $name to $new_name"
        ((i++))
    fi
done

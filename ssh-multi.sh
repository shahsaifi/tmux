#! /bin/bash
#
# ssh-multi.sh
#

# a script to ssh multiple servers over multiple tmux panes


starttmux() {
    if [ -z "$HOSTS" ]; then
       echo -n "Please provide of list of hosts separated by spaces [ENTER]: "
       read HOSTS
    fi

    local hosts=( $HOSTS )


    tmux new-window "ssh -t ${hosts[0]}"
    unset hosts[0];
    for i in "${hosts[@]}"; do
        tmux split-window -h  "ssh -t $i"
        tmux select-layout tiled > /dev/null
    done
    tmux select-pane -t 0
    tmux set-window-option synchronize-panes on > /dev/null

}

HOSTS=${HOSTS:=$*}

starttmux

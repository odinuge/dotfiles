
function scaling(){
    if [[ -z $1 ]]; then
        gsettings get org.gnome.desktop.interface text-scaling-factor
    else 
        gsettings set org.gnome.desktop.interface text-scaling-factor $1
    fi
}

function get() {
    local repo=$1
    local SSH_URL="git@github.com:$repo"
    local HTTPS_URL="https://github.com/$repo"
    local CLONE_PATH="$HOME/src/$repo"
    mkdir -p $(dirname "$CLONE_PATH")
    (git clone $SSH_URL $CLONE_PATH || git clone $HTTPS_URL $CLONE_PATH)
}


function goto() {
    cd ~/src/$1
}

# Merge base-config with updated config (eg. after getting new certs)
# $1 is the new file that should be merged into the existing one
function merge-kubeconf() {
    local DEFAULT_CONF=$HOME/.kube/config
    local NEW_CONF=$1
    local OUTPUT=$(KUBECONFIG="$NEW_CONF:$DEFAULT_CONF" kubectl config view --flatten)
    echo "$OUTPUT"> $DEFAULT_CONF
}

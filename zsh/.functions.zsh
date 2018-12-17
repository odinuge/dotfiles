
function scaling(){
    if [[ -z $1 ]]; then
        gsettings get org.gnome.desktop.interface text-scaling-factor
    else 
        gsettings set org.gnome.desktop.interface text-scaling-factor $1
    fi
}

function goto() {
    cd ~/go/src/github.com/$1
}

# Merge base-config with updated config (eg. after getting new certs)
# $1 is the new file that should be merged into the existing one
function merge-kubeconf() {
    local DEFAULT_CONF=$HOME/.kube/config
    local NEW_CONF=$PWD/$1
    local OUTPUT=$(KUBECONFIG="$NEW_CONF:$DEFAULT_CONF" kubectl config view --flatten)
    echo "$OUTPUT"> $DEFAULT_CONF
}

#!/usr/bin/env bash

source "$NCTL"/sh/utils/main.sh

unset NODE_ID

for ARGUMENT in "$@"
do
    KEY=$(echo "$ARGUMENT" | cut -f1 -d=)
    VALUE=$(echo "$ARGUMENT" | cut -f2 -d=)
    case "$KEY" in
        node) NODE_ID=${VALUE} ;;
        *)
    esac
done

NODE_ID=${NODE_ID:-"all"}

# ----------------------------------------------------------------
# MAIN
# ----------------------------------------------------------------

# Stop node.
source "$NCTL"/sh/node/stop.sh node="$NODE_ID"

# Remove state.
rm "$(get_path_to_node_storage "$NODE_ID")/*"

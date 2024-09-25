#!/bin/bash

if [ -n "$BASH_SOURCE" ]; then
    THIS_SCRIPT=$BASH_SOURCE
elif [ -n "$ZSH_NAME" ]; then
    THIS_SCRIPT=$0
else
    THIS_SCRIPT="$(pwd)/oe-init-build-env"
    if [ ! -e "$THIS_SCRIPT" ]; then
        echo "Error: $THIS_SCRIPT doesn't exist!" >&2
        echo "Please run this script in oe-init-build-env's directory." >&2
        exit 1
    fi
fi

if [ -z "$ZSH_NAME" ] && [ "$0" = "$THIS_SCRIPT" ]; then
    echo "Error: This script needs to be sourced. Please run as '. $THIS_SCRIPT'" >&2
    exit 1
fi

if [ -z "$REPO_ROOT" ]; then
    REPO_ROOT=$(dirname "$THIS_SCRIPT")
    REPO_ROOT=$(readlink -f "$REPO_ROOT")
fi
unset THIS_SCRIPT

export REPO_ROOT
export TEMPLATECONF=${TEMPLATECONF:-${REPO_ROOT}/meta-mtos/conf/templates/default}
source "$REPO_ROOT"/poky/oe-init-build-env


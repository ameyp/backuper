#!/bin/bash

repo_config=$(restic cat config 2>&1)
if [[ $? == 1 ]]; then
    repo_init=$(restic init 2>&1)
    if [[ $? == 0 ]]; then
        echo "Initialized repository at ${RESTIC_REPOSITORY}"
    else
        echo "Could not initialize repository at ${RESTIC_REPOSITORY}: ${repo_init}"
    fi
else
    echo "Detected repository at ${RESTIC_REPOSITORY}"
fi

restic --verbose backup $1

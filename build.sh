#!/bin/bash

set -ex

for dir in examples/*; do
    if [ -d "$dir" ] && [ "$dir" != "examples/headers" ]; then
        echo "$dir"
        pushd $dir
        go build .
        popd
    fi
done

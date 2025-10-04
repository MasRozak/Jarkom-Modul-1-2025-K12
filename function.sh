#!/bin/bash
download() {
    file=$2
    if [ -f "$file" ]; then
        echo "$file already exists."
    else
        wget "http://drive.usercontent.google.com/u/0/uc?id=$1&export=download" --no-check-certificate -O "$file"
        unzip "$file"
    fi
}

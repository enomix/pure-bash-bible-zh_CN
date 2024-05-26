#!/bin/bash

loading(){
    percent=$1
    echo -n -e "\033[1000D${percent}%\033[0m"
}

for (( i=0; i <= 100; i++ ))
do
    loading $i
    sleep 0.1
done
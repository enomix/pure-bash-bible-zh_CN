#!/bin/bash
mkdir detection
for((i=0;i<100;i++)); do
    touch ./detection/{a..z}$i.txt
    # touch ./detection/{a..z}$i.txt
done

# touch ./detection/{a..z}$i.txt
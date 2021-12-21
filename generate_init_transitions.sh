#!/bin/bash
BEGIN=$1
END=$2

if [ -z "$BEGIN" ] || [ -z "$END" ]; then
    echo "Usage: $0 [BEGIN] [END}"
    echo "For example: $0 1 50"
    exit 1
fi

# echo all numbers from $BEGIN to $END
for i in $(seq $BEGIN $END); do
    echo "    $i -> "
done
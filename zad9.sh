#!/bin/bash

echo "=== ZADANIE 9 ==="
for i in $(seq 1 10); do
    for j in $(seq 1 10); do
        wynik=$((i * j))
        echo -n "$wynik "
    done
    echo
done
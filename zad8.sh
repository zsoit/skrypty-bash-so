#!/bin/bash

katalog="$1"

if [ ! -d "$katalog" ]; then
    echo "Podany argument nie jest katalogiem."
    exit 1
fi

# Wypisanie nazw zwykłych plików w kolejności alfabetycznej
find "$katalog" -maxdepth 1 -type f | sort



#!/bin/bash

katalog=$1
uzytkownik=$2

main(){
    sprawdzenie;
    rozmiar;
    echo "Sumaryczny rozmiar plikow uzytkownika $uzytkownik: $suma_rozmiarow bajtow"
}

rozmiar(){
    cd "$katalog" || exit 1

    suma_rozmiarow=0

    for plik in $(find . -type f -user "$uzytkownik" 2>/dev/null); do
        rozmiar=$(du -b "$plik" | cut -f1)
        suma_rozmiarow=$((suma_rozmiarow + rozmiar))
    done
}


sprawdzenie(){
    if [ ! -d "$katalog" ]; then
    echo "Podany argument nie jest katalogiem."
    exit 1
    fi
}

main;
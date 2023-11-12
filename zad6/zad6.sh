#!/bin/bash

katalog=$1
uzytkownik=$2

main(){
    echo "=== ZADANIE 6 ==== \n \n"
    echo "Lokalizacja: $katalog \n \n "
    sprawdzanie;
    operacja;
}


sprawdzanie(){
    if [ ! -d "$katalog" ]; then
        echo "Podany argument nie jest katalogiem."
        exit 1
    fi
}


operacja(){
    cd "$katalog" || exit 1

    for plik in *; do
        if [ -f "$plik" ]; then
            typ="zwykly plik"
        elif [ -d "$plik" ]; then
            typ="katalog"
        elif [ -L "$plik" ]; then
            typ="dowiazanie symboliczne"
        else
            typ="nieznany"
        fi

        wlasciciel=$(stat -c "%U" "$plik")
        uprawnienia=$(stat -c "%a" "$plik")

        if [ "$wlasciciel" = "$uzytkownik" ]; then
            jest_wlascicielem="tak"
        else
            jest_wlascicielem="nie"
        fi

        info;

    done
}

info(){
  echo "Plik: $plik"
  echo "Typ: $typ"
  echo "Czy wlasciciel: $jest_wlascicielem"
  echo "Uprawnienia: $uprawnienia"
  echo "------------------------"
}


main;


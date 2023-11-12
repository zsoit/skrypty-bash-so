#!/bin/bash


katalog="$1"
plik_usunietych_plikow="$2"
plik_usunietych_katalogow="$3"

main(){
    sprawdzenie;

    echo "=== ZADANIE 3 ==="
    touch "$plik_usunietych_plikow"
    touch "$plik_usunietych_katalogow"

    echo "1. \n Usuwanie pustych podkatalogów w drzewie katalogów: $katalog"
    usuwanie;

    echo "\n \n 2. \n Operacja zakończona. Lista usuniętych plików zapisana w: $plik_usunietych_plikow"
    echo "\n 3. \n Lista usuniętych podkatalogów zapisana w: $plik_usunietych_katalogow"
    cat $plik_usunietych_katalogow
    echo "\n 4.\n Struktura katalogów po operacji: ";
    tree $katalog;
}

usuwanie(){
    find "$katalog" -type d -empty -print | while read -r podkatalog; do
        echo "=> Usuwanie pustego podkatalogu: $podkatalog"
        rmdir "$podkatalog"
        echo "$podkatalog" >> "$plik_usunietych_katalogow"
    done
}


sprawdzenie(){
    if [ ! -d "$katalog" ]; then
        echo "Podany argument nie jest katalogiem."
        exit 1
    fi
}

main;
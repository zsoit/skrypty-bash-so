#!/bin/bash


katalog="$1"
plik_wynikowy="$2"

echo "=== ZADANIE 2 ===="

main(){
    touch "$plik_wynikowy"
    echo "2.1 \n Pliki w katalogu: $katalog"
    ls $katalog;
    echo "\n 2.2 \n OPERACJE";
    operacja;
    echo "\n \n 2.3 \n Operacja zakonczona. Lista usunietych plikow zapisana w: $plik_wynikowy"
    cat $plik_wynikowy;
    echo "\n Plik w katalogu: $katalog";
    ls $katalog;

}


operacja(){
    for plik in "$katalog"/*; do
        if [ -f "$plik" ] && [ ! -s "$plik" ]; then
            echo "=> Usuwanie pustego pliku: $plik"
            rm "$plik"
            echo "$plik" >> "$plik_wynikowy"
        fi
    done

}

sprawdzenie(){
    if [ ! -d "$katalog" ]; then
        echo "Podany argument nie jest katalogiem."
        exit 1
    fi
}
main;
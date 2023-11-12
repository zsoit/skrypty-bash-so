#!/bin/bash


katalog="$1"

echo "=== ZADANIE 4 ====";

main(){
    echo "Informacje o rozmiarach plików w katalogu: $katalog"

    sprawdzenie;
    rozmiar;
    informacja;
}

rozmiar(){
    # Liczniki
    liczba_plikow_do_1MB=0
    liczba_plikow_powyzej_1MB=0
    suma_rozmiarow=0
    suma_mb=0

    # Iteracja przez pliki w katalogu
    for plik in "$katalog"/*; do
    if [ -f "$plik" ]; then
        rozmiar=$(du -b "$plik" | awk '{print $1}')

        if [ "$rozmiar" -le 1048576 ]; then  # 1MB = 1024 * 1024
            liczba_plikow_do_1MB=$((liczba_plikow_do_1MB + 1))
        else
            liczba_plikow_powyzej_1MB=$((liczba_plikow_powyzej_1MB + 1))
        fi

        suma_rozmiarow=$((suma_rozmiarow + rozmiar))
        suma_mb=$(du -hc $katalog  | awk '/total/{print $1}')

       
    fi
    done
}

sprawdzenie(){
    if [ ! -d "$katalog" ]; then
        echo "Podany argument nie jest katalogiem."
        exit 1
    fi
}

informacja(){

    echo "=> Liczba plików do 1MB: $liczba_plikow_do_1MB"
    echo "=> Liczba plików powyżej 1MB: $liczba_plikow_powyzej_1MB"
    
    echo "\n ";
    echo "Sumaryczny rozmiar plików: ${suma_mb} ($suma_rozmiarow bajtów)"


}
main;

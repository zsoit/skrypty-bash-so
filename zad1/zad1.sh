#!/bin/bash

katalog="$1";
plik="$2"


main()
{
    sprawdzanie;
    echo "==== ZADANIE 1 =====";
    echo "1.1";
    wyswietl_katalog;

    echo "1.2 \n OPERACJE: ";
    
    usuwanie;
    zmiananazwy;
    
    echo "\n ";

    echo "1.3";
    wyswietl_katalog;

    echo "1.4";
    wyswietl_plik;
}


sprawdzanie(){

    # Sprawdź czy podany katalog istnieje
    if [ ! -d "$katalog" ]; then
        echo "Podany katalog nie istnieje.!"
        exit 1
    fi
}


usuwanie(){

    wynik=$(ls $katalog | grep -i .txt)

    if [ -z "$wynik" ]; then
        echo "== BRAK PLIKÓW *.TXT == "
    else
        for n in $wynik; 
        do  
            echo "=> Usunieto  ${n}";
            rm -rf "${katalog}/${n}";
            echo "Usunięto plik ${katalog}/${n}" >> $plik;

        done;
    fi

}


zmiananazwy(){
    wynik=$(ls $katalog | grep -v .txt)

    if [ -z "$wynik" ]; then
        echo "== BRAK PLIKOW INNYCH NIŻ TXT =="
    else

        for n in $wynik; 
        do  
            if [ -w "$katalog/${n}" ]; then
                echo "Plik ${n} ma tryb do zapisu. => Zmieniono nazwe na ${n}.txt"
                mv "${katalog}/${n}" "${katalog}/${n}.txt";
            else
                echo "Plik ${n} nie ma trybu do zapisu."
            fi

        done;


    fi
}

wyswietl_plik(){
    echo "Zawartosc pliku ${plik}: ";
    cat $plik;

}

wyswietl_katalog(){

    echo "Zawartosc katalogu $katalog: ";
    wynik=$(ls $katalog)

    if [ -z "$wynik" ]; then
        echo "<PUSTY KATALOG>";
        echo "\n";

    else
         ls $katalog;
        echo "\n";
    fi;
}

main;
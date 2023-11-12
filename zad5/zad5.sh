#!/bin/bash

echo "=== ZADANIE 5 ====";

plik=$1;

sprawdz_czy_bash(){
    wynik=$(head -n 1 $plik);

    if [ "$wynik" = "#!/bin/bash" ]; then
        echo "=> To jest skrypt!";
    else
        echo "=> Brak wpisu w pliku #!/bin/bash";
    fi
}

main(){
    echo "Plik: $plik";
    sprawdz_czy_bash;

    echo "\n \n Zawartosc pliku $plik:";
    cat $plik;
}

main;

#!/bin/bash

echo "=== Prosty Kalkulator - ZADANIE 10 ==="
echo "Dostępne operacje: suma, różnica, mnożenie, dzielenie, potęgowanie"

read -p "Podaj pierwszą liczbę: " liczba1
read -p "Podaj drugą liczbę: " liczba2

echo "Wybierz operację:"
echo "1. Suma"
echo "2. Różnica"
echo "3. Mnożenie"
echo "4. Dzielenie"
echo "5. Potęgowanie"

read -p "Twój wybór (1-5): " operacja

case $operacja in
    1)
        wynik=$((liczba1 + liczba2))
        echo "Suma: $wynik"
        ;;
    2)
        wynik=$((liczba1 - liczba2))
        echo "Różnica: $wynik"
        ;;
    3)
        wynik=$((liczba1 * liczba2))
        echoplik "Mnożenie: $wynik"
        ;;
    4)
        if [ "$liczba2" -eq 0 ]; then
            echo "Dzielenie przez zero jest niemożliwe."
        else
            wynik=$(awk "BEGIN {print $liczba1 / $liczba2}")
            echo "Dzielenie: $wynik"
        fi
        ;;
    5)
        wynik=$(awk "BEGIN {print $liczba1 ^ $liczba2}")
        echo "Potęgowanie: $wynik"
        ;;
    *)
        echo "Nieprawidłowy wybór operacji."
        ;;
esac

skrypt:
	sh zad1.sh /home/jakun/skrypty/zad1/test  /home/jakun/skrypty/zad1/usuniete;

testowepliki:
	touch test/plik1 test/plik2 test/plik3.txt test/plik4.txt test/plik5.md test/plik6; chmod -w test/plik6; ls -l test/

clear:
	rm -rf usuniete; rm -rf test/*; touch usuniete;  

run:
	make clear; make testowepliki; make skrypt     
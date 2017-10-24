hellomake: main.c
	avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o main.o main.c
	avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o millis.o millis.c
	avr-gcc -mmcu=atmega328p main.o millis.o -o main
	avr-objcopy -O ihex -R .eeprom main main.hex
	avrdude -F -V -c arduino -p ATMEGA328P -P /dev/cu.wchusbserial1450 -b 115200 -U flash:w:main.hex
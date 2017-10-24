#include <avr/io.h>
#include <avr/interrupt.h>
#include "millis.h"

int main(){
    millis_init();

    // Set port as output
    DDRB |= _BV(DDB5);

    // Enable interrupts
    sei();

    millis_t lastChangeLed = 0;

    while(1){
        millis_t now = millis();

        if(now - lastChangeLed >= 500){
            // Toggle LED
            PORTB ^= _BV(PORTB5);
            
            // Store time
            lastChangeLed = now;
        }
    }
}
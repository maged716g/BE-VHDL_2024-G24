// essai projet leds boutons

#include "sys/alt_stdio.h"
#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h" // pour éviter de renseigner les adresses physiques des périphériques
#include "unistd.h" 				// pour la fonction délai

#define config (unsigned int *) AVALON_MESURE_FREQ_0_BASE
#define code (unsigned int*) (AVALON_MESURE_FREQ_0_BASE + 4)

int main()
{
  alt_putstr("Salut ext!\n");		// test si communication OK
  *config = 0x03;
  unsigned int data_valid = *code & 0xFF;
  while (1)
  	 {
	  unsigned int data_valid = *code & 0xFF;
	  printf("freq= %u Khz \n", data_valid);
	  usleep(1000000);

 }
  return 0;
}

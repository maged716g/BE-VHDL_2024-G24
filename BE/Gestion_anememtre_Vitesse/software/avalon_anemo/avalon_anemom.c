#include "sys/alt_stdio.h"
#include <stdio.h>
#include <stdlib.h>
#include "system.h"
#include "altera_avalon_pio_regs.h" // pour �viter de renseigner les adresses physiques des p�riph�riques
#include "unistd.h" 				// pour la fonction d�lai

#include "io.h"
#include "system.h"
#include "alt_types.h"
#include <stdio.h>

 // Remplace par l'adresse de base de ton p�riph�rique

// Adresses des registres � l'int�rieur de ton p�riph�rique
#define ANEM_CONFIG_REG (unsigned int *)(AVALON_MESURE_FREQ_0_BASE )  // Registre de configuration (Start/Stop, Continu, Raz_n)
#define ANEM_CODE_REG (unsigned int *)(AVALON_MESURE_FREQ_0_BASE + 4)    // Registre contenant les donn�es (Valid, Data_anemometre)

void start_anemometer() {
    // Configuration : Start=0, Continu=1, Raz_n=1 (b2=1, b1=0, b0=1)
	IOWR(ANEM_CONFIG_REG, 0, 0b011);
}

void stop_anemometer() {
    // Stop the anemometer (b2=0 pour arr�ter)
    *ANEM_CONFIG_REG = 0b001;  // Continuer avec raz_n=1, mais stop
}

int read_anemometer_data() {
    // Lire le registre de donn�es
	alt_u32 code_data = *ANEM_CODE_REG;

    // V�rifier si les donn�es sont valides (b9 == 1)
    //if ((code_data & 0x100) == 0) {  // bit 9 = 0 signifie que les donn�es ne sont pas valides
       // printf("Donn�es non valides\n");
       // return -1;
   // }

    // Extraire les bits [7:0] pour obtenir la fr�quence
    alt_u8 frequency = code_data & 0xFF;
    return frequency;
}

int main() {
    printf("Initialisation de l'an�mom�tre...\n");

    // D�marrer l'an�mom�tre
    start_anemometer();

    while (1) {
        // Lire la fr�quence calcul�e toutes les 1 seconde
        int freq = read_anemometer_data();

            printf("Fr�quence de l'an�mom�tre: %d Hz\n", freq);


        // Pause de 1 seconde
        usleep(1000000);  // Pause d'une seconde (1 000 000 microsecondes)
    }

    // Arr�ter l'an�mom�tre (inutile dans ce cas car la boucle est infinie)
    //stop_anemometer();

    return 0;
}

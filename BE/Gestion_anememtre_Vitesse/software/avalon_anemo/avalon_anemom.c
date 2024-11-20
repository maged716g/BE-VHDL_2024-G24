#include "sys/alt_stdio.h"
#include <stdio.h>
#include <stdlib.h>
#include "system.h"
#include "altera_avalon_pio_regs.h" // pour éviter de renseigner les adresses physiques des périphériques
#include "unistd.h" 				// pour la fonction délai

#include "io.h"
#include "system.h"
#include "alt_types.h"
#include <stdio.h>

 // Remplace par l'adresse de base de ton périphérique

// Adresses des registres à l'intérieur de ton périphérique
#define ANEM_CONFIG_REG (unsigned int *)(AVALON_MESURE_FREQ_0_BASE )  // Registre de configuration (Start/Stop, Continu, Raz_n)
#define ANEM_CODE_REG (unsigned int *)(AVALON_MESURE_FREQ_0_BASE + 4)    // Registre contenant les données (Valid, Data_anemometre)

void start_anemometer() {
    // Configuration : Start=0, Continu=1, Raz_n=1 (b2=1, b1=0, b0=1)
	IOWR(ANEM_CONFIG_REG, 0, 0b011);
}

void stop_anemometer() {
    // Stop the anemometer (b2=0 pour arrêter)
    *ANEM_CONFIG_REG = 0b001;  // Continuer avec raz_n=1, mais stop
}

int read_anemometer_data() {
    // Lire le registre de données
	alt_u32 code_data = *ANEM_CODE_REG;

    // Vérifier si les données sont valides (b9 == 1)
    //if ((code_data & 0x100) == 0) {  // bit 9 = 0 signifie que les données ne sont pas valides
       // printf("Données non valides\n");
       // return -1;
   // }

    // Extraire les bits [7:0] pour obtenir la fréquence
    alt_u8 frequency = code_data & 0xFF;
    return frequency;
}

int main() {
    printf("Initialisation de l'anémomètre...\n");

    // Démarrer l'anémomètre
    start_anemometer();

    while (1) {
        // Lire la fréquence calculée toutes les 1 seconde
        int freq = read_anemometer_data();

            printf("Fréquence de l'anémomètre: %d Hz\n", freq);


        // Pause de 1 seconde
        usleep(1000000);  // Pause d'une seconde (1 000 000 microsecondes)
    }

    // Arrêter l'anémomètre (inutile dans ce cas car la boucle est infinie)
    //stop_anemometer();

    return 0;
}

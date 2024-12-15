#include "sys/alt_stdio.h"
#include <stdio.h>
#include <stdlib.h>
#include "system.h"
//#include "altera_avalon_pio_regs.h" // pour éviter de renseigner les adresses physiques des périphériques
#include "unistd.h" 				// pour la fonction délai
#include "io.h"
#include "alt_types.h"

#define CAP_CONFIG_REG (unsigned int *)(AVALON_CAP_0_BASE )     // Registre de configuration (Start/Stop, Continu, Raz_n)
#define CAP_CODE_REG (unsigned int *)(AVALON_CAP_0_BASE + 4)    // Registre contenant les données (Valid, Data_anemometre)
void start_compas() {
	IOWR(CAP_CONFIG_REG, 0, 0b111);  // Configuration : Start=0, Continu=1, Raz_n=1 (b2=0, b1=1, b0=1)
}
void stop_compas() {
    *CAP_CONFIG_REG = 0b001;  // // Stop the anemometer (b2=0 pour arrêter), Continuer avec raz_n=1, mais stop
}
float read_compas_data() {
	alt_u32 code_data = *CAP_CODE_REG;     // Lire le registre de données
    // Vérifier si les données sont valides (b9 == 1)
    //if ((code_data & 0x100) == 0) {  // bit 9 = 0 signifie que les données ne sont pas valides
       // printf("Données non valides\n");
       // return -1;
   // }
    alt_u8 angle = code_data & 0x1FF;  // Extraire les bits [8:0] pour obtenir l'angle
    return angle ;
}
int main() {
    printf("Initialisation de compas...\n");
    start_compas();  // Démarrer compas
    while (1) {
        unsigned int ANGLE = read_compas_data();    // Lire l'angle calculée toutes les 1 seconde
        printf("Angle du compas : %u °\n", (ANGLE - 10) ); //Car on avait un écart de 10
        usleep(1000000);
    }
    //stop_anemometer();   // Arrêter l'anémomètre (inutile dans ce cas car la boucle est infinie)
    return 0;
}

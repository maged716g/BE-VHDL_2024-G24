#include "sys/alt_stdio.h"
#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h" // pour �viter de renseigner les adresses physiques des p�riph�riques
#include "unistd.h" 				// pour la fonction d�lai

#define ANEM_BASE (ANEMOMETER_BASE) // Remplace par l'adresse de base de ton p�riph�rique

// Adresses des registres � l'int�rieur de ton p�riph�rique
#define ANEM_CONFIG_REG (unsigned int *)(AVALON_MESURE_FREQ_0_BASE)  // Registre de configuration (Start/Stop, Continu, Raz_n)
#define ANEM_CODE_REG (unsigned int *)(AVALON_MESURE_FREQ_0_BASE + 4)    // Registre contenant les donn�es (Valid, Data_anemometre)
void start_anemometer() {
    // Configuration : Start=1, Continu=0, Raz_n=1 (b2=1, b1=0, b0=1)
    *ANEM_CONFIG_REG = 0x03;
}

void stop_anemometer() {
    // Stop the anemometer (b2=0 pour arr�ter)
    IOWR(ANEM_CONFIG_REG, 0, 0b001);  // Continuer avec raz_n=1, mais stop
}

void read_anemometer_data() {
    // Lire le registre de donn�es
	unsigned int code_data = *ANEM_CODE_REG & 0xFF;
	unsigned int data_valid = *ANEM_CODE_REG & 0x200;

    // V�rifier si les donn�es sont valides (b9 == 1)
    if ((data_valid ) == 1) {  // bit 9 = 0 signifie que les donn�es ne sont pas valides
        printf("Donn�es  valides\n");
        printf("frequence = %uKm/h\n",code_data);
    }
    else {

    	printf("Donn�es  non valides\n");
    }

}

int main() {
    printf("Initialisation de l'an�mom�tre...\n");

    // D�marrer l'an�mom�tre
    start_anemometer();

    while (1) {
        // Lire la fr�quence calcul�e toutes les 1 seconde
    	read_anemometer_data();
        usleep(1000000);  // Pause d'une seconde (1 000 000 microsecondes)
    }
    return 0;
}

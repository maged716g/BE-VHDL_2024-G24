#include "alt_types.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "unistd.h"
#include "stdio.h"

#define control (char *) GESTION_BP_0_BASE
#define code_fonction (char *) (GESTION_BP_0_BASE+4)
#define config_compas (int *) AVALON_CAP_0_BASE
#define Donnee_compas (int *) (AVALON_CAP_0_BASE+4)
#define butee_d (int *)(GESTION_VERIN_0_BASE + 12)
#define butee_g (int *)(GESTION_VERIN_0_BASE + 8)
#define freq (int *) GESTION_VERIN_0_BASE
#define duty (int *)(GESTION_VERIN_0_BASE + 4)
#define config (int *)(GESTION_VERIN_0_BASE + 16)
#define angle_barre (int *)(GESTION_VERIN_0_BASE + 20)


int CONSIGNE_ANGLE=0;  // Exemple : consigne d'angle cible (valeur arbitraire)

int main() {
    unsigned int a, c, d;
    unsigned char b;
    int erreur; // Différence entre consigne et angle mesuré


    printf("Hello from Nios II!\n");

    *control = (*control) | 3; // Activer les circuits gestion_bp et gestion_compas
    *butee_d = 2900;
    *butee_g = 1320;
    *freq = 2000;
    *duty = 1500; // Cycle de travail initial (50%)
    *config = 1;  // Circuit gestion_verin actif, sortie PWM inactive
    *config_compas = 0b111;
    while (1) {
        b = *code_fonction;
        a = ((*Donnee_compas)-10)&511;
        printf("compas = %d\n", a);
        switch (b) {
        	case 0: *config=1;
        	CONSIGNE_ANGLE = a;
        	break;
        	case 1: *config=7;break;
        	case 2: *config=3;break;
        	case 3:
                // Lire la valeur actuelle du compas

                printf("compas = %d\n", a);

                // Calculer l'erreur entre la consigne et l'angle mesuré
                erreur = CONSIGNE_ANGLE - a;
                printf("erreur = %d\n", erreur);
                if(erreur < -1){
                	*config = 3;
                }
                else if(erreur > 1){
                	*config = 7;
                }
                else{
                	*config = 1;
                }
                break;
        	case 4: // Mode manuel (par défaut)
        	                CONSIGNE_ANGLE = CONSIGNE_ANGLE+1;

        	                break;
        	        	case 5: // Mode manuel (par défaut)

        	                            CONSIGNE_ANGLE = CONSIGNE_ANGLE+10;
        	                break;
        	        	case 6: // Mode manuel (par défaut)

        	        	                CONSIGNE_ANGLE = CONSIGNE_ANGLE-1;

        	        	                break;
        	        	        	case 7: // Mode manuel (par défaut)

        	        	                            CONSIGNE_ANGLE = CONSIGNE_ANGLE-10;

        	        	                            break;
            default:*config=1;
        }
        // Afficher les informations
                     c = *freq;
                     printf("consigne = %u\n", CONSIGNE_ANGLE);
                     printf("freq = %d\n", c);
                     c = *butee_d;
                     printf("butee_d = %d\n", c);
                     c = *butee_g;
                     printf("butee_g = %d\n", c);
                     c = *config;
                     printf("config = %d\n", c);
                     d = *angle_barre;
                     printf("angle_barre = %d\n", d);
        usleep(500000); // Pause pour éviter un cycle trop rapide
    }

    return 0;
}

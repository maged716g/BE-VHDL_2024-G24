#include "alt_types.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "unistd.h"
#include "stdio.h"
#define control (char *)        GESTION_BP_0_BASE
#define code_fonction (char *) (GESTION_BP_0_BASE+4)
#define config_compas (int *) AVALON_CAP_0_BASE
#define Donnee_compas (int *) (AVALON_CAP_0_BASE+4)
#define butee_d (int *)(GESTION_VERIN_0_BASE+12)
#define butee_g (int *)(GESTION_VERIN_0_BASE+8)
#define freq (int *)GESTION_VERIN_0_BASE
#define duty (int *)(GESTION_VERIN_0_BASE+4)
#define config (int *)(GESTION_VERIN_0_BASE+16)
#define angle_barre (int *)(GESTION_VERIN_0_BASE+20)

void asservissement(unsigned int eureur){
	if (eureur > 0 ){
		*config=7;
	}else if (eureur < 0){
		*config=3;
	}else {
		*config=1;
	}
}
int main()
{
 unsigned int Consigne_compas =50 ;
 unsigned int a,c,d,eureur;
 unsigned char b;
 printf("Hello from Nios II!\n");
  *control=(*control) | 3;//active circuits gestion_bp et gestion_compas
  *butee_d=2800;
  *butee_g=1600;
  *freq= 2000;
  *duty=1500;
  *config=7; // circuit gestion_verin actif, sortie pwm inactive
  *config_compas = 0b111;
  while (1)
  {
  //test bp en mode manuel seul
  b=*code_fonction;
  printf("code_fonction= %d\n", b);
  a = ((*Donnee_compas)-10)&511;
  eureur = Consigne_compas - a ;

  switch(b)
  {
  case 0: *config=1;break;
  case 1: *config=7;break;
  case 2: *config=3;break;
  case 3: *config=3;
  	  	  asservissement(eureur);
  	  	  break;
  case 4 : Consigne_compas = Consigne_compas +1  ;break;
  case 5 : Consigne_compas = Consigne_compas +10 ;break;
  case 7 : Consigne_compas = Consigne_compas -1  ;break;
  case 6 : Consigne_compas = Consigne_compas -10 ;break;
  default:*config=1;
  }

  printf("Ereur = %u\n", eureur);
  printf("Consigne = %u\n", Consigne_compas);
  printf("compas= %u\n", a);
  c=*freq;
  printf("freq= %d\n", c);
  d=*duty;
  printf("duty= %d\n", d);
  c=*butee_d;
  printf("butee_d= %d\n", c);
  d=*butee_g;
  printf("butee_g= %d\n", d);
  c=*config;
  printf("config= %d\n", c);
  d=*angle_barre;
  printf("angle_barre= %d\n", d);
  usleep(100000);

  }
  return 0;
 }

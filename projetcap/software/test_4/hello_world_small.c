#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "unistd.h" // Pour la fonction usleep()

int main()
{
    int compteur = 0;
    int bouton_precedent = 1; // Le bouton est relâché par défaut (état haut '1')

    // Affichage initial (0 sur les LED)
    IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, compteur);

    while (1)
    {
        // Lecture de l'état actuel du premier bouton (bit 0)
        int bouton_actuel = IORD_ALTERA_AVALON_PIO_DATA(BOUTON_BASE) & 0x01;

        // Détection d'un appui : passage de '1' (relâché) à '0' (appuyé)
        if (bouton_precedent == 1 && bouton_actuel == 0)
        {
            // Anti-rebond : petite pause pour éviter les faux déclenchements
            usleep(20000); // 20 millisecondes

            // Re-vérification après l'anti-rebond
            if ((IORD_ALTERA_AVALON_PIO_DATA(BOUTON_BASE) & 0x01) == 0)
            {
                compteur++; // Incrémentation

                // Remise à 0 si on dépasse 9
                if (compteur > 9)
                {
                    compteur = 0;
                }

                // Affichage de la valeur du compteur en binaire sur les LED
                IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, compteur);
            }
        }

        // Mémorisation de l'état du bouton pour la prochaine boucle
        bouton_precedent = bouton_actuel;

        // Petite pause pour éviter de charger inutilement le processeur
        usleep(1000);
    }

    return 0;
}

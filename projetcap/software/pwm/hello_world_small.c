#include "system.h"
#include "altera_avalon_pio_regs.h"

// Offsets des registres basés sur l'adresse VHDL
#define PWM_FREQ_REG    0   // Offset 0 : Registre FREQ
#define PWM_DUTY_REG    1   // Offset 1 : Registre DUTY
#define PWM_CTRL_REG    2   // Offset 2 : Registre CONTROL

int main()
{
    int periode = 50000; // Période = 50 000 cycles (1 kHz à 50 MHz)
    int duty = 25000;    // Rapport cyclique = 50 % (25 000 / 50 000)

    IOWR(PWM_BASE, PWM_FREQ_REG, periode);

    // 50 %
    IOWR(PWM_BASE, PWM_DUTY_REG, duty);

    // (Bit 0 = Enable, Bit 1 = Run)
    IOWR(PWM_BASE, PWM_CTRL_REG, 0x03);

    while (1)
    {

    }

    return 0;
}

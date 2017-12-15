
#include <alt_types.h>

#include <owm_avalon_slave_regs.h>
#include <owm_avalon_slave.h>


void owm_wait_ready(alt_u32 base)
{
    while (1) {
        if (IORD_OWM_STATUS(base) & OWM_STATUS_IDLE_MSK)
            break;
    }
}

/*
 * Return 1 if presence detected.
 */
int owm_reset(alt_u32 base)
{
    IOWR_OWM_CONTROL(base, OWM_CONTROL_RESET_REQ_MSK);
    owm_wait_ready(base);
    return (IORD_OWM_STATUS(base) & OWM_STATUS_PRESENCE_MSK);
}

void owm_write_bit(alt_u32 base, int val)
{
    if (val) {
        IOWR_OWM_CONTROL(base, OWM_CONTROL_WRITE_REQ_MSK | OWM_CONTROL_WRITE_VAL_MSK);
    } else {
        IOWR_OWM_CONTROL(base, OWM_CONTROL_WRITE_REQ_MSK);
    }
    owm_wait_ready(base);
}

/*
 * Return read bit.
 */
int owm_read_bit(alt_u32 base)
{
    IOWR_OWM_CONTROL(base, OWM_CONTROL_READ_REQ_MSK);
    owm_wait_ready(base);
    return ((IORD_OWM_STATUS(base) & OWM_STATUS_READ_VAL_MSK) != 0);
}

void owm_write_byte(alt_u32 base, unsigned char wval)
{
    // LSB first
    int i = 0;
    for (i = 0; i < 8; ++i) {
        owm_write_bit(base, wval & (1 << i));
    }
}

void owm_write_data(alt_u32 base, unsigned char *data, int size)
{
    // LSB first
    int i = 0;
    for (i = 0; i < size; ++i) {
        owm_write_byte(base, data[i]);
    }
}

unsigned char owm_read_byte(alt_u32 base)
{
    // LSB first
    int i = 0;
    unsigned char rval = 0;
    for (i = 0; i < 8; ++i) {
        if (owm_read_bit(base)) {
            rval = rval | (1 << i);
        }
    }
    return rval;
}

void owm_read_data(alt_u32 base, unsigned char *data, int size)
{
    // LSB first
    int i = 0;
    for (i = 0; i < size; ++i) {
        data[i] = owm_read_byte(base);
    }
}

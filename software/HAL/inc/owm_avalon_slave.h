
#ifndef __OWM_AVALON_SLAVE_H_INCLUDED__
#define __OWM_AVALON_SLAVE_H_INCLUDED__

#ifdef __cplusplus
extern "C" {
#endif

#include <alt_types.h>

#define OWM_AVALON_SLAVE_INSTANCE(name, device) extern int alt_no_storage
#define OWM_AVALON_SLAVE_INIT(name, device) while (0)

extern int owm_reset(alt_u32 base);
extern void owm_write_bit(alt_u32 base, int val);
extern int owm_read_bit(alt_u32 base);
extern void owm_write_byte(alt_u32 base, unsigned char wval);
extern void owm_write_data(alt_u32 base, unsigned char *data, int size);
extern unsigned char owm_read_byte(alt_u32 base);
extern void owm_read_data(alt_u32 base, unsigned char *data, int size);

#ifdef __cplusplus
}
#endif

#endif

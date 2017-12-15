
#ifndef __OWM_REGS_H_INCLUDED__
#define __OWM_REGS_H_INCLUDED__

#include <io.h>

#define OWM_CLK_PRECL_REG                   0
#define IOADDR_OWM_CLK_PRECL(base)          __IO_CALC_ADDRESS_NATIVE(base, OWM_CLK_PRECL_REG)
#define IORD_OWM_CLK_PRECL(base)            IORD(base, OWM_CLK_PRECL_REG)
#define IOWR_OWM_CLK_PRECL(base, data)      IOWR(base, OWM_CLK_PRECL_REG, data)

#define OWM_T_RESET_L_REG                   1
#define IOADDR_OWM_T_RESET_L(base)          __IO_CALC_ADDRESS_NATIVE(base, OWM_T_RESET_L_REG)
#define IORD_OWM_T_RESET_L(base)            IORD(base, OWM_T_RESET_L_REG)
#define IOWR_OWM_T_RESET_L(base, data)      IOWR(base, OWM_T_RESET_L_REG, data)

#define OWM_T_RESET_H_REG                   2
#define IOADDR_OWM_T_RESET_H(base)          __IO_CALC_ADDRESS_NATIVE(base, OWM_T_RESET_H_REG)
#define IORD_OWM_T_RESET_H(base)            IORD(base, OWM_T_RESET_H_REG)
#define IOWR_OWM_T_RESET_H(base, data)      IOWR(base, OWM_T_RESET_H_REG, data)

#define OWM_T_RESET_PD_REG                  3
#define IOADDR_OWM_T_RESET_PD(base)         __IO_CALC_ADDRESS_NATIVE(base, OWM_T_RESET_PD_REG)
#define IORD_OWM_T_RESET_PD(base)           IORD(base, OWM_T_RESET_PD_REG)
#define IOWR_OWM_T_RESET_PD(base, data)     IOWR(base, OWM_T_RESET_PD_REG, data)

#define OWM_T_WRITE_SLOT_REG                4
#define IOADDR_OWM_T_WRITE_SLOT(base)       __IO_CALC_ADDRESS_NATIVE(base, OWM_T_WRITE_SLOT_REG)
#define IORD_OWM_T_WRITE_SLOT(base)         IORD(base, OWM_T_WRITE_SLOT_REG)
#define IOWR_OWM_T_WRITE_SLOT(base, data)   IOWR(base, OWM_T_WRITE_SLOT_REG, data)

#define OWM_T_WRITE_L_REG                   5
#define IOADDR_OWM_T_WRITE_L(base)          __IO_CALC_ADDRESS_NATIVE(base, OWM_T_WRITE_L_REG)
#define IORD_OWM_T_WRITE_L(base)            IORD(base, OWM_T_WRITE_L_REG)
#define IOWR_OWM_T_WRITE_L(base, data)      IOWR(base, OWM_T_WRITE_L_REG, data)

#define OWM_T_WRITE_REC_REG                 6
#define IOADDR_OWM_T_WRITE_REC(base)        __IO_CALC_ADDRESS_NATIVE(base, OWM_T_WRITE_REC_REG)
#define IORD_OWM_T_WRITE_REC(base)          IORD(base, OWM_T_WRITE_REC_REG)
#define IOWR_OWM_T_WRITE_REC(base, data)    IOWR(base, OWM_T_WRITE_REC_REG, data)

#define OWM_T_READ_SLOT_REG                 7
#define IOADDR_OWM_T_READ_SLOT(base)        __IO_CALC_ADDRESS_NATIVE(base, OWM_T_READ_SLOT_REG)
#define IORD_OWM_T_READ_SLOT(base)          IORD(base, OWM_T_READ_SLOT_REG)
#define IOWR_OWM_T_READ_SLOT(base, data)    IOWR(base, OWM_T_READ_SLOT_REG, data)

#define OWM_T_READ_L_REG                    8
#define IOADDR_OWM_T_READ_L(base)           __IO_CALC_ADDRESS_NATIVE(base, OWM_T_READ_L_REG)
#define IORD_OWM_T_READ_L(base)             IORD(base, OWM_T_READ_L_REG)
#define IOWR_OWM_T_READ_L(base, data)       IOWR(base, OWM_T_READ_L_REG, data)

#define OWM_T_READ_READ_REG                 9
#define IOADDR_OWM_T_READ_READ(base)        __IO_CALC_ADDRESS_NATIVE(base, OWM_T_READ_READ_REG)
#define IORD_OWM_T_READ_READ(base)          IORD(base, OWM_T_READ_READ_REG)
#define IOWR_OWM_T_READ_READ(base, data)    IOWR(base, OWM_T_READ_READ_REG, data)

#define OWM_T_READ_REC_REG                  10
#define IOADDR_OWM_T_READ_REC(base)         __IO_CALC_ADDRESS_NATIVE(base, OWM_T_READ_REC_REG)
#define IORD_OWM_T_READ_REC(base)           IORD(base, OWM_T_READ_REC_REG)
#define IOWR_OWM_T_READ_REC(base, data)     IOWR(base, OWM_T_READ_REC_REG, data)

#define OWM_OW_ADDR_REG                     14
#define IOADDR_OWM_OW_ADDR(base)            __IO_CALC_ADDRESS_NATIVE(base, OWM_OW_ADDR_REG)
#define IORD_OWM_OW_ADDR(base)              IORD(base, OWM_OW_ADDR_REG)
#define IOWR_OWM_OW_ADDR(base, data)        IOWR(base, OWM_OW_ADDR_REG, data)


#define OWM_CONTROL_REG                     11
#define IOADDR_OWM_CONTROL(base)            __IO_CALC_ADDRESS_NATIVE(base, OWM_CONTROL_REG)
#define IORD_OWM_CONTROL(base)              IORD(base, OWM_CONTROL_REG)
#define IOWR_OWM_CONTROL(base, data)        IOWR(base, OWM_CONTROL_REG, data)

#define OWM_CONTROL_RESET_REQ_MSK           (0x1)
#define OWM_CONTROL_RESET_REQ_OFST          (0)
#define OWM_CONTROL_WRITE_REQ_MSK           (0x2)
#define OWM_CONTROL_WRITE_REQ_OFST          (1)
#define OWM_CONTROL_WRITE_VAL_MSK           (0x4)
#define OWM_CONTROL_WRITE_VAL_OFST          (2)
#define OWM_CONTROL_READ_REQ_MSK            (0x8)
#define OWM_CONTROL_READ_REQ_OFST           (3)


#define OWM_STATUS_REG                      12
#define IOADDR_OWM_STATUS(base)             __IO_CALC_ADDRESS_NATIVE(base, OWM_STATUS_REG)
#define IORD_OWM_STATUS(base)               IORD(base, OWM_STATUS_REG)
#define IOWR_OWM_STATUS(base, data)         IOWR(base, OWM_STATUS_REG, data)

#define OWM_STATUS_PRESENCE_MSK             (0x1)
#define OWM_STATUS_PRESENCE_OFST            (0)
#define OWM_STATUS_READ_VAL_MSK             (0x2)
#define OWM_STATUS_READ_VAL_OFST            (1)
#define OWM_STATUS_IDLE_MSK                 (0x4)
#define OWM_STATUS_IDLE_OFST                (2)
#define OWM_STATUS_READY_MSK                (0x8)
#define OWM_STATUS_READY_OFST               (3)


#define OWM_IE_REG                          13
#define IOADDR_OWM_IE(base)                 __IO_CALC_ADDRESS_NATIVE(base, OWM_IE_REG)
#define IORD_OWM_IE(base)                   IORD(base, OWM_IE_REG)
#define IOWR_OWM_IE(base, data)             IOWR(base, OWM_IE_REG, data)

#define OWM_IE_IE_MSK                       (0x1)
#define OWM_IE_IE_OFST                      (0x1)

#endif

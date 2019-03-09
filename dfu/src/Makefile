STM_SRC = ../../library/src
STM_INC = ../../library/inc

USB_SRC = ../../usb/src
USB_INC = ../../usb/inc

INCLUDES = -I ../inc \
            -I $(STM_INC) \
            -I $(USB_INC)

CROSS   = arm-none-eabi
CC      = $(CROSS)-gcc
LD      = $(CROSS)-ld -v
AR      = $(CROSS)-ar
AS      = $(CROSS)-as
CP      = $(CROSS)-objcopy
OD      = $(CROSS)-objdump

AFLAGS  = -mcpu=cortex-m3 -mthumb -fdata-sections -ffunction-sections
ASFLAGS = -mcpu=cortex-m3 -mthumb
CFLAGS  =  $(INCLUDES) -c -fno-common -Os -g $(AFLAGS)
LFLAGS  = -TSTM32F103VB.ld --specs=nano.specs -Wl,--gc-sections

CPFLAGS = -Obinary
ODFLAGS = -S

CSRC = hw_config.c \
		main.c \
		spi_flash.c \
		stm32f10x_it.c \
		stm32f10x_vector.c \
		usb_desc.c \
		usb_istr.c \
		usb_prop.c  \
		usb_pwr.c \

STM32SRCS = $(STM_SRC)/stm32f10x_flash.c \
             $(STM_SRC)/stm32f10x_nvic.c \
             $(STM_SRC)/stm32f10x_rcc.c \
             $(STM_SRC)/stm32f10x_gpio.c \
             $(STM_SRC)/stm32f10x_spi.c

USBSRCS = $(USB_SRC)/usb_init.c \
			$(USB_SRC)/usb_regs.c \
			$(USB_SRC)/usb_core.c \
			$(USB_SRC)/usb_int.c \
			$(USB_SRC)/usb_mem.c

CSRC += $(STM32SRCS)
CSRC += $(USBSRCS)
COBJ = $(CSRC:.c=.o)
ASRC = cortexm3_macro.s
AOBJ = $(ASRC:.s=.o)

all: binaries

dso.elf: $(COBJ) $(AOBJ)
	$(CC) $(LFLAGS) -v -o dso.elf $(COBJ) $(AOBJ)

binaries: dso.elf
	$(CP) $(CPFLAGS) dso.elf dso.bin
	$(OD) $(ODFLAGS) dso.elf > dso.lst

clean:
	rm -f *.o dso.elf dso.bin dso.lst $(USB_SRC)/*.o $(STM_SRC)/*.o


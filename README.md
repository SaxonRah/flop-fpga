# flop-fpga
5.25" 5 1/4 fpga floppy controller. The c++ / verilog is pesudo code and an idea.

Ideally omniflop and or fluxengine software would be used by the owner of said device.

Writing a modern 5.25" driver for each os would be the most difficult part i think. 

# starting point ?
https://github.com/defparam/PCI2Nano-RTL

https://github.com/defparam/PCI2Nano-PCB

uses a de10 nano, but would be simple to change

# Why
because it's fun, plus a pcie 5.25" fpga floppy controller would be extremely useful. tweeners or inbetween era pcs are often used for 5.25" data archival. these are becoming more expensive and less of them are around.

you could have a modern pc with a bunch of these pcie flopfpga's each connected to a floppy drive and have a nice multi disk archival system for 5.25" disks. which literally doesn't exist and is desperately needed in the world as magnetic media degrades and fails across it.

# what chip to use
any fpga that can do it, obviously youll need a schematic / pcb with protection / level shifters for the floppy drive and maybe pcie bus? external ram would be useful for buffered 5.25" stuff.

i looked for off the shelf floppy controllers on modern industrial ISA supported motherboards, but couldn't find anything specific.

# other devices chips
## deviceside has a custom 5025 FDC 2115 chip.
asic? fpga? microcontroller?

## greaseweasel v4 uses a ARTERY AT32F403  microcontroller
https://www.arterychip.com/en/product/AT32F403.jsp

## kryoflux uses a Atmel AT91SAM7S256 microcontroller
https://www.microchip.com/en-us/product/at91sam7s256

# why fpga if microcontrollers can do it
support / expansion of the device for other drive types. plus a clearly defined PCB support revision outline can be argued: 5.25" -> 3.5" -> 8" -> others.

sure the same could be said about micros but they often lack pin space and have limited memory and flash. 

besides a pure verilog implementation with an open source driver for each os would be the best for an archival system that will last far in to the future.

# PCIe Floppy Drive Controller
After extensive research on PCIe, it simply isn't possible to have a floppy controller on pcie without custom software. Custom software would render a PCIe floppy controller useless as it would act like a usb floppy and not a native floppy drive connected to the motherboard. The native connection to the CPU is needed to take advantage of the pre-existing windows 7 - windows 11 5.25" floppy drivers, these original windows drivers are needed for omniflop to replace. 

# Ideally omniflop and or fluxengine software would be used by the owner of said device.
The only way I can see a 5.25" working on modern windows is an industrial motherboard and potentially the dISApointment mod using the TPM headers containing the LPC bus. Which most mobos likely require a bodge wire modification. Come can be simple, some can be difficult.

A motherboard with a working dISApointment mod might allow for a Monster FDC 8 Port ISA Floppy Controller, or Quad-Flop – 4 Port ISA Floppy Controller.

Maybe, just maybe, a consumer modern motherboard with winblows will be able to talk to 5.25" and 3.5" disks over the omniflop driver via ISA through LPC bridged to eSPI.

# LPC Spec
Some mobos have ECE1200, W83626F, or F85226A, other chips too support LPC 1.1, which is the full ISA support, however the higher clocked ISA bus can have problems with slower clocked ISA cards. 

Some mobos only have the slower ISA bus supported on LPC.

# Skylake+ cannot support LPC over TPM anymore because of architecture changes which resulted in chipset modifcation over to eSPI.
https://web.archive.org/web/20230927192809/https://community.intel.com/t5/Embedded-Intel-Core-Processors/Anybody-to-know-why-Intel-change-LPC-bus-clock-from-33MHz-to/td-p/652673

# Skylake+ might still support LPC if mobo has chips for eSPI to LPC
ECE1200 eSPI-to-LPC chip. "ECE1200 is a device designed to implement a Bridge function from an eSPI-configured Intel Chipset to a legacy downstream system, providing Master interfaces for an LPC bus, Serial IRQ and CLKRUN# features."
https://www.mouser.com/ProductDetail/Microchip-Technology/ECE1200-I-LD?qs=T3oQrply3y%2FOHml1lyLW5w%3D%3D

EV22J81A is the ECE1200 eSPI-to-LPC dev board, raw chips cost around 4 USD

F85227N eSPI to LPC bridge chip.

# most modern LPC supported mobo i could find 
Asrock B650 LiveMixer motherboard - has special addon card (not released) that takes advantage of the eSPI/LPC bus to extend the motherboard and uses a NCT6686D chip on the mobo to supply LPC to eSPI.
The Asrock X670E Taichi mobo also has a NCT6686D paired with NCT6796D Nuvoton LPC/eSPI SI/O

# PICMG 1.3
PICMG 1.3 host cards sometimes have eSPI with LPC support via bridge chip.

# Existance of POST Code Card for eSPI interface
This to me reinforces the idea that a 5.25" floppy controller should be possible via eSPI to LPC bridge to ISA or LPC supported motherboard to ISA.

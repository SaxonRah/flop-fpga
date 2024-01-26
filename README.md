# New lead - 50 pin Centronics NEC98: 5.25" 1.2Mb external drive / DB25 5.25" 1.2Mb external drive 
It's claimed that windows 7/10/11 legacy drivers exist from DOS/Windows for an external 5.25" drive. I know the 5.25" external drives exist with a DB25, such as CMS Enhancements External 1.2MB Floppy Drive EF-360, but never thought they would work in Windows and still doubt that they do.

In addition, the PC-9800 series has external 5.25" drives, both dual (AD-F51W, CRC-FD5WS-1, FDD-5WN, ID-5W, LDSK-5, LFD-52, LFD-582F, PC-9831-MF2, PC-FD512R) and single drive (AD-F51SR, CRC-FD5SS, FD-51, FDC-57AUTO, FDD-5SN, ID-5S?, LFD-51, LFD-581F, PC-FD511R, TF511), i think these are all 50 pin centronics and not db25 though. Also require something like a NEC floppy board, CRC-FDC3, FDD-1M, FDD-1MZ, FDD-1X, or FDD-1MX to run i would suspect. It's where i think this driver, if it exists stems from originally.. When DOS was competing with CP/M, NEC was able to dominate the Japanese market with DOS and ultimately resulted in said driver for Windows 2000 / NT 4.0. If this 5.25" driver exists and it was on Win2k and or NT 4.0 on some PC-98 system, then XP should have the legacy driver and another pathway would be potentially open for a 5.25" on modern OS via reverse engineering the connection from the PC-98 motherboard to the 5.25" 34 pin connection internal to the external drive enclosures.

# PCIe Floppy Drive Controller
After extensive research on PCIe, it simply isn't possible to have a floppy controller on pcie without custom software. Custom software would render a PCIe floppy controller useless as it would act like a usb floppy and not a native floppy drive connected to the motherboard. The native connection to the CPU is needed to take advantage of the pre-existing windows 7 - windows 11 5.25" floppy drivers, these original windows drivers are needed for omniflop to replace. 

# Ideally omniflop and or fluxengine software would be used by the owner of said device.
The only way I can see a 5.25" working on modern windows is an industrial motherboard and potentially the dISApointment mod using the TPM headers containing the LPC bus. Which most mobos likely require a bodge wire modification. Some can be simple, some can be difficult.

A motherboard with a working dISApointment mod might allow for a Monster FDC 8 Port ISA Floppy Controller, or Quad-Flop – 4 Port ISA Floppy Controller.

Maybe, just maybe, a consumer modern motherboard with winblows will be able to talk to 5.25" and 3.5" disks over the omniflop driver via ISA through LPC bridged to eSPI.

# ISA through LPC bridged to eSPI
![ISA through LPC bridged to eSPI](https://github.com/SaxonRah/flop-fpga/blob/main/image.png)

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

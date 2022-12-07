# Run in build folder
# Open gdb and type "target remote :1234" to start debbuging
OVMF_DIR=/usr/share/edk2-ovmf/x64/
# Fallback if directory not exists (Debian distribution)
[ ! -d $OVMF_DIR ] && OVMF_DIR=/usr/share/ovmf

qemu-system-x86_64 -smp 2 -debugcon file:debug.log -global isa-debugcon.iobase=0x402 -L $OVMF_DIR -bios OVMF.fd -drive file=fat.img,if=ide,id=drive-ide0-0-0,format=raw #-s -S
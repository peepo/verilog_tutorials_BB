
vga.bin: vga.v vga.pcf
	yosys -q -p "synth_ice40 -blif vga.blif" vga.v
	arachne-pnr -d 8k -p vga.pcf vga.blif -o vga.txt
#	icebox_explain rot.txt > rot.ex
	icepack vga.txt vga.bin

upload:
	iceprog -S vga.bin

clean:
	rm -f vga.blif vga.txt vga.ex vga.bin


button.bin: button_top.v iCE40.pcf
	yosys -q -p "synth_ice40 -blif button.blif" button_top.v
	arachne-pnr -d 8k -p iCE40.pcf button.blif -o button.txt
#	icebox_explain rot.txt > rot.ex
	icepack button.txt button.bin

upload:
	iceprog -S button.bin

clean:
	rm -f button.blif button.txt button.ex button.bin

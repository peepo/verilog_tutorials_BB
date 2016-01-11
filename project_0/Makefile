
LED.bin: LED_top.v iCE40.pcf
	yosys -q -p "synth_ice40 -blif LED.blif" LED_top.v
	arachne-pnr -d 8k -p iCE40.pcf LED.blif -o LED.txt
#	icebox_explain rot.txt > rot.ex
	icepack LED.txt LED.bin

upload:
	iceprog -S LED.bin

clean:
	rm -f LED.blif LED.txt LED.ex LED.bin

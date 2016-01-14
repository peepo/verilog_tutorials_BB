
PWM.bin: PWM_top.v iCE40.pcf
	yosys -q -p "synth_ice40 -blif PWM.blif" PWM_top.v LED_wave.v
	arachne-pnr -d 8k -p iCE40.pcf PWM.blif -o PWM.txt
#	icebox_explain PWM.txt > PWM.ex
	icepack PWM.txt PWM.bin

upload:
	iceprog -S PWM.bin

clean:
	rm -f PWM.blif PWM.txt PWM.ex PWM.bin

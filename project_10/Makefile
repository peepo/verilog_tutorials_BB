
servo.bin: servo_top.v iCE40.pcf
	yosys -q -p "synth_ice40 -blif servo.blif" servo_top.v servo.v counter.v
	arachne-pnr -d 8k -p iCE40.pcf servo.blif -o servo.txt
#	icebox_explain servo.txt > servo.ex
	icepack servo.txt servo.bin

upload:
	iceprog -S servo.bin

clean:
	rm -f servo.blif servo.txt servo.ex servo.bin

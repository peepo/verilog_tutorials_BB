
timing.bin: timing_top.v iCE40.pcf
	yosys -q -p "synth_ice40 -blif timing.blif" timing_top.v timing.v
	arachne-pnr -d 8k -p iCE40.pcf timing.blif -o timing.txt
#	icebox_explain rot.txt > rot.ex
	icepack timing.txt timing.bin
	iceunpack timing.bin timing.asc
	icetime -mit timing.asc

upload:
	iceprog -S timing.bin

clean:
	rm -f timing.blif timing.txt timing.ex timing.bin timing.asc

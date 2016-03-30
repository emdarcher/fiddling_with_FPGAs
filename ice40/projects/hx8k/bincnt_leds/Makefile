ARACHNE_PNR_OPT = -d 8k -P ct256
TITLE = bincnt_leds

all: $(TITLE).bin

%.bin: %.v %.pcf
	yosys -q -p "synth_ice40 -blif $*.blif" $*.v
	arachne-pnr $(ARACHNE_PNR_OPT) -p $*.pcf $*.blif -o $*.bit
	icebox_explain $*.bit > $*.ex
	icepack $*.bit $@

clean:
	rm -f  *.blif *.bit *.ex *.bin


ARACHNE_PNR_OPT = -d 8k -P ct256
TITLE = bincnt_leds

all: $(TITLE).bin

%.bin: $(TITLE).v $(TITLE).pcf
	yosys -q -p "synth_ice40 -blif $(TITLE).blif" $(TITLE).v
	arachne-pnr $(ARACHNE_PNR_OPT) -p $(TITLE).pcf $(TITLE).blif -o $(TITLE).txt
	icebox_explain $(TITLE).txt > $(TITLE).ex
	icepack $(TITLE).txt $(TITLE).bin

clean:
	rm -f $(TITLE).blif $(TITLE).txt $(TITLE).ex $(TITLE).bin


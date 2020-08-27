; iván fernández 2017
; main_panel

	#include "wdg_general.csd"
	#include "wdg_generator.csd"

		FLcolor $ColorPanel
		Slabel = "Mini Synth - iván fernández 2017"  ; title of the Panel
		iwidth = 955          ; width
		iheight = 700         ; height
		ix = 200              ; horizontal position
		iy = 150              ; vertical position
		iborder = 0           ; border type of the container. Integer between 0 and 7
		ikbdcapture = 0       ; if 1, then keyboard events are captured by the window
		iclose = 0            ; if other than 0, the window cannot be closed by the user directly
	FLpanel Slabel, iwidth, iheight, ix, iy, iborder, ikbdcapture, iclose
		$FLGROUP_PLAY_STOP(10'28'iplay'istop)
		$FLGROUP_BURSTS(90'28)
		$FLGROUP_AMPLITUD(580'28)

		$FLGROUP_GENERATOR_1(10'170)
		$FLGROUP_GENERATOR_2(10'350)
		$FLGROUP_GENERATOR_3(10'530)

		$FLGROUP_FILTER(580'145)
		$FLGROUP_LFO(580'455)
		$FLGROUP_REVERB(580'605)
	FLpanelEnd
		FLrun

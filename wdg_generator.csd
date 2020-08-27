; wdg_generator.csd
; contiene los grupos para los tres generadores individuales


; ==============================================================
; Generador 1
;
; xpos : posición horizontal del grupo dentro del panel
; ypos : posición vertical del grupo dentro del panel

; CVONTIENE:
; gkGen1Activate : Activa el generador de señal para poder sumarlo a la mezcla. Si no está activado no influye en nada en la salida.
; gkGen1Mode : El tipo de onda que se usa como generador.
; ==============================================================
#define FLGROUP_GENERATOR_1(xpos'ypos)
#
	idespl = 70
	iwidth = idespl * 8 + 3
	iheight = 155
	$GROUP_HEAD($xpos'$ypos'iwidth)
	FLgroup "  OSCILADOR 1", iwidth, iheight, $xpos, $ypos, 0
			FLlabel 12, 1, 1, 1, 60, 32
			FLcolor -1
			ix = $xpos + 8
			iy = $ypos + 10
			ion1 = 1
			ioff1 = 0
			itype = 22
			iwidth = 55
			iheight = 20	
			iopcode = -1
		gkGen1Activate, ihGen1Activate FLbutton "on/off    ", ion1, ioff1, itype, iwidth, iheight, ix, iy, iopcode
		FLsetVal_i 1, ihGen1Activate
			FLlabel 14, 1, 3, $ColorTextLabel
			FLcolor $ColorGroup
			itype = 1
			ifont = 1
			isize = 14 
			iheight = 20
			ix = ix + idespl - 5
			iw = 400
		ihGen1txt FLbox "type:    saw     sqr/pw    tri/rp    pulse   intSaw   sq         tri", itype, ifont, isize, iw, iheight, ix, iy
			FLlabel 10, 1, 1, 1, 60, 32
			FLcolor -1
			itype = 22
			inumx = 7
			inumy = 1
			iwidth = 350
			iheight = 27
			ix = ix + 55
			iy = iy + 25
		gkGen1Mode, ihGen1bb FLbutBank itype, inumx, inumy, iwidth, iheight, ix, iy, -1
			FLlabel $LabelWidget
			FLcolor $ColorWidget
			ix = $xpos + 5
			iy = $ypos + 70
		$KNOB(Gen1Level'"Level"'ix'iy'0'1'.5'0)
			ix = ix + idespl
		$KNOB(Gen1FShift'"OCTShift"'ix'iy'-12'12'0'0)
			ix = ix + idespl
		$KNOB(Gen1FShiftFine'"SEMShift"'ix'iy'-100'100'0'0)
			ix = ix + idespl
		$KNOB(Gen1Pwr'"Pw/Ramp"'ix'iy'.05'.95'.5'0)
			ix = ix + idespl
		$KNOB(Gen1Phs'"Phase"'ix'iy'0'1'0'0)
			ix = ix + idespl
		$KNOB(Gen1Bw'"Bandwith"'ix'iy'0'.5'.5'0)
			ix = ix + idespl
		$KNOB(Gen1LfoAmp'"Lfo"'ix'iy'0'1'0'0)
			ix = ix + idespl
		$KNOB(Gen1LfoEnv'"FEnv"'ix'iy'0'1'0'0)
	FLgroupEnd
#

; ==============================================================
; Generador 2
;
; xpos : posición horizontal del grupo dentro del panel
; ypos : posición vertical del grupo dentro del panel

; CVONTIENE:
; gkGen2Activate : Activa el generador de señal para poder sumarlo a la mezcla. Si no está activado no influye en nada en la salida.
; gkGen2Mode : El tipo de onda que se usa como generador.
; ==============================================================
#define FLGROUP_GENERATOR_2(xpos'ypos)
#
	idespl = 70
	iwidth = idespl * 8 + 3
	iheight = 155
	$GROUP_HEAD($xpos'$ypos'iwidth)
	FLgroup "  OSCILADOR 2", iwidth, iheight, $xpos, $ypos, 0
			FLlabel 12, 1, 1, 1, 60, 32
			FLcolor -1
			ix = $xpos + 8
			iy = $ypos + 10
			ion2 = 1
			ioff2 = 0
			itype = 22
			iwidth = 55
			iheight = 20	
			iopcode = -1
		gkGen2Activate, ihGen2Activate FLbutton "on/off    ", ion2, ioff2, itype, iwidth, iheight, ix, iy, iopcode
		FLsetVal_i 1, ihGen2Activate
			FLlabel 14, 1, 3, $ColorTextLabel
			FLcolor $ColorGroup
			itype = 1
			ifont = 1
			isize = 14 
			iheight = 20
			ix = ix + idespl - 5
			iw = 400
		ihGen2txt FLbox "type:    saw     sqr/pw    tri/rp    pulse   intSaw   sq         tri", itype, ifont, isize, iw, iheight, ix, iy
			FLlabel 10, 1, 1, 1, 60, 32
			FLcolor -1
			itype = 22
			inumx = 7
			inumy = 1
			iwidth = 350
			iheight = 27
			ix = ix + 55
			iy = iy + 25
		gkGen2Mode, ihGen2bb FLbutBank itype, inumx, inumy, iwidth, iheight, ix, iy, -1
			FLlabel $LabelWidget
			FLcolor $ColorWidget
			ix = $xpos + 5
			iy = $ypos + 70
		$KNOB(Gen2Level'"Level"'ix'iy'0'1'.5'0)
			ix = ix + idespl
		$KNOB(Gen2FShift'"OCTShift"'ix'iy'-12'12'0'0)
			ix = ix + idespl
		$KNOB(Gen2FShiftFine'"SEMShift"'ix'iy'-100'100'0'0)
			ix = ix + idespl
		$KNOB(Gen2Pwr'"Pw/Ramp"'ix'iy'.05'.95'.5'0)
			ix = ix + idespl
		$KNOB(Gen2Phs'"Phase"'ix'iy'0'1'0'0)
			ix = ix + idespl
		$KNOB(Gen2Bw'"Bandwith"'ix'iy'0'.5'.5'0)
			ix = ix + idespl
		$KNOB(Gen2LfoAmp'"Lfo"'ix'iy'0'1'0'0)
			ix = ix + idespl
		$KNOB(Gen2LfoEnv'"FEnv"'ix'iy'0'1'0'0)
	FLgroupEnd
#

; ==============================================================
; Generador 3
;
; xpos : posición horizontal del grupo dentro del panel
; ypos : posición vertical del grupo dentro del panel

; CVONTIENE:
; gkGen3Activate : Activa el generador de señal para poder sumarlo a la mezcla. Si no está activado no influye en nada en la salida.
; gkGen3Mode : El tipo de onda que se usa como generador.
; ==============================================================
#define FLGROUP_GENERATOR_3(xpos'ypos)
#
	idespl = 70
	iwidth = idespl * 8 + 3
	iheight = 155
	$GROUP_HEAD($xpos'$ypos'iwidth)
	FLgroup "  OSCILADOR 3", iwidth, iheight, $xpos, $ypos, 0
			FLlabel 12, 1, 1, 1, 60, 32
			FLcolor -1
			ix = $xpos + 8
			iy = $ypos + 10
			ion3 = 1
			ioff3 = 0
			itype = 22
			iwidth = 55
			iheight = 20	
			iopcode = -1
		gkGen3Activate, ihGen3Activate FLbutton "on/off    ", ion3, ioff3, itype, iwidth, iheight, ix, iy, iopcode
		FLsetVal_i 1, ihGen3Activate
			FLlabel 14, 1, 3, $ColorTextLabel
			FLcolor $ColorGroup
			itype = 1
			ifont = 1
			isize = 14 
			iheight = 20
			ix = ix + idespl - 5
			iw = 400
		ihGen3txt FLbox "type:    saw     sqr/pw    tri/rp    pulse   intSaw   sq         tri", itype, ifont, isize, iw, iheight, ix, iy
			FLlabel 10, 1, 1, 1, 60, 32
			FLcolor -1
			itype = 22
			inumx = 7
			inumy = 1
			iwidth = 350
			iheight = 27
			ix = ix + 55
			iy = iy + 25
		gkGen3Mode, ihGen3bb FLbutBank itype, inumx, inumy, iwidth, iheight, ix, iy, -1
			FLlabel $LabelWidget
			FLcolor $ColorWidget
			ix = $xpos + 5
			iy = $ypos + 70
		$KNOB(Gen3Level'"Level"'ix'iy'0'1'.5'0)
			ix = ix + idespl
		$KNOB(Gen3FShift'"OCTShift"'ix'iy'-12'12'0'0)
			ix = ix + idespl
		$KNOB(Gen3FShiftFine'"SEMShift"'ix'iy'-100'100'0'0)
			ix = ix + idespl
		$KNOB(Gen3Pwr'"Pw/Ramp"'ix'iy'.05'.95'.5'0)
			ix = ix + idespl
		$KNOB(Gen3Phs'"Phase"'ix'iy'0'1'0'0)
			ix = ix + idespl
		$KNOB(Gen3Bw'"Bandwith"'ix'iy'0'.5'.5'0)
			ix = ix + idespl
		$KNOB(Gen3LfoAmp'"Lfo"'ix'iy'0'1'0'0)
			ix = ix + idespl
		$KNOB(Gen3LfoEnv'"FEnv"'ix'iy'0'1'0'0)
	FLgroupEnd
#



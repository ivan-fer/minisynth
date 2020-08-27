/*
iván fernández 2017
widgets_gral.csd
Setup de los widgets en general.
*/

; ============================================================
; Paleta de colores para las diferentes partes de los widgets
; ============================================================
#define ColorPanel #70, 96, 63#
#define ColorGroup #62, 113, 59#             ; color de los group panels
#define ColorTextLabel #255, 255, 255#       ; color de las etiquetas de los grupos
#define ColorWidget #80, 140, 63#
#define LabelWidget #12, 1, 3, 1, 65, 32#


; ============================================================
; Encabezado genérico para cada grupo de controles
;
; xpos : posición horizontal del grupo dentro del panel
; ypos : posición vertical del grupo dentro del panel
; width : ancho del grupo
; ============================================================
#define GROUP_HEAD(xpos'ypos'width)
#
		FLlabel 14, 1, 6, $ColorTextLabel ; fuente y color de la etiqueta
		FLcolor $ColorGroup
	FLgroup "", $width, 17, $xpos, $ypos - 17, 0
	FLgroupEnd
#

; ============================================================
; Un Knob medianamente personalizable con un box que muestra el valor
;
; name : nombre del knob. Identificador ... 'gk$name' es el identificador global
; label : Etiqueta para el knob
; xpos : posición horizontal del grupo dentro del grupo
; ypos : posición vertical del grupo dentro del grupo
; vmin : valor mínimo
; vmax : valor máximo
; vini : valor inicial
; texp : tipo de curva del knob. 0 es lineal, -1 es exponencial
; ============================================================
#define KNOB(name'label'xpos'ypos'vmin'vmax'vini'vexp)
#
		iwidth = 50
		iheight = 18
	iDisp$name FLvalue "", iwidth, iheight, $xpos, $ypos + 58
		itype = 4
		iwidth = 40
	gk$name, ih$name FLknob $label, $vmin, $vmax, $vexp, itype, iDisp$name, iwidth, $xpos + 5, $ypos
	FLsetVal_i $vini, ih$name
#

; ==============================================================
; Grupo que prende y apaga un instrumento
;
; xpos : posición horizontal del grupo dentro del panel
; ypos : posición vertical del grupo dentro del panel
; instrplay : número del instrumento a prender y apagar
; instrstop : instrumento que apaga a 'ninstr'
; ==============================================================
#define FLGROUP_PLAY_STOP(xpos'ypos'instrplay'instrstop)
#
	iwidth = 73
	$GROUP_HEAD($xpos'$ypos'iwidth)
		iheight = 39
		ix = $xpos
		iy = $ypos
		iborder = 0
	FLgroup " Play", iwidth, iheight, ix, iy, iborder
			ion = 0
			ioff = 0
			itype = 1
			iwidth = 30
			iheight = 30	
			ix = ix + 5
			iy = iy + 5
			iplayopcode = 0
			istarttim = 0
			idur = -1                    ;Turn instruments on idefinitely
			FLlabel 12, 1, 1, 1, 50, 32
			FLcolor $ColorWidget
		gkplay, ihb1 FLbutton "@>", ion, ioff, itype, iwidth, iheight, ix, iy, iplayopcode, $instrplay, istarttim, idur 
			ix = ix + iwidth + 3
		gkstop, ihb2 FLbutton "@square", ion,ioff, itype, iwidth, iheight, ix, iy, iplayopcode, $instrstop, istarttim, idur
	FLgroupEnd
#


; =========================================================
; Grupo que controla el tocado de sonidos
;
; xpos : posición horizontal del grupo dentro del panel
; ypos : posición vertical del grupo dentro del panel
;==========================================================
#define FLGROUP_BURSTS(xpos'ypos)
#
	idespl = 60
	iw = idespl * 8 + 5
	ih = 115
	$GROUP_HEAD($xpos'$ypos'iw)
	FLgroup "   Bursts", iw, ih, $xpos, $ypos, 0
			ix = $xpos + 15
			iy = $ypos + 7
		ihBrstxt1 FLbox "Densidad:", 1, 1, 14, 60, 20, ix, iy
			ix = ix + idespl * 2
		ihBrstxt2 FLbox "Duración:", 1, 1, 14, 60, 20, ix, iy
			ix = ix + idespl * 2
		ihBrstxt2 FLbox "Amplitud:", 1, 1, 14, 60, 20, ix, iy
			ix = ix + idespl * 2
		ihBrstxt3 FLbox "Frecuencia:", 1, 1, 14, 60, 20, ix, iy
		FLlabel $LabelWidget
		FLcolor $ColorWidget
			ix = $xpos + 5
			iy = $ypos + 30
		$KNOB(BrsDenMin'"Min"'ix'iy'.1'5'.5'0)
			ix = ix + idespl
		$KNOB(BrsDenMax'"Max"'ix'iy'.1'5'.8'0)
			ix = ix + idespl
		$KNOB(BrsDurMin'"Min"'ix'iy'0.1'5'.4'0)
			ix = ix + idespl
		$KNOB(BrsDurMax'"Max"'ix'iy'0.1'5'1'0)
			ix = ix + idespl
		$KNOB(BrsAmpMin'"Min"'ix'iy'0'1'.4'0)
			ix = ix + idespl
		$KNOB(BrsAmpMax'"Max"'ix'iy'0'1'.7'0)
			ix = ix + idespl
		$KNOB(BrsCpsMin'"Min"'ix'iy'0'127'48'0)
			ix = ix + idespl
		$KNOB(BrsCpsMax'"Max"'ix'iy'0'127'60'0)
	FLgroupEnd
#

; =========================================================
; Grupo que controla la envolvente de amplitud
;
; xpos : posición horizontal del grupo dentro del panel
; ypos : posición vertical del grupo dentro del panel
;==========================================================
#define FLGROUP_AMPLITUD(xpos'ypos)
#
	idespl = 60
	iw = idespl * 6 + 5
	ih = 95
	$GROUP_HEAD($xpos'$ypos'iw)
	FLgroup "   Envolvente General", iw, ih, $xpos, $ypos, 0
		FLlabel $LabelWidget
		FLcolor $ColorWidget
			ix = $xpos + 5
			iy = $ypos + 10
		$KNOB(AmpAtt'"Att"'ix'iy'0'5'.5'0)
			ix = ix + idespl
		$KNOB(AmpDec'"Dec"'ix'iy'0'5'.1'0)
			ix = ix + idespl
		$KNOB(AmpSus'"Sus"'ix'iy'0'1'.9'0)
			ix = ix + idespl
		$KNOB(AmpRel'"Rel"'ix'iy'0'5'.5'0)
			ix = ix + idespl
		$KNOB(AmpDel'"Del"'ix'iy'0'5'0'0)
			ix = ix + idespl
		$KNOB(AmpLevel'"Level"'ix'iy'0'1'.5'0)
	FLgroupEnd
#

; =========================================================
; Grupo que controla el filtro
;
; xpos : posición horizontal del grupo dentro del panel
; ypos : posición vertical del grupo dentro del panel
;==========================================================
#define FLGROUP_FILTER(xpos'ypos)
#
	idespl = 60
	iw = idespl * 6 + 5
	ih = 250
	$GROUP_HEAD($xpos'$ypos'iw)
	FLgroup "   Filtro", iw, ih, $xpos, $ypos, 0
			FLlabel 12, 1, 1, 1, 60, 32
			FLcolor -1
			ix = $xpos + 10
			iy = $ypos + 10
			ifltOn = 1
			ifltOff = 0
			itype = 22
			iwidth = 55
			iheight = 20	
			iopcode = -1
		gkFltActivate, ihFltActivate FLbutton "on/off    ", ifltOn, ifltOff, itype, iwidth, iheight, ix, iy, iopcode
		FLsetVal_i 1, ihFltActivate
		FLlabel $LabelWidget
		FLcolor $ColorWidget
			ix = $xpos + 5
			iy = $ypos + 40
		$KNOB(FltAtt'"Att"'ix'iy'0'5'.5'0)
			ix = ix + idespl
		$KNOB(FltDec'"Dec"'ix'iy'0'5'.1'0)
			ix = ix + idespl
		$KNOB(FltSus'"Sus"'ix'iy'0'1'.9'0)
			ix = ix + idespl
		$KNOB(FltRel'"Rel"'ix'iy'0'5'.5'0)
			ix = ix + idespl
		$KNOB(FltDel'"Del"'ix'iy'0'5'0'0)
			ix = ix + idespl
		$KNOB(FltLevel'"Level"'ix'iy'0'1'.5'0)

			ix = $xpos + 5
			iy = $ypos + 130
		$KNOB(FltCf'"CF"'ix'iy'10'18000'1000'0)
			ix = ix + idespl
		$KNOB(FltBw'"BW"'ix'iy'5'100'50'0)

	FLgroupEnd
#

; =========================================================
; Grupo que controla el LFO
;
; xpos : posición horizontal del grupo dentro del panel
; ypos : posición vertical del grupo dentro del panel
;==========================================================
#define FLGROUP_LFO(xpos'ypos)
#
	idespl = 60
	iw = idespl * 4 + 50
	ih = 127
	$GROUP_HEAD($xpos'$ypos'iw)
	FLgroup "  LFO", iw, ih, $xpos, $ypos, 0
			FLlabel 12, 1, 1, 1, 60, 32
			FLcolor -1
			ix = $xpos + 10
			iy = $ypos + 10
			ilfoon = 1
			ilfooff = 0
			itype = 22
			iwidth = 55
			iheight = 20	
			iopcode = -1
		gkLfoActivate, ihLfoActivate FLbutton "on/off    ", ilfoon, ilfooff, itype, iwidth, iheight, ix, iy, iopcode
		FLsetVal_i 1, ihLfoActivate
			FLlabel 14, 1, 3, $ColorTextLabel
			FLcolor $ColorGroup
			itype = 1
			ifont = 1
			isize = 14 
			ix = ix + idespl + 10
			iheight = 20
			iw = 20
		ihLfotxt1 FLbox "type:", itype, ifont, isize, iw, iheight, ix, iy
			FLlabel 10, 1, 1, 1, 60, 32
			FLcolor -1
			itype = 22
			inumx = 6
			inumy = 1
			iwidth = 170
			iheight = 27
			ix = ix + 30
		gkLfoType, ihLfoType FLbutBank itype, inumx, inumy, iwidth, iheight, ix, iy, -1
		FLlabel $LabelWidget
		FLcolor $ColorWidget
			ix = $xpos + 5
			iy = $ypos + 40
		$KNOB(LfoFreq'"Rate"'ix'iy'0'50'5'0)
			ix = ix + idespl
		$KNOB(LfoDel'"Del"'ix'iy'0'3'0'0)
	FLgroupEnd
#

; ==============================================================
; Grupo que manipula un reverb
;
; xpos : posición horizontal del grupo dentro del panel
; ypos : posición vertical del grupo dentro del panel
; ==============================================================
#define FLGROUP_REVERB(xpos'ypos)
#
	idespl = 60
	iw = idespl * 3 + 5
	ih = 90
	$GROUP_HEAD($xpos'$ypos'iw)
	FLgroup "  Reverb", iw, ih, $xpos, $ypos, 0
		FLlabel $LabelWidget
		FLcolor $ColorWidget
			ix = $xpos + 5
			iy = $ypos + 2
		$KNOB(ReverbAmount'"Amount"'ix'iy'.001'.997'.5'0)
			ix = ix + idespl
		$KNOB(ReverbFblvl'"Feedback"'ix'iy'0.001'.997'.65'0)
			ix = ix + idespl
		$KNOB(ReverbFco'"Cutoff"'ix'iy'16'21000'7023'0)
	FLgroupEnd
#

















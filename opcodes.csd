;================================================
; Contiene todos los UDOs usados por minisynth.csd

;================================================






; =====================================================================================================

; Obtiene el modo de selección de onda del vco2
; =====================================================================================================
opcode getVco2Mode, k, k
	kfn xin
	kmode init 0
	if kfn == 0 then
		kmode = 0     ;--- sawtooth wave with no k-rate phase control
	elseif kfn == 1 then
		kmode = 2     ;--- square / PWM -- Necesita kpw (rango de 0 a 1)
	elseif kfn == 2 then
		kmode = 4     ;--- Saw/Tri ramp -- Necesita kpw (rango .01 a .99)
	elseif kfn == 3 then
		kmode = 6     ;---- Pulse -- no está normalizado
	elseif kfn == 4 then
		kmode = 8     ;--- Integrate Saw
	elseif kfn == 5 then
		kmode = 10    ;--- Square
	elseif kfn == 6 then
		kmode = 12    ;--- Triangle
	endif
	xout kmode
endop

; =====================================================================================================
; VcoGen
; asig VcoGen ilevel, icps, koctshift, ksemshift, kmode, kpwr, kphase, kbw, klfo, kfrtoenv

; ilevel    : nivel de señal que se envía a la mezcla
; icps      : frecuencia de la señal
; koctshift : desplazador de frecuencia en semitonos. -12 a +12 semitonos
; ksemshift : desplazador de frecuencia fina en el rango de -1 a +1 semitono
; kmode     : tipo de onda usada
; kpwr      : ancho de la onda cuadrada (modo 2) o ramp de la ondea triángulo (modo 4)
; kphase    : fase del oscilador
; kbw       : ancho de banda de la onda generada  (0, .5)
; klfo      : cantidad de señal que se le envía al lfo (0, 1)
; kfrtoenv  : la frecuencia varía con la envolvente general  (-1 oct, +1 oct)
; =====================================================================================================
opcode VcoGen, a, kikkkkkkkk
	klevel, icps, koctshift, ksemshift, kmode, kpwr, kphase, kbw, klfo, kfrtoenv xin
	
	ibw init i(kbw)
	ibw init i(kmode)
	ilfoType init 0
	ares init 0    ; señal de salida

	; LFO ==================================================
	klfoDel linseg 0, i(gkLfoDel) + .001, 0, .001, 1
	klfoAmp portk klfo, .01
	klfoFreq portk gkLfoFreq, .01
	; VCO2 ==================================================
		kdelay port gkAmpDel, .001 
		kattack port gkAmpAtt, .001 
		kdecay port gkAmpDec, .001
		ksuslevel port gkAmpSus, .001
		krelease port gkAmpRel, .001
	kenv linsegr 0, i(kdelay) + .0001, 0, i(kattack) + .0001, 1, i(kdecay) + .0001, i(ksuslevel), i(krelease), 0
	kenv = kenv * klevel
	kpw portk kpwr, .01   ;the pulse width of the square wave (imode waveform=2) or the ramp characteristics of the triangle wave (imode waveform=4).
	kphs portk kphase, .003
	;frequency modulator =====================================
	kcps = icps * semitone(int(koctshift)) * cent(ksemshift)
	kcps = kcps * (1 + kfrtoenv)
	kcps portk kcps, .002

	; Bandwith and lfo type changes
	kchg changed kbw, kmode, gkLfoType
	if kchg == 1 then
		reinit REINIT_MODE_GENERATOR
	endif
	REINIT_MODE_GENERATOR:
		ibw = i(kbw)
		imode = i(kmode)
		ilfoType = i(gkLfoType)
		klfo lfo klfoAmp * (abs(kcps - icps)) * klfoDel, klfoFreq, ilfoType
		ares vco2 kenv, kcps + klfo * gkLfoActivate, imode, kpw, kphs, ibw
	rireturn

	xout ares
endop

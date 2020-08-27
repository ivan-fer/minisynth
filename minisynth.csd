; iv�n fern�ndez 2017
<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

	sr = 44100
	ksmps = 16
	nchnls = 2
	0dbfs = 1

	iplay nstrnum "Bursts"
	istop nstrnum "StopBursts"

 
	#include "wdg_main.csd"
	#include "opcodes.csd"


	garevL init 0    ; reverb
	garevR init 0 
	alwayson "Reverb"


instr Bursts
	kfreq random gkBrsCpsMin, gkBrsCpsMax
	kamp random gkBrsAmpMin, gkBrsAmpMax
	kdur random gkBrsDurMin, gkBrsDurMax

			kcps rspline gkBrsDenMin, gkBrsDenMax, .5, 1.1
		ktrig metro kcps
	schedkwhen ktrig, 0, 0, "Generator", 0, kdur, kamp, cpsmidinn(kfreq)
endin


instr StopBursts
	turnoff2 "Bursts", 0, 1   ; apaga el instr 'Bursts' y permite el release
   turnoff                   ; apaga este instrumento
endin


instr Generator
	iamp = p4
	icps = p5
	ktoRev = gkReverbAmount

	kamp1 = gkGen1Level * gkGen1Activate * iamp
	kamp2 = gkGen2Level * gkGen2Activate * iamp
	kamp3 = gkGen3Level * gkGen3Activate * iamp

	; el tipo de onda usada en el vco2
	kmode1 getVco2Mode gkGen1Mode	
	kmode2 getVco2Mode gkGen2Mode	
	kmode3 getVco2Mode gkGen3Mode	

	asig1 VcoGen kamp1, icps, gkGen1FShift, gkGen1FShiftFine, kmode1, gkGen1Pwr, gkGen1Phs, gkGen1Bw, gkGen1LfoAmp, gkGen1LfoEnv
	asig2 VcoGen kamp2, icps, gkGen2FShift, gkGen2FShiftFine, kmode2, gkGen2Pwr, gkGen2Phs, gkGen2Bw, gkGen2LfoAmp, gkGen2LfoEnv
	asig3 VcoGen kamp3, icps, gkGen3FShift, gkGen3FShiftFine, kmode3, gkGen3Pwr, gkGen3Phs, gkGen3Bw, gkGen3LfoAmp, gkGen3LfoEnv

	; si el modo de selecci�n es un pulso no normalizado ...
	if kmode1 == 6 then
		asig1 limit asig1, -.7, .7
	endif
	if kmode2 == 6 then
		asig2 limit asig2, -.7, .7
	endif
	if kmode3 == 6 then
		asig3 limit asig3, -.7, .7
	endif

	asig = (asig1 + asig2 + asig3) * gkAmpLevel

	; filtro
		kdelay port gkFltDel, .001 
		kattack port gkFltAtt, .001 
		kdecay port gkFltDec, .001
		ksuslevel port gkFltSus, .001
		krelease port gkFltRel, .001
	kenv linsegr 0, i(kdelay) + .0001, 0, i(kattack) + .0001, 1, i(kdecay) + .0001, i(ksuslevel), i(krelease), 0
	kenv = kenv * gkFltLevel * gkFltActivate
	afilt resonr asig, gkFltCf, gkFltBw
	afilt balance afilt, asig

	; salida
	ares = asig + afilt * kenv
		outs ares, ares

	garevL += ares * ktoRev
	garevR += ares * ktoRev

endin


instr +Reverb
	aL, aR reverbsc garevL, garevR, gkReverbFblvl, gkReverbFco, sr, 0.5, 1
		outs aL, aR
	clear garevL, garevR
endin

</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>
























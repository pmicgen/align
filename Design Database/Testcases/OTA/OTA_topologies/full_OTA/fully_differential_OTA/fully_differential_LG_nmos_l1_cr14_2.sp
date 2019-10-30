************************************************************************
* auCdl Netlist:
* 
* Library Name:  OTA_class
* Top Cell Name: fully_differential
* View Name:     schematic
* Netlisted on:  Sep 11 21:04:32 2019
************************************************************************

*.BIPOLAR
*.RESI = 2000 
*.RESVAL
*.CAPVAL
*.DIOPERI
*.DIOAREA
*.EQUATION
*.SCALE METER
*.MEGA
.PARAM

*.GLOBAL vdd!
+        gnd!

*.PIN vdd!
*+    gnd!

************************************************************************
* Library Name: OTA_class
* Cell Name:    fully_differential
* View Name:    schematic
************************************************************************

.SUBCKT fully_differential Vbiasn Vbiasp Vinn Vinp Voutn Voutp
*.PININFO Vbiasn:I Vbiasp:I Vinn:I Vinp:I Voutn:O Voutp:O
MM1 Voutn Vbiasp vdd! vdd! pmos_rvt w=WA l=LA nfin=nA
MM2 Voutp Vbiasp vdd! vdd! pmos_rvt w=WA l=LA nfin=nA
MM4 net14 Vbiasn gnd! gnd! nmos_rvt w=WA l=LA nfin=nA
MM3 Voutn Vinp net14 gnd! nmos_rvt w=WA l=LA nfin=nA
MM0 Voutp Vinn net14 gnd! nmos_rvt w=WA l=LA nfin=nA
.ENDS


.SUBCKT LG_nmos_l1 Biasn Vbiasn Vbiasp
*.PININFO Biasn:I Vbiasn:O Vbiasp:O
MM2 Vbiasn Vbiasn gnd! gnd! nmos_rvt w=WA l=LA nfin=nA
MM10 Vbiasp Biasn gnd! gnd! nmos_rvt w=WA l=LA nfin=nA
MM1 Vbiasn Vbiasp vdd! vdd! pmos_rvt w=WA l=LA nfin=nA
MM0 Vbiasp Vbiasp vdd! vdd! pmos_rvt w=WA l=LA nfin=nA
.ENDS

.SUBCKT CR14_2 Vbiasn Vbiasp
*.PININFO Vbiasn:O Vbiasp:O
MM2 Vbiasp Vbiasn gnd! gnd! nmos_rvt w=WA l=LA nfin=nA
MM0 net010 Vbiasn gnd! gnd! nmos_rvt w=WA l=LA nfin=nA
MM3 Vbiasp Vbiasp vdd! vdd! pmos_rvt w=WA l=LA nfin=nA
MM1 Vbiasn Vbiasp vdd! vdd! pmos_rvt w=WA l=LA nfin=nA
RR0 Vbiasn net010 res=rK
.ENDS


xiota LG_Vbiasn LG_Vbiasp Vinn Vinp Voutn Voutp fully_differential
xiLG_nmos_l1 Biasn LG_Vbiasn LG_Vbiasp LG_nmos_l1
xibCR14_2 Biasn Vbiasp CR14_2
.END
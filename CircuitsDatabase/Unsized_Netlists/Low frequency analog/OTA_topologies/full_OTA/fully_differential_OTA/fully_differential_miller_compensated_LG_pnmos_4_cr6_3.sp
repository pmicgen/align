************************************************************************
* auCdl Netlist:
* 
* Library Name:  OTA_class
* Top Cell Name: fully_differential_miller_compensated
* View Name:     schematic
* Netlisted on:  Sep 11 21:05:48 2019
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
* Cell Name:    fully_differential_miller_compensated
* View Name:    schematic
************************************************************************

.SUBCKT fully_differential_miller_compensated Vbiasn Vbiasp Vinn Vinp Voutn 
+ Voutp
*.PININFO Vbiasn:I Vbiasp:I Vinn:I Vinp:I Voutn:O Voutp:O
MM7 Voutp net15 vdd! vdd! pmos w=WA l=LA nfin=nA
MM1 net22 Vbiasp vdd! vdd! pmos w=WA l=LA nfin=nA
MM2 net15 Vbiasp vdd! vdd! pmos w=WA l=LA nfin=nA
MM5 Voutn net22 vdd! vdd! pmos w=WA l=LA nfin=nA
MM8 Voutp Vbiasn gnd! gnd! nmos w=WA l=LA nfin=nA
MM3 net22 Vinp net21 gnd! nmos w=WA l=LA nfin=nA
MM0 net15 Vinn net21 gnd! nmos w=WA l=LA nfin=nA
MM4 net21 Vbiasn gnd! gnd! nmos w=WA l=LA nfin=nA
MM6 Voutn Vbiasn gnd! gnd! nmos w=WA l=LA nfin=nA
CC1 Voutp net15 1p $[CP]
CC0 Voutn net22 1p $[CP]
.ENDS


.SUBCKT LG_pnmos_4 Biasp Vbiasn Vbiasp
*.PININFO Biasp:I Vbiasn:O Vbiasp:O
MM1 Vbiasn Vbiasn gnd! gnd! nmos w=WA l=LA nfin=nA
MM0 Vbiasp net6 gnd! gnd! nmos w=WA l=LA nfin=nA
MM8 net6 net6 gnd! gnd! nmos w=WA l=LA nfin=nA
MM2 Vbiasn Vbiasp vdd! vdd! pmos w=WA l=LA nfin=nA
MM3 Vbiasp Vbiasp vdd! vdd! pmos w=WA l=LA nfin=nA
MM10 net6 Biasp vdd! vdd! pmos w=WA l=LA nfin=nA
.ENDS

.SUBCKT CR6_3 Vbiasn1 Vbiasn2 Vbiasp
*.PININFO Vbiasn1:O Vbiasn2:O Vbiasp:O
MM2 Vbiasp Vbiasn2 Vbiasn1 gnd! nmos w=WA l=LA nfin=nA
MM0 Vbiasn2 Vbiasn1 gnd! gnd! nmos w=WA l=LA nfin=nA
MM4 Vbiasn1 net15 gnd! gnd! nmos w=WA l=LA nfin=nA
MM5 net15 net15 gnd! gnd! nmos w=WA l=LA nfin=nA
MM3 Vbiasp Vbiasp vdd! vdd! pmos w=WA l=LA nfin=nA
MM1 Vbiasn2 Vbiasp vdd! vdd! pmos w=WA l=LA nfin=nA
MM6 net15 Vbiasp vdd! vdd! pmos w=WA l=LA nfin=nA
.ENDS


xiota LG_Vbiasn LG_Vbiasp Vinn Vinp Voutn fully_differential_miller_compensated
xiLG_pnmos_4 Biasp LG_Vbiasn LG_Vbiasp LG_pnmos_4
xibCR6_3 Biasn1 Biasn2 Biasp CR6_3
.END
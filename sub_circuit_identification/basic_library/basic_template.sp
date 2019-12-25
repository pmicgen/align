.subckt Switch_NMOS  D G S
M0 (D G S 0) NMOS w=w1 l=l1
.ends Switch_NMOS

.subckt Switch_PMOS  D G S
M0 (D G S 0) PMOS w=w1 l=l1
.ends Switch_PMOS

.subckt SCM_NMOS DA DB S
M0 (DA DA S 0) NMOS w=w l=90n
M1 (DB DA S 0) NMOS w=w l=90n
.ends SCM_NMOS

.subckt SCM_PMOS DA DB S
M0 (DA DA S 0) PMOS w=w l=90n
M1 (DB DA S 0) PMOS w=w l=90n
.ends SCM_PMOS

.subckt CMFB_NMOS DA DB GB S
M0 (DA DA S 0) NMOS w=w l=90n
M1 (DB GB S 0) NMOS w=w l=90n
.ends CMFB_NMOS

.subckt CMFB_PMOS DA DB GB S
M0 (DA DA S 0) PMOS w=w l=90n
M1 (DB GB S 0) PMOS w=w l=90n
.ends CMFB_PMOS

.subckt CASCODED_CMC_PMOS DA GA DB S
M0 DA GA SA vdd PMOS w=27e-9 l=20e-9 nfin=120
M1 DB GA SB vdd PMOS w=27e-9 l=20e-9 nfin=60
M2 SA DB S vdd PMOS w=27e-9 l=20e-9 nfin=10
M3 SB DB S vdd PMOS w=27e-9 l=20e-9 nfin=5
.ends CASCODED_CMC_PMOS

.subckt CASCODED_CMC_NMOS DA S DB GA
M0 DA GA SA vss NMOS w=27e-9 l=20e-9 nfin=24
M1 DB GA SB vss NMOS w=27e-9 l=20e-9 nfin=24
M2 SA DA S vss NMOS w=27e-9 l=20e-9 nfin=30
M3 SB DA S vss NMOS w=27e-9 l=20e-9 nfin=30
.ends CASCODED_CMC_NMOS

.subckt CMC_NMOS_S  DA DB G S
M0 (DA G S 0) NMOS w=w l=90n
M1 (DB G S 0) NMOS w=w l=90n
.ends CMC_NMOS_S

.subckt CMC_PMOS_S  DA DB G S
M0 (DA G S vdd) PMOS w=w l=90n
M1 (DB G S vdd) PMOS w=w l=90n
.ends CMC_PMOS_S

.subckt DP_NMOS  DA DB GA GB S
M0 (DA GA S 0) NMOS w=w l=90n
M1 (DB GB S 0) NMOS w=w l=90n
.ends DP_NMOS

.subckt DP_PMOS  DA DB GA GB S
M0 (DA GA S 0) PMOS w=w l=90n
M1 (DB GB S 0) PMOS w=w l=90n
.ends DP_PMOS

.subckt CMC_PMOS DA DB SA SB G
M0 (DA G SA 0) PMOS w=w l=90n
M1 (DB G SB 0) PMOS w=w l=90n
.ends CMC_PMOS

.subckt CCP_NMOS DA DB S
M0 (DA DB S 0) NMOS w=w l=90n
M1 (DB DA S 0) NMOS w=w l=90n
.ends CCP_NMOS

.subckt CCP_PMOS DA DB S
M0 (DA DB S 0) PMOS w=w l=90n
M1 (DB DA S 0) PMOS w=w l=90n
.ends CCP_PMOS

.subckt LS_NMOS DA DB SA SB
M0 (DA DA SA 0) NMOS w=w l=90n
M1 (DB DA SB 0) NMOS w=w l=90n
.ends LS_NMOS

.subckt LS_PMOS DA DB SA SB
M0 (DA DA SA 0) PMOS w=w l=90n
M1 (DB DA SB 0) PMOS w=w l=90n
.ends LS_PMOS

.subckt CMC_NMOS DA DB SA SB G
M0 (DA G SA 0) NMOS w=w l=90n
M1 (DB G SB 0) NMOS w=w l=90n
.ends CMC_NMOS

.subckt Cap_b PLUS MINUS BULK
CC1 PLUS MINUS BULK cap cap=60f
.ends Cap_b

.subckt Cap PLUS MINUS
CC1 PLUS MINUS cap cap=60f
.ends Cap

.subckt DCL_NMOS D S
M0 (D D S 0) NMOS w=w l=90n
.ends DCL_NMOS

.subckt DCL_PMOS D S
M0 (D D S 0) PMOS w=w l=90n
.ends DCL_PMOS

.subckt Res PLUS MINUS
RR1 PLUS MINUS res res=10k
.ends Res


.subckt spiral_ind PLUS MINUS BULK CTAP
L0 PLUS MINUS BULK CTAP spiral_sym_ct_mu_z w=9u
.ends spiral_ind

.subckt stage2_inv b0_inv b0_buf B<0>
MM7 b0_buf b0_inv VSS VSS NMOS l=60n w=1u m=1
MM4 b0_inv B<0> VSS VSS NMOS l=60n w=1u m=1
MM6 b0_buf b0_inv VDD VDD PMOS l=60n w=1u m=1
MM5 b0_inv B<0> VDD VDD PMOS l=60n w=1u m=1
.ends stage2_inv

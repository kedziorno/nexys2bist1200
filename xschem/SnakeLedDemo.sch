v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {For synthesis project, COMMENT line "signal Snake0 : typeSnake0" (ARCHITECTURE DECLARATIONS) in VHDL netlist file.
(Tested on board Nexys 2 1200 E - part xc3s1200e-fg320-4)} 10 10 0 0 0.4 0.4 {}
C {ClkDllDiv16.sym} 460 -910 0 0 {name=x1}
C {ipin.sym} 1200 -130 0 0 {name=p1 lab=ckIn dir=in}
C {ipin.sym} 1200 -90 0 0 {name=p2 lab=sw[c_number_switches-1:0] dir=in}
C {lab_pin.sym} 310 -970 0 0 {name=p2 sig_type=std_logic lab=ck}
C {title.sym} 170 -40 0 0 {name=l1 author=""}
C {Fadder.sym} 460 -190 0 0 {name=x2 width=c_width}
C {use.sym} 940 -620 0 0 {library ieee;
use ieee.std_logic_1164.all;
library UNISIM;
use UNISIM.vcomponents.all;
library work;
use work.p_constants.all;
}
C {lab_pin.sym} 310 -180 0 0 {name=p3 sig_type=std_logic lab=ck}
C {lab_pin.sym} 310 -220 0 0 {name=p4 sig_type=std_logic lab=sw[c_number_switches-1:0]}
C {lab_pin.sym} 610 -220 2 0 {name=p5 sig_type=typeIntArray lab=cmpPwm}
C {lab_pin.sym} 310 -200 0 0 {name=p7 sig_type=std_logic lab=ckFade}
C {PWM.sym} 460 -110 0 0 {name=x3 c_width=c_number_switches}
C {lab_pin.sym} 310 -110 0 0 {name=p8 sig_type=typeIntArray lab=cmpPwm}
C {opin.sym} 1210 -50 0 0 {name=p9 lab=led[c_number_switches-1:0]}
C {lab_pin.sym} 610 -130 2 0 {name=p10 sig_type=std_logic lab=led[c_number_switches-1:0]}
C {ipin.sym} 1200 -110 0 0 {name=p11 lab=btn[c_number_buttons-1:0]}
C {NextTargetSet.sym} 460 -590 0 0 {name=x4 c_number_buttons=c_number_buttons}
C {lab_pin.sym} 310 -600 0 0 {name=p12 sig_type=std_logic lab=ck}
C {lab_pin.sym} 310 -580 0 0 {name=p13 sig_type=std_logic lab=ckSnake}
C {lab_pin.sym} 310 -560 0 0 {name=p14 sig_type=std_logic lab=btn[c_number_buttons-1:0]}
C {lab_pin.sym} 610 -620 2 0 {name=p15 sig_type=typeTarget lab=NextTarget value=0}
C {TargetSet.sym} 460 -500 0 0 {name=x5}
C {lab_pin.sym} 310 -530 0 0 {name=p16 sig_type=std_logic lab=ck}
C {lab_pin.sym} 610 -930 2 0 {name=p17 sig_type=std_logic lab=ckFade}
C {lab_pin.sym} 310 -490 0 0 {name=p18 sig_type=typeSnake0 lab=Snake0}
C {lab_pin.sym} 610 -530 2 0 {name=p19 sig_type=typeTarget lab=Target value=0}
C {lab_pin.sym} 310 -470 0 0 {name=p20 sig_type=typeTarget lab=NextTarget value=0}
C {lab_pin.sym} 610 -510 2 0 {name=p21 sig_type=typeDirection lab=Direction}
C {SnakeStateMachine.sym} 720 -420 0 0 {name=x6}
C {lab_pin.sym} 870 -430 2 0 {name=p22 sig_type=typeSnake06 lab=Snake value=initSnake}
C {NextSnakeLogic.sym} 720 -320 0 0 {name=x7 c_number_buttons=c_number_buttons}
C {lab_pin.sym} 570 -380 0 0 {name=p25 sig_type=std_logic lab=ck}
C {lab_pin.sym} 570 -360 0 0 {name=p26 sig_type=std_logic lab=btn[c_number_buttons-1:0]}
C {lab_pin.sym} 870 -380 2 0 {name=p27 sig_type=typeSnake06 lab=NextSnake value=initSnake}
C {lab_pin.sym} 570 -430 0 0 {name=p28 sig_type=typeSnake06 lab=NextSnake value=initSnake}
C {lab_pin.sym} 570 -320 0 0 {name=p29 sig_type=typeTarget lab=NextTarget}
C {lab_pin.sym} 570 -300 0 0 {name=p30 sig_type=typeTarget lab=Target}
C {lab_pin.sym} 570 -280 0 0 {name=p31 sig_type=typeSnake06 lab=Snake value=initSnake}
C {lab_pin.sym} 570 -340 0 0 {name=p32 sig_type=typeDirection lab=Direction}
C {lab_pin.sym} 610 -890 2 0 {name=p33 sig_type=std_logic lab=ckSnake}
C {lab_pin.sym} 570 -410 0 0 {name=p34 sig_type=std_logic lab=ckSnake}
C {lab_pin.sym} 310 -510 0 0 {name=p35 sig_type=std_logic lab=ckSnake}
C {lab_pin.sym} 610 -950 2 0 {name=p6 sig_type=std_logic lab=cntPwm[c_number_switches-1:0]}
C {lab_pin.sym} 310 -130 0 0 {name=p24 sig_type=std_logic lab=cntPwm[c_number_switches-1:0]}
C {anodeCtrl.sym} 720 -690 0 0 {name=x8 c_number_buttons=c_number_buttons}
C {lab_pin.sym} 610 -970 2 0 {name=p36 sig_type=typeTarget lab=cntDisp value=0}
C {lab_pin.sym} 570 -720 0 0 {name=p37 sig_type=typeTarget lab=cntDisp value=0}
C {lab_pin.sym} 570 -700 0 0 {name=p38 sig_type=typeSnake0 lab=Snake0}
C {lab_pin.sym} 570 -680 0 0 {name=p39 sig_type=typeTarget lab=Target value=0}
C {opin.sym} 1210 -130 0 0 {name=p40 lab=an[c_number_buttons-1:0]}
C {lab_pin.sym} 870 -720 2 0 {name=p41 sig_type=std_logic lab=an[c_number_buttons-1:0]}
C {SegAssignment.sym} 720 -780 0 0 {name=x9}
C {lab_pin.sym} 570 -810 0 0 {name=p42 sig_type=typeTarget lab=cntDisp}
C {opin.sym} 1210 -110 0 0 {name=p43 lab=seg[6:0]}
C {opin.sym} 1210 -70 0 0 {name=p44 lab=dp}
C {code_shown.sym} 1420 -700 0 0 {name="segPwm assign" only_toplevel=false value="
segPwm(0) <= '0';
segPwm(1) <=
cntDiv(ckPwmRange) and
cntDiv(ckPwmRange+1);
segPwm(2) <=
cntDiv(ckPwmRange) ;
segPwm(3) <=
cntDiv(ckPwmRange) or
cntDiv(ckPwmRange+1);
segPwm(4) <=
cntDiv(ckPwmRange)
or cntDiv(ckPwmRange+1)
or cntDiv(ckPwmRange+2);
segPwm(5) <=
cntDiv(ckPwmRange) or
cntDiv(ckPwmRange+1) or
cntDiv(ckPwmRange+2) or
cntDiv(ckPwmRange+3);
segPwm(6) <=
cntDiv(ckPwmRange) or
cntDiv(ckPwmRange+1) or
cntDiv(ckPwmRange+2) or
cntDiv(ckPwmRange+3) or
cntDiv(ckPwmRange+4);
"}
C {lab_pin.sym} 570 -790 0 0 {name=p45 sig_type=std_logic lab=segPwm[6:0]}
C {lab_pin.sym} 570 -770 0 0 {name=p46 sig_type=typeTarget lab=Target}
C {lab_pin.sym} 570 -750 0 0 {name=p47 sig_type=typeSnake06 lab=Snake value=initSnake}
C {lab_pin.sym} 870 -790 2 0 {name=p48 lab=seg[6:0]}
C {lab_pin.sym} 870 -770 2 0 {name=p49 lab=dp}
C {lab_pin.sym} 570 -260 0 0 {name=p51 sig_type=integer lab=c_number_buttons value=c_number_buttons}
C {opin.sym} 1210 -90 0 0 {name=p52 lab=seg_ex[6:0]}
C {lab_pin.sym} 870 -810 2 0 {name=p53 lab=seg_ex[6:0]}
C {code_shown.sym} 1140 -790 0 0 {name=IBUFG_clock only_toplevel=false value="
IBUFG_ck : IBUFG port map (
  O => ck_ibufg,
  I => ckIn
);
"}
C {lab_pin.sym} 570 -660 0 0 {name=p55 sig_type=integer lab=c_number_buttons value=c_number_buttons}
C {lab_pin.sym} 310 -890 0 0 {name=p56 sig_type=integer lab=c_number_buttons value=c_number_buttons}
C {lab_pin.sym} 310 -870 0 0 {name=p57 sig_type=integer lab=c_number_switches value=c_number_switches}
C {lab_pin.sym} 310 -90 0 0 {name=p58 sig_type=integer lab=c_number_switches value=c_number_switches}
C {lab_pin.sym} 610 -910 2 0 {name=p50 sig_type=std_logic lab=cntDiv[c_ckSnake-1:0]}
C {lab_pin.sym} 310 -160 0 0 {name=p59 sig_type=integer lab=c_number_switches value=c_number_switches}
C {CLK_DLL.sym} 460 -1000 0 0 {name=x11}
C {lab_pin.sym} 610 -1000 2 0 {name=p60 sig_type=std_logic lab=ck}
C {lab_pin.sym} 310 -1000 0 0 {name=p61 sig_type=std_logic lab=ck_ibufg}
C {package.sym} 945 -505 0 0 {
library ieee;
use ieee.std_logic_1164.all;

package p_constants is
  constant c_number_buttons  : integer := 8;
  constant c_number_switches : integer := 8;
  -- constant used for 100Mhz clock
  constant c_ckSnake         : integer := 22; -- XXX slow/fast - high/low number
  constant c_ckFade          : integer := 19; -- XXX less than c_ckSnake
  constant c_ckAnode         : integer := 18; -- XXX less than c_ckSnake, 19 - blink
  constant ckPwmRange        : integer := 14;
  subtype  typeTarget        is integer                               range 0 to c_number_buttons - 1;
  type     vertebra          is array (0 to 1)           of integer   range 0 to c_number_buttons - 1;
  type     typeSnake         is array (natural range <>) of vertebra;
  subtype  typeSnake0        is typeSnake (0 to 0);
  subtype  typeSnake06       is typeSnake (0 to 6);
  type     typeIntArray      is array (7 downto 0)       of integer   range 0 to 255;
  type     typeDirection     is (left, right);
  constant initSnake         : typeSnake06 := ((0,6),(0,2),(0,3),(0,4),(0,5),(0,0),(0,1));
  signal   Snake             : typeSnake06 := initSnake;
  signal   NextSnake         : typeSnake06 := initSnake;
  alias    Snake0            : typeSnake0 is Snake (0 to 0); -- XXX work
end package p_constants;

package body p_constants is
end package body p_constants;
}
C {lab_pin.sym} 310 -620 0 0 {name=p62 sig_type=integer lab=c_number_buttons value=c_number_buttons}

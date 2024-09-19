v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {ipin.sym} 798.6328125 -140.78125 0 0 {name=p1 lab=ckIn dir=in}
C {arch_declarations.sym} 420 -630 0 0 {signal cntDiv_i : std_logic_vector(c_ckSnake - 1 downto 0) := (others => '0');
signal ckAnode_i : std_logic := '0';
signal cntDisp_i : typeTarget := 0;}
C {title.sym} 170 -40 0 0 {name=l3 author=""}
C {use.sym} 460 -530 0 0 {
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.p_constants.all;
}
C {opin.sym} 810 -120 0 0 {name=p5 lab=cntDisp sig_type=typeTarget}
C {opin.sym} 810 -100 0 0 {name=p3 lab=cntPwm[c_number_switches-1:0]}
C {opin.sym} 810 -80 0 0 {name=p2 lab=ckFade}
C {opin.sym} 810 -60 0 0 {name=p4 lab=ckSnake}
C {code_shown.sym} 0 -340 0 0 {name=ckDivider only_toplevel=false value="p_ckDivider : process (ckIn) is
begin
  if rising_edge (ckIn) then
    cntDiv_i <= cntDiv_i + '1';
  end if;
end process;
cntPwm <= cntDiv_i (7 + ckPwmRange downto ckPwmRange);
ckFade <= cntDiv_i (c_ckFade - 1);
ckSnake <= cntDiv_i (c_ckSnake - 1);
ckAnode_i <= cntDiv_i (c_ckAnode - 1);
cntDiv <= cntDiv_i; -- XXX for cntPwm in top
"}
C {generic_pin.sym} 800 -260 0 0 {name=g1 generic_type=integer value="22" lab=c_ckSnake}
C {generic_pin.sym} 800 -160 0 0 {name=g2 generic_type=integer value="18" lab=c_ckFade}
C {generic_pin.sym} 800 -240 0 0 {name=g3 generic_type=integer value="18" lab=c_ckAnode}
C {code_shown.sym} 0 -650 0 0 {name=ckAnode only_toplevel=false value="
p_ckAnode : process (ckAnode_i) is
begin
  if ckAnode_i'event and ckAnode_i = '1' then
    if (cntDisp_i = c_number_buttons - 1) then
      cntDisp_i <= 0;
    else
      cntDisp_i <= cntDisp_i + 1;
    end if;
  end if;
end process;
cntDisp <= cntDisp_i;
"}
C {generic_pin.sym} 800 -220 0 0 {name=g4 generic_type=integer value="1" lab=c_number_buttons}
C {generic_pin.sym} 800 -180 0 0 {name=g5 generic_type=integer value="14" lab=ckPwmRange}
C {generic_pin.sym} 800 -200 0 0 {name=g6 generic_type=integer value="1" lab=c_number_switches}
C {opin.sym} 810 -140 0 0 {name=p6 lab=cntDiv[c_ckSnake-1:0]}

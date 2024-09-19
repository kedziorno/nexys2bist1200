v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {title.sym} 170 -40 0 0 {name=l1 author=""}
C {use.sym} 740 -150 0 0 {
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.p_constants.all;
}
C {ipin.sym} 660 -60 0 0 {name=p1 lab=ck vhdl_type=STD_LOGIC dir=in}
C {ipin.sym} 660 -80 0 0 {name=p2 lab=ckFade vhdl_type=STD_LOGIC dir=in}
C {ipin.sym} 660 -100 0 0 {name=p3 lab=sw[c_number_switches-1:0] vhdl_type=STD_LOGIC dir=in}
C {iopin.sym} 670 -100 0 0 {name=p9 lab=cmpPwm sig_type=typeIntArray dir=inout}
C {code_shown.sym} 0 -410 0 0 {name=Fadder only_toplevel=false value="
p_Fadder : process (ckFade) is
begin
  for i in 0 to c_number_switches - 1 loop -- for each LED
    if ckFade'event and ckFade='1' then
      if sw(i) = '1' and cmpPwm(i) /= 255 then
        -- coresponding switch ON, not yet full intensity
        cmpPwm(i) <= cmpPwm(i)+1; -- increasing intensity
      elsif sw(i) = '0' and  cmpPwm(i) /= 0 then 
        -- coresponding switch OFF, not yet full dark
        cmpPwm(i) <= cmpPwm(i)-1; -- decreasing intensity
      end if;
    end if;
  end loop;
end process;
"}
C {generic_pin.sym} 660 -120 0 0 {name=g1 generic_type=integer value="1" lab=c_number_switches}

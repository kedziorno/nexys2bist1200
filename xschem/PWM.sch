v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {title.sym} 170 -40 0 0 {name=l1 author=""}
C {use.sym} 550 -360 0 0 {
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.p_constants.all;
}
C {ipin.sym} 660 -80 0 0 {name=p1 lab=cntPwm[c_number_switches-1:0]}
C {ipin.sym} 660 -60 0 0 {name=p2 sig_type=typeIntArray lab=cmpPwm}
C {opin.sym} 670 -80 0 0 {name=p3 lab=Led[c_number_switches-1:0]}
C {code_shown.sym} 0 -370 0 0 {name=PWM only_toplevel=false value="
p_PWM : process (cntPwm, cmpPwm) is
begin
  for i in 0 to c_number_switches - 1 loop -- for each LED
    if conv_integer (cntPwm) < cmpPwm (i) then
      -- counter value less than reference
      Led(i) <= '1'; -- LED ON
    else 
      -- counter value greater than reference
      Led(i) <= '0'; -- LED OFF
    end if;
  end loop;
end process;
"}
C {generic_pin.sym} 660 -100 0 0 {name=g1 generic_type=integer value="1" lab=c_number_switches}

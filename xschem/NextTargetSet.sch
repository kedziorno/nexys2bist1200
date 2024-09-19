v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {title.sym} 170 -40 0 0 {name=l1 author=""}
C {ipin.sym} 270 -440 0 0 {name=p1 lab=ck}
C {ipin.sym} 270 -420 0 0 {name=p2 lab=ckSnake}
C {ipin.sym} 270 -400 0 0 {name=p3 lab=btn[c_number_buttons-1:0]}
C {opin.sym} 280 -440 0 0 {name=p4 lab=NextTarget sig_type=typeTarget value=0}
C {use.sym} 430 -440 0 0 {library ieee;
use ieee.std_logic_1164.all;
library work;
use work.p_constants.all;}
C {code_shown.sym} 0 -350 0 0 {name=NextTargetSet only_toplevel=false value="
--in case a button is pressed sets the next target for the snake
p_NextTargetSet : process (ckSnake) is
begin
  if ckSnake'event and ckSnake='1' then
    for i in 0 to c_number_buttons - 1 loop
      if btn(i) = '1' then 
        NextTarget <= i;
      end if;
    end loop;
  end if;
end process;
"}
C {generic_pin.sym} 270 -460 0 0 {name=g1 generic_type=integer value="1" lab=c_number_buttons}

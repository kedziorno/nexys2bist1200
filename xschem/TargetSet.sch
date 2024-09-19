v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {title.sym} 170 -40 0 0 {name=l1 author=""}
C {use.sym} 610 -110 0 0 {library ieee;
use ieee.std_logic_1164.all;
library work;
use work.p_constants.all;}
C {ipin.sym} 500 -80 0 0 {name=p1 lab=Snake sig_type=typeSnake0}
C {opin.sym} 510 -100 0 0 {name=p2 lab=Direction sig_type=typeDirection value=left}
C {ipin.sym} 500 -60 0 0 {name=p5 lab=NextTarget sig_type=typeTarget value=0}
C {ipin.sym} 500 -100 0 0 {name=p6 lab=ckSnake}
C {ipin.sym} 500 -120 0 0 {name=p7 lab=ck}
C {code_shown.sym} 0 -430 0 0 {name=TargetSet only_toplevel=false value="
p_TargetSet : process (ckSnake) is
begin
  if ckSnake'event and ckSnake='1' then
    if Snake(0) = (Target, 6) then -- already at target
      Target <= NextTarget;
      if NextTarget > Target then 
        --sets the direction for the snake depending on 
        --the position of the next target
        Direction <= left;
      elsif NextTarget < Target then
        Direction <= right;
      end if;
    end if;
  end if;
end process;
"}
C {iopin.sym} 510 -120 0 0 {name=p3 lab=Target sig_type=typeTarget value=1}

v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {title.sym} 170 -40 0 0 {name=l1 author=""}
C {ipin.sym} 630 -160 0 0 {name=p1 lab=ck dir=in}
C {opin.sym} 640 -160 0 0 {name=p9 lab=NextSnake sig_type=typeSnake06 value=initSnake}
C {ipin.sym} 630 -60 0 0 {name=p11 lab=Snake sig_type=typeSnake06 value=initSnake}
C {ipin.sym} 630 -140 0 0 {name=p3 lab=btn[c_number_buttons-1:0] dir=in}
C {ipin.sym} 630 -80 0 0 {name=p4 lab=Target sig_type=typeTarget value=0}
C {ipin.sym} 630 -120 0 0 {name=p6 lab=Direction dir=in sig_type=typeDirection value=left}
C {use.sym} 770 -110 0 0 {library ieee;
use ieee.std_logic_1164.all;
library work;
use work.p_constants.all;}
C {ipin.sym} 630 -100 0 0 {name=p2 lab=NextTarget sig_type=typeTarget value=0}
C {code_shown.sym} 0 -1460 0 0 {name=NextSnakeLogic only_toplevel=false value="
p_NextSnakeLogic : process (
  Target, nextTarget, Direction,
  Snake(0), Snake(1), Snake(2), Snake(3), Snake(4), Snake(5), Snake(6)
) is
begin
  if Snake(0) = (Target, 6) then -- already at target
    if    NextTarget > Target then
      NextSnake <= ((Target,6),(Target,1),(Target,0),(Target,5),(Target,4),(Target,3),(Target,2)); -- spinning to left
    elsif NextTarget < Target then
      NextSnake <= ((Target,6),(Target,5),(Target,0),(Target,1),(Target,2),(Target,3),(Target,4)); -- spinning to left
    else
      NextSnake <= Snake; -- resting
    end if;
  else -- snake moving
    NextSnake (1 to 6) <= Snake (0 to 5);
    if Direction = left then -- snake moving left
      if        Snake (0)  = (Target - 1    , 6)   then 
            nextSnake (0) <= (Target        , 2);
      elsif     Snake (0)  = (Target        , 2)   then -- roling in target digit
            nextSnake (0) <= (Target        , 3);
      elsif     Snake (0)  = (Target        , 3)   then -- roling in target digit
            nextSnake (0) <= (Target        , 4);
      elsif     Snake (0)  = (Target        , 4)   then -- roling in target digit
            nextSnake (0) <= (Target        , 5);
      elsif     Snake (0)  = (Target        , 5)   then -- roling in target digit
            nextSnake (0) <= (Target        , 0);
      elsif     Snake (0)  = (Target        , 0)   then -- roling in target digit
            nextSnake (0) <= (Target        , 1);
      elsif     Snake (0)  = (Target        , 1)   then -- roling in target digit
            nextSnake (0) <= (Target        , 6);
      else
            nextsnake (0) <= Snake(0);
      end if;
      for i in c_number_buttons downto 2 loop
        if      Snake (0)  = (Target - i    , 6) then -- running to left
            NextSnake (0) <= (Target - i + 1, 6);
        end if;
      end loop;
    else -- snake moving right
      if        Snake (0)  = (Target + 1    , 6) then -- next right to target
            NextSnake (0) <= (Target        , 4);
      elsif     Snake (0)  = (Target        , 4) then -- roling in target digit
            NextSnake (0) <= (Target        , 3);
      elsif     Snake (0)  = (Target        , 3) then -- roling in target digit
            NextSnake (0) <= (Target        , 2);
      elsif     Snake (0)  = (Target        , 2) then -- roling in target digit
            NextSnake (0) <= (Target        , 1);
      elsif     Snake (0)  = (Target        , 1) then -- roling in target digit
            NextSnake (0) <= (Target        , 0);
      elsif     Snake (0)  = (Target        , 0) then -- roling in target digit
            NextSnake (0) <= (Target        , 5);
      elsif     Snake (0)  = (Target        , 5) then -- roling in target digit
            NextSnake (0) <= (Target        , 6);
      else
            NextSnake (0) <= Snake (6);
      end if;
      for i in c_number_buttons downto 2 loop
        if      Snake (0)  = (Target + i    , 6) then -- running to left
            NextSnake (0) <= (Target + i - 1, 6);
        end if;
      end loop;
    end if;
  end if;
end process;
"}
C {generic_pin.sym} 630 -180 0 0 {name=g1 generic_type=integer value="1" lab=c_number_buttons}

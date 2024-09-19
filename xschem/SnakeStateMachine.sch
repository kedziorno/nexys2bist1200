v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {title.sym} 170 -40 0 0 {name=l1 author=""}
C {opin.sym} 510 -80 0 0 {name=p9 lab=Snake sig_type=typeSnake06 value=initSnake}
C {ipin.sym} 500 -60 0 0 {name=p2 lab=ckSnake dir=in}
C {ipin.sym} 500 -80 0 0 {name=p3 lab=NextSnake dir=in sig_type=typeSnake06 value=initSnake}
C {use.sym} 570 -100 0 0 {library ieee;
use ieee.std_logic_1164.all;
library work;
use work.p_constants.all;}
C {code_shown.sym} 0 -220 0 0 {name=SnakeStateMachine only_toplevel=false value="
p_SnakeStateMachine : process (ckSnake)
begin
	if ckSnake'event and ckSnake='1' then
		Snake <= NextSnake;
	end if;
end process;"}

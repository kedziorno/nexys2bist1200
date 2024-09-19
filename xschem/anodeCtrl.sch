v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {title.sym} 170 -40 0 0 {name=l1 author=""}
C {use.sym} 530 -550 0 0 {library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.p_constants.all;}
C {ipin.sym} 270 -490 0 0 {name=p1 lab=Target dir=in sig_type=typeTarget value=0}
C {ipin.sym} 270 -530 0 0 {name=p11 lab=cntDisp sig_type=typeTarget}
C {ipin.sym} 270 -510 0 0 {name=p3 lab=Snake sig_type=typeSnake0}
C {opin.sym} 280 -530 0 0 {name=p4 lab=an[c_number_buttons-1:0]}
C {code_shown.sym} 0 -440 0 0 {name=anodeCtrl only_toplevel=false value="
--Only one digit is active at a certain moment, this is done by activating one anodeat a time.
--The change of the active digits is done very fast and it makes you belive that all digits 
--are lit at the same time
an <= an_i xor \\"00001111\\"; -- XXX for the maximator expander
p_anodeCtrl : process (cntDisp, Target, Snake(0))
	variable ones : std_logic_vector (c_number_buttons - 1 downto 0) := (others => '1');	
begin  
	an_i <= ones;
	for i in 0 to c_number_buttons - 1 loop
		if (Snake(0) = (Target, 6)) then
			an_i (Target) <= '0';
		elsif (cntDisp = i) then
			an_i (cntDisp) <= '0';
		end if;
	end loop;
end process;
"}
C {arch_declarations.sym} 540 -450 0 0 {signal an_i : std_logic_vector (c_number_buttons - 1 downto 0) := (others => '1');}
C {generic_pin.sym} 270 -550 0 0 {name=g1 generic_type=integer value="1" lab=c_number_buttons}

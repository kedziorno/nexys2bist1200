v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {title.sym} 170 -40 0 0 {name=l1 author=""}
C {use.sym} 680 -300 0 0 {
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.p_constants.all;
}
C {ipin.sym} 520 -60 0 0 {name=p2 lab=Snake dir=in sig_type=typeSnake06 value=initSnake}
C {ipin.sym} 520 -120 0 0 {name=p11 lab=cntDisp sig_type=typeTarget dir=in}
C {opin.sym} 530 -100 0 0 {name=p40 lab=seg[6:0]}
C {ipin.sym} 520 -100 0 0 {name=p4 lab=segPwm[6:0]}
C {ipin.sym} 520 -80 0 0 {name=p5 lab=Target dir=in sig_type=typeTarget value=0}
C {opin.sym} 530 -80 0 0 {name=p6 lab=dp}
C {code_shown.sym} 0 -560 0 0 {name=segAssignment only_toplevel=false value="
seg_ex <= seg_i xor \\"1111111\\"; -- XXX for the maximator expander
seg <= seg_i;
--The output segment vector is created here.
p_SegAssignment: process (
  cntDisp, segPwm, Target, Snake(0), Snake(1), Snake(2), Snake(3), Snake(4), Snake(5), Snake(6)
) is
begin
  seg_i <= \\"1111111\\";
  for k in 0 to 6 loop
    for i in 0 to 6 loop --loops all vertebras of the snake
      if Snake(i) = (cntDisp,k) then 
        seg_i(k) <= segPwm(i);
      end if;
      if Target = cntDisp then -- current 7seg digit
        dp <= '0';  -- segment OFF
      else
        dp <= '1';	-- segment ON
      end if;
    end loop;
  end loop;
end process;
"}
C {opin.sym} 530 -120 0 0 {name=p1 lab=seg_ex[6:0]}
C {arch_declarations.sym} 680 -180 0 0 {signal seg_i : std_logic_vector (6 downto 0) := (others => '0');}

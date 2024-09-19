v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {title.sym} 170 -40 0 0 {name=l1 author=""}
C {ipin.sym} 330 -260 2 0 {name=p1 lab=ckIn
}
C {opin.sym} 320 -240 0 0 {name=p2 lab=ckOut}
C {code_shown.sym} 0 -740 0 0 {name=DCM only_toplevel=false value="
CLK_DDL_BUFG_inst : BUFG port map (
  O => ckBuf2,
  I => ckBuf1
);

RST_SRL16_inst : SRL16
generic map (
  INIT => x\\"FFFF\\"
)
port map (
  D => '0',
  CLK => ckIn,
  A0 => '1',
  A1 => '1',
  A2 => '1',
  A3 => '1',
  Q => rst
);

CLK_DLL_inst : DCM port map (
  CLK0    => ckBuf1,
  CLKFB   => ckBuf2,
  CLKDV   => open,
  CLKIN   => ckIn,
  RST     => rst,
  CLK180  => open,
  CLK270  => open,
  CLK2X   => ckOut,
  CLK90   => open,
  LOCKED  => open
);
"}
C {arch_declarations.sym} 310 -760 0 0 {attribute CLKDV_DIVIDE : real;
attribute DUTY_CYCLE_CORRECTION : boolean;
attribute STARTUP_WAIT : boolean;
attribute SIM_MODE : string;
--attribute LOC : string;
signal ckBuf1,ckBuf2 : std_logic;

signal rst : std_logic;

component DCM
generic (
  CLKDV_DIVIDE : real := 16.0; -- (1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 8.0, 16.0)
  DUTY_CYCLE_CORRECTION : Boolean := TRUE;
  STARTUP_WAIT : boolean := FALSE;
  SIM_MODE : string := "FAST"); -- XXX must use reset
  --STARTUP_WAIT : boolean := FALSE;
  --LOC : string := "DCM_X2Y0");
port (
  CLK0 : out STD_LOGIC;
  CLK180 : out STD_LOGIC;
  CLK270 : out STD_LOGIC;
  CLK2X : out STD_LOGIC;
  CLK90 : out STD_LOGIC;
  CLKDV : out STD_LOGIC;
  LOCKED : out STD_LOGIC;
  CLKFB : in STD_LOGIC;
  CLKIN : in STD_LOGIC;
  RST : in STD_LOGIC
);
end component;
}
C {use.sym} 280 -360 0 0 {library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.vcomponents.all;}

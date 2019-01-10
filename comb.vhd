library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMB is
    Port ( in1 : in  STD_LOGIC;
           in2   : in  STD_LOGIC;
           in3   : in  STD_LOGIC;
           in4   : in  STD_LOGIC;
           out1   : out STD_LOGIC);
end COMB;

architecture dataflow of COMB is
begin
  
  
  out1 <= not(((not in1) and (not in2) and (not in3) and (not in4)) or ((in1) and (not in2) and (not in3) and (not in4)) or ((not in1) and (in2) and (not in3) and (not in4)) or ((not in1) and (not in2) and (in3) and (not in4)) or((not in1) and (not in2) and (not in3) and (in4)));
    

  end dataflow;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
    Port ( SEL : in  STD_LOGIC;
           A   : in  STD_LOGIC;
           B   : in  STD_LOGIC;
           X   : out STD_LOGIC);
end MUX;

architecture dataflow OF MUX is
begin
    X <= A when (SEL = '1') else B;
end dataflow;

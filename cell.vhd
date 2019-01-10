library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cell is
    Port ( inA : in  STD_LOGIC;
           inB   : in  STD_LOGIC;
           inC   : in  STD_LOGIC;
           inD   : in  STD_LOGIC;
           clock   : in STD_LOGIC;
           loadDFF : in STD_LOGIC;
           selectSig : in STD_LOGIC;
           outA   : out STD_LOGIC);
end cell;

architecture structural of cell is 

 COMPONENT DFF
    PORT(
         din : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         dout : OUT  std_logic
        ); 
    END COMPONENT;
    
    
    COMPONENT MUX
    PORT(
         SEL : IN  std_logic;
         A : IN  std_logic;
         B : IN  std_logic;
         X : OUT  std_logic
        ); 
    END COMPONENT;
   
   
    COMPONENT COMB
    PORT(
         in1 : IN  std_logic;
         in2 : IN  std_logic;
         in3 : IN  std_logic;
         in4 : IN  std_logic;
         out1 : OUT  std_logic
        ); 
    END COMPONENT;
    
    
    signal SS : STD_LOGIC;
    signal SSS : STD_LOGIC;
    signal outComb : STD_LOGIC;
    signal outB : STD_LOGIC;
    
    
    BEGIN
      
    outA<=outB;
    SSS<=outComb and outB;
      
    u1: DFF port map(din => SS,
    dout => outB,
    rst=>'0',
    clk=>clock);
    
    u2: MUX port map(SEL => selectSig,
    A=>loadDFF,
    B=>SSS,
    X=>SS);
    
    u3: COMB port map(in1=>inA,
    in2=>inB,
    in3=>inC,
    in4=>inD,
    out1=>outComb);
    
    
      
      
    END;
   


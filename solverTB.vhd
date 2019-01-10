
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY solver_tb IS
END solver_tb;

ARCHITECTURE behavior OF solver_tb IS 

    COMPONENT cells
      generic(
        m : integer := 12;
        n : integer := 12);
     Port ( clock   : in STD_LOGIC;
           selectt : in STD_LOGIC;
           load : in STD_LOGIC_VECTOR(0 to 143);
           outtt : out STD_LOGIC_VECTOR(0 to 143)
           );
        
    END COMPONENT;
    
 
   signal loadDFF : STD_LOGIC_VECTOR(0 to 143):="111111111111100100001001100111111001100000001001100010001001111111111001100000001001100111111001100101000001100001110001100001000001111111111111";
   signal selectSig : std_logic:='1';
   signal clk : std_logic := '0';
   
   signal outA : STD_LOGIC_VECTOR(0 to 143);

   constant clk_period : time := 10 ns;

BEGIN

 uut: cells generic map(
 m => 12,
 n=>12)
 PORT MAP (
          clock=>clk,
          selectt=>selectSig,
          load=>loadDFF,
          outtt=>outA
        );

  clk_process :process
  begin
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;
  end process;

  stim_proc: process
  begin  

  wait for 100ns;
  selectSig <= '0';
  
   
  wait;
  
  end process;
  
  

END;



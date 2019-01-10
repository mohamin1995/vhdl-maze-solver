library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity cells is
  generic(
 m : integer := 5;
 n : integer := 5); 
    Port ( clock   : in STD_LOGIC;
           selectt : in STD_LOGIC;
           load : in STD_LOGIC_VECTOR(0 to (m*n)-1);
           outtt : out STD_LOGIC_VECTOR(0 to (m*n)-1)
           );
           
         end entity;
      
    architecture GEN of cells is
      
      COMPONENT cell
    PORT(
           inA : in  STD_LOGIC;
           inB   : in  STD_LOGIC;
           inC   : in  STD_LOGIC;
           inD   : in  STD_LOGIC;
           clock   : in STD_LOGIC;
           loadDFF : in STD_LOGIC;
           selectSig : in STD_LOGIC;
           outA   : out STD_LOGIC);
        
    END COMPONENT;
    
     
     
     TYPE newnew IS ARRAY (0 TO m) OF STD_LOGIC_VECTOR(0 TO n);
     signal outs : newnew;
     
          
      begin
        
        
    
      
       
        
        
     GEN_CELLA: for I in 0 to m-1 generate
       
     GEN_CELLB: for J in 0 to n-1 generate
        
        
        LOWER_BIT: if (I=0 or I=m-1 or J=0 or J=n-1) generate
      U0: cell PORT MAP (
          inA => '1',
          inB =>'1',
          inC =>'1',
          inD=>'1',
          loadDFF=>'1',
          selectSig=>'1',
          clock=>clock,
          outA=>outs(I)(J)
        );
    
    end generate LOWER_BIT;
    
   UPPER_BIT: if (I/=0 and J/=0 and I/=m-1 and J/=n-1) generate
      U0: cell PORT MAP (
          inA => outs(I-1)(J),
          inB =>outs(I)(J+1),
          inC =>outs(I+1)(J),
          inD=>outs(I)(J-1),
          loadDFF=>load(I*m+J),
          selectSig=>selectt,
          clock=>clock,
          outA=>outs(I)(J)
        );
    
    end generate UPPER_BIT;
        
        outtt(I*m+J)<=outs(I)(J);
        end generate GEN_CELLB;
        
      end generate GEN_CELLA;
      
      

      end GEN;
        
        
     
      
      
      



      
   
   




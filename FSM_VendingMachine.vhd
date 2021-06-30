library ieee;
use IEEE.std_logic_1164.all;

entity FSM_VendingMachine is 
port (
 CLK : in std_logic;      
 Reset : in std_logic;          
 MoneyIn : in std_logic_vector (2 downto 0);   
 Total : out std_logic_vector (2 downto 0);	
 Pringles : out std_logic;        		
 Change : out std_logic_vector (2 downto 0) 	
 );

end entity;

architecture behavior of FSM_VendingMachine is

type state_type is (
 start,
 hold,
 money_1,money_2,money_3,money_5,money_6, 
 change_out, 	   	
 pringles_dispense	
 );
 
signal now_state,next_state: state_type;

begin

process(CLK,Reset)
begin
 if(Reset = '0') then 
 	now_state <= start;

 elsif(clk'event and clk = '1') then
 	now_state <= next_state;
 end if;
end process;

process(now_state,MoneyIn)

begin

case now_state is
 when start =>
 Total <= "000";
 Pringles <= '0';
 change <= "000";
 next_state <= hold;

 when hold => 
 if(MoneyIn = "001")then
   Total <= "001";
   Pringles <= '0';
   change <= "000";
   next_state <= money_1;

 elsif(MoneyIn = "010")then
   Total <= "010";
   Pringles <= '1';
   change <= "000";
   next_state <= money_2;

 elsif(MoneyIn = "101")then
   Total <= "101";
   Pringles <= '1';
   Change <= "011";
   next_state <= money_5;

 else --//RETURN 
   next_state <= hold;

 end if;

when money_1 => 
 if(MoneyIn = "001")then 
   Total <= "010";
   Pringles <= '1';
   change <= "000";
   next_state <= money_2;
 
 elsif(MoneyIn = "010") then
   Total <= "011";
   Pringles <= '1';
   change <= "001";
   next_state <= money_3;
 
 elsif(MoneyIn = "101") then
   Total <= "110";
   Pringles <= '1';
   change <= "100";  
   next_state <= money_6;

 else
   next_state <= money_1;

 end if;

 when money_2 =>
    Total <= "010";                 
    Pringles <= '1';  		 
    change <= "000";  		    
    next_state <= pringles_dispense; 

 when money_3 =>
    Total <= "011";		   
    Pringles <= '1';		
    change <= "001"; 		   
    next_state <= change_out; 

 when money_5 => 
    Total <= "101";
    Pringles <= '1';
    change <= "011";
    next_state <= change_out;

 when money_6 =>		  
    Total <= "110"; 
    Pringles <= '1';		
    change <= "100"; 	           
    next_state <= change_out; 

 when change_out => 
    Total <= "010";
    Pringles <= '1';
    change <= "000";  
    next_state <= pringles_dispense;

 when pringles_dispense=>
    Total <= "010";
    Pringles <= '0';  	
    change <= "000";
    next_state <= start; 

end case;
end process;

end behavior;

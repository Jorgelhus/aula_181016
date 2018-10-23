entity maq is
port (

signal dado, reset, key2, clk : in bit;
signal alm : out bit;
signal estado : out bit_vector (3 downto 0)

);

end entity;

architecture c_maq of maq is 

signal estado2 : bit_vector (3 downto 0):= "0000";
signal alm2 : bit := '0';
begin

estado <= estado2;
alm <= alm2;

maq: process(clk)

begin

if clk='0' and clk'event then 


if reset='0' then 

estado2 <= "0000";
alm2<='0';

else

 case estado2 is 
	when "0000" =>
	  if key2 = '0' then
	   if dado ='0' then 
		     estado2<="0000";
		     alm2 <= '0';
		  else 
		     estado2<= "0001";
		     alm2<= '0';		 
		  end if;
		end if;
 
 when "0001" =>
	   if dado ='0' then 
		     estado2<="0010";
		     alm2 <= '0';
		  else 
		     estado2<= "0001";
		     alm2<= '0';		 
		  end if;

when "0010" =>
	   if dado ='0' then 
		     estado2<="0011";
		     alm2 <= '0';
		  else 
		     estado2<= "0001";
		     alm2<= '0';		 
		  end if;
		  
		  
when "0011" =>
	   if dado ='0' then 
		     estado2<="0000";
		     alm2 <= '0';
		  else 
		     estado2<= "0100";
		     alm2<= '0';		 
		  end if; 
		  
when "0100" =>
	   if dado ='0' then 
		     estado2<="0010";
		     alm2 <= '0';
		  else 
		     estado2<= "0101";
		     alm2<= '1';		 
		  end if;
		  
when "0101" =>
	   if dado ='0' then 
		     estado2<="0110";
		     alm2 <= '1';
		  else 
		     estado2<= "0101";
		     alm2<= '1';		 
		  end if;
		  
when "0110" =>
	   if dado ='0' then 
		     estado2<="0111";
		     alm2 <= '1';
		  else 
		     estado2<= "0101";
		     alm2<= '1';		 
		  end if;

when "0111" =>
	   if dado ='0' then 
		     estado2<="0000";
		     alm2 <= '0';
		  else 
		     estado2<= "0101";
		     alm2<= '1';		 
		  end if;
 when others =>
		estado2 <= "0000";
		alm2 <= '0';
  
 
 
 end case;

end if;
end if;

end process maq;


end architecture;
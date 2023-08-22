library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity tb_spi_slave is

end tb_spi_slave;

architecture Behavioral of tb_spi_slave is
component spi_slave is
	port(
			rst			: in std_logic;	
			sck			: in std_logic;	
			mosi		: in std_logic;	
			ss			: in std_logic;	
			miso		: out std_logic;	
			tx_data	    : in std_logic_vector(7 downto 0);	
			rx_data		: out std_logic_vector(7 downto 0)	
	);
end component;

signal rst			:  std_logic;	
signal sck			:  std_logic;	
signal mosi		    :  std_logic;	
signal ss			:  std_logic;	
signal miso		    :  std_logic;	
signal tx_data	    :  std_logic_vector(7 downto 0);	
signal rx_data		:  std_logic_vector(7 downto 0);	

begin

 uut : spi_slave port map
    (        
        rst			=> rst		,
        sck			=> sck		,
        mosi		=> mosi		,
        ss			=> ss		, 
        miso		=> miso		,
        tx_data     => tx_data  ,
        rx_data     => rx_data   
    );
    
stim_proc: process
begin
    rst <= '1';
    sck <= '0';
    ss <= '1';
    mosi <= '0';
    wait for 50 ns;
    rst <= '0';
    wait for 20ns;
    
    -- SS--
    ss <= '0';
    tx_data <= x"55";
    wait for 10ns;
    
    mosi <= '1';
    wait for 5 ns;
    sck <= '1';
    wait for 5 ns;
    sck <= '0';
    wait for 5 ns;
    sck <= '1';
    wait for 5 ns;
    sck <= '0';
    mosi <= '0';
    wait for 5 ns;
    sck <= '1';
    wait for 5 ns;
    sck <= '0';
    wait for 5 ns;
    sck <= '1';
    wait for 5 ns;
    sck <= '0';
    mosi <= '1';
    wait for 5 ns;
    sck <= '1';
    wait for 5 ns;
    sck <= '0';
    mosi <= '0';
    wait for 5 ns;
    sck <= '1';
    wait for 5 ns;
    sck <= '0';
    mosi <= '1';
    wait for 5 ns;
    sck <= '1';
    wait for 5 ns;
    sck <= '0';
    mosi <= '0';
    wait for 5 ns;
    sck <= '1';
    wait for 5 ns;
    sck <= '0';
    wait for 5 ns;
    
    ss <= '1';
    
    wait;

end process;

end Behavioral;

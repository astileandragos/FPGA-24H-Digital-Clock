## Clock signal
# Bank = 35, Pin name = IO_L12P_T1_MRCC_35, Sch name = CLK100MHZ
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Buttons 
# Bank = 15, Pin name = IO_L11N_T1_SRCC_15, Sch name = BTNC
set_property PACKAGE_PIN E16 [get_ports btnc]
set_property IOSTANDARD LVCMOS33 [get_ports btnc]

##Bank = 15, Pin name = IO_L3P_T0_DQS_AD1P_15,				Sch name = CPU_RESET
set_property PACKAGE_PIN C12 [get_ports {reset}]
set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

# Bank = 15, Pin name = IO_L14P_T2_SRCC_15, Sch name = BTNU
set_property PACKAGE_PIN F15 [get_ports btnu]
set_property IOSTANDARD LVCMOS33 [get_ports btnu]

# Bank = CONFIG, Pin name = IO_L15N_T2_DQS_DOUT_CSO_B_14, Sch name = BTNL
set_property PACKAGE_PIN T16 [get_ports btnl]
set_property IOSTANDARD LVCMOS33 [get_ports btnl]

# Bank = 14, Pin name = IO_25_14, Sch name = BTNR
set_property PACKAGE_PIN R10 [get_ports btnr]
set_property IOSTANDARD LVCMOS33 [get_ports btnr]

# Bank = 14, Pin name = IO_L21P_T3_DQS_14, Sch name = BTND
set_property PACKAGE_PIN V10 [get_ports btnd]
set_property IOSTANDARD LVCMOS33 [get_ports btnd]

set_property PACKAGE_PIN L3 [get_ports {segments[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[0]}]
set_property PACKAGE_PIN N1 [get_ports {segments[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[1]}]
set_property PACKAGE_PIN L5 [get_ports {segments[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[2]}]
set_property PACKAGE_PIN L4 [get_ports {segments[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[3]}]
set_property PACKAGE_PIN K3 [get_ports {segments[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[4]}]
set_property PACKAGE_PIN M2 [get_ports {segments[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[5]}]
set_property PACKAGE_PIN L6 [get_ports {segments[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[6]}]
set_property PACKAGE_PIN M4 [get_ports {segments[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[7]}]


##Bank = 34, Pin name = IO_L16P_T2_34,						Sch name = DP
#set_property PACKAGE_PIN M4 [get_ports dp]							
	#set_property IOSTANDARD LVCMOS33 [get_ports dp]

#Bank = 34, Pin name = IO_L18N_T2_34,						Sch name = AN0
set_property PACKAGE_PIN N6 [get_ports {anode[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[0]}]
#Bank = 34, Pin name = IO_L18P_T2_34,						Sch name = AN1
set_property PACKAGE_PIN M6 [get_ports {anode[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[1]}]
#Bank = 34, Pin name = IO_L4P_T0_34,						Sch name = AN2
set_property PACKAGE_PIN M3 [get_ports {anode[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[2]}]
#Bank = 34, Pin name = IO_L13_T2_MRCC_34,					Sch name = AN3
set_property PACKAGE_PIN N5 [get_ports {anode[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[3]}]
#Bank = 34, Pin name = IO_L3P_T0_DQS_34,					Sch name = AN4
set_property PACKAGE_PIN N2 [get_ports {anode[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[4]}]
#Bank = 34, Pin name = IO_L16N_T2_34,						Sch name = AN5
set_property PACKAGE_PIN N4 [get_ports {anode[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[5]}]
#Bank = 34, Pin name = IO_L1P_T0_34,						Sch name = AN6
set_property PACKAGE_PIN L1 [get_ports {anode[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[6]}]
#Bank = 34, Pin name = IO_L1N_T034,							Sch name = AN7
set_property PACKAGE_PIN M1 [get_ports {anode[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[7]}]
	
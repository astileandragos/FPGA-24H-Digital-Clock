# FPGA 24-Hour Digital Clock

A complete 24-hour digital clock hardware implementation on the Digilent Nexys 4 FPGA board. The project features real-time tracking, a state-machine-based time-setting interface, and dynamic display multiplexing.

## Hardware & Tech Stack
- **Language:** VHDL
- **Hardware:** Digilent Nexys 4 (Artix-7)
- **Tools:** Xilinx Vivado

## Hardware Architecture & Key Features
- **Timekeeping & FSM Logic:** The `clock_counter` module implements a Finite State Machine with states (`NORMAL`, `SET_HOURS`, `SET_MINUTES`, `SET_SECONDS`) allowing the user to adjust the time using directional buttons.
- **Custom Clock Dividers:** Features three distinct clock dividers derived from the main system clock: 1Hz for accurate time tracking, 1kHz for 7-segment display refresh, and 5Hz for the blinking effect during configuration.
- **7-Segment Multiplexing:** The `decoder` module handles dynamic anode scanning, translates BCD values to 7-segment patterns, and uses a blink mask to visually highlight the currently selected time unit (hours, minutes, or seconds).
- **Hardware Button Debouncing:** Implements a custom `ClockButton` debouncer to ensure clean, glitch-free inputs from the physical push buttons on the FPGA board.

## Setup & Run
1. Open Xilinx Vivado and create a new RTL project.
2. Import all the `.vhd` source files (e.g., `main_file.vhd`, `clock_counter.vhd`, `decoder.vhd`, etc.).
3. Import the corresponding `.xdc` constraint file for the Nexys 4 board.
4. Set `main_file.vhd` as the Top Module.
5. Run Synthesis, Implementation, and generate the Bitstream.
6. Program the FPGA board.

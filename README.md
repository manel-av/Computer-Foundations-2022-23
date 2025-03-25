# Computer Fundamentals - Elevator Controller Project

## About This Course
This hardware design course challenged me to implement a functional elevator controller using FPGA technology. Through this project, I gained hands-on experience with digital system design, finite state machines, and hardware description languages.

## Project Overview
**Krökem Elevators Controller** is an 8-floor elevator control system featuring:
- Bidirectional movement control (up/down)
- Call request memory
- Door operation management
- Visual floor indicators (7-segment display + LED array)

## Technical Implementation

### System Architecture
The controller consists of two main units:
1. **Processing Unit (UP)** with five modules:
   - `Floor_Requests`: Manages pending floor calls
   - `Floor`: Tracks current elevator position
   - `Open_Release`: Handles door operations
   - `UC_Signals`: Generates control signals
   - `Display`: Drives the 7-segment display

2. **Control Unit (UC)** with two state machines:
   - `UC_DIR`: Determines movement direction
   - `UC_MOV`: Manages movement and door timing

### Key Specifications
- **8 floors** (0-7)
- **4 clock cycles** per floor transition
- **3 clock cycles** minimum door open time
- **Memory** of all pending requests
- **Smart direction handling**: Continues current direction until no further requests

### Input/Output Signals
| **Inputs**              | **Outputs**               |
|-------------------------|---------------------------|
| `Button[7..0]`          | `Floor_7seg[6..0]`        |
| `SP` (door sensor)      | `Current_Floor[7..0]`     |
| `CK` (clock)            | `Requested_Floors[7..0]`  |
| `RST` (reset)           | `Open_Door[7..0]`         |
|                         | `Movement`, `Direction`   |

## Development Process

### Design Challenges
1. **Direction Logic**: Implementing the "continue until no further requests" behavior
   - Solution: Used `PP_up` and `PP_down` signals to track pending requests

2. **Door Timing**: Ensuring doors stay open for exactly 3 cycles after `SP=0`
   - Solution: Created a 6-state FSM in `UC_MOV`

3. **Request Management**: Clearing floor requests after service
   - Solution: Implemented `Release_Floor` signal in coordination with door operations
  
## Final Thoughts
This project provided fundamental understanding of:
- Digital system design principles
- Finite state machine implementation
- Hardware description languages (VHDL/Verilog)
- FPGA programming and testing

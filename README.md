# Vehicle-Movement-Based-Street-Lights
An intelligent street lighting system designed to automatically control street lights based on vehicle movement. The system optimizes energy consumption by turning lights ON only when motion is detected and switching them OFF after a defined delay, improving efficiency and safety.
Developed using an 8051 Microcontroller with custom PCB design, this project focuses on real-time automation and energy optimization in smart city infrastructure.

# Project Overview

Traditional street lighting systems operate continuously throughout the night, resulting in significant energy wastage, especially during low-traffic hours.
This project introduces a smart automation solution where street lights glow only when a vehicle is detected, and remain OFF otherwise. The system ensures:
-Reduced energy consumption
-Increased lifespan of lighting infrastructure
-Improved road safety
-Scalable smart city implementation

# Key Features

-Vehicle Detection Using Sensors

-Automatic ON/OFF Light Control

-Time-Based Delay Control

-Real-Time Embedded Processing

-Energy-Efficient Operation

-8051 Microcontroller-Based Design


# Hardware Components Used

| S.No | Component              | Description               |
| ---- | ---------------------- | ------------------------- |
| 1    | 8051 Microcontroller   | Central control unit      |
| 2    | IR Sensors             | Vehicle detection         |
| 3    | LED Street Lights      | Output lighting           |
| 4    | Relay Module           | High-voltage switching    |
| 5    | Power Supply Unit      | 5V regulated supply       |
| 6    | Crystal Oscillator     | Clock signal for MCU      |
| 7    | Capacitors & Resistors | Circuit stability         |

# System Workflow

1)System Initialization

Microcontroller initializes I/O ports

Sensor inputs configured

Output pins set for LED control

2)Vehicle Detection

IR sensor detects passing vehicle

Signal sent to microcontroller

3)Light Activation

Corresponding street light turns ON

Timer starts for delay control

4)Delay & Auto-Off

After preset delay, light turns OFF

System waits for next detection

5)Continuous Monitoring

Real-time sensor polling

Efficient response to multiple vehicles

# Working Principle

The system uses IR sensors placed along the road to detect vehicle presence. When a vehicle interrupts the IR beam, the 8051 microcontroller processes the signal and activates the corresponding street light segment.
Lights remain ON for a predefined duration and automatically turn OFF to conserve power. This segmented lighting approach significantly reduces electricity consumption during low-traffic hours.

# Results & Performance

✔️ Significant reduction in unnecessary power usage

✔️ Fast response time to vehicle detection

✔️ Stable operation under real-time conditions

✔️ Suitable for smart city applications

# Future Scope and Enhancements

The system can be enhanced by integrating wireless communication modules for centralized monitoring and remote control. Incorporating IoT connectivity would enable smart city integration with real-time analytics and power usage tracking. Replacing IR sensors with camera-based detection or radar sensors can improve accuracy under varying environmental conditions. Solar-powered implementation can further increase sustainability and reduce operational costs.

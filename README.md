Team Members: Paul Broome, Allison Pitzl, Tommy Skidmore, Elliott Kroll, Vincent Snell
Last Updated: 5-1-2024

The project's original goal was to explore Software Defined Radio (SDR) technologies and techniques paired with Synthetic Aperture Radar (SAR) technologies techniques and methods. 
The end result is a system that can accurately measure the speed of a moving/stationary object up to 2 m/s, as well as differentiate an object from the background with an unambiguous 
range of 10m and with at most a 3m resolution. This was to be accomplished with the Zynq UltraScale+ RFSoC DFE ZCU670 Evaluation Kit.

Instead of mechanical movement being used to create SAR images, a sweep of the area of interest is performed with a linear antenna array. 
The array is connected to the RFSoC via its breakout board included in the Evaluation Kit. 
SARDINE runs the calculations on the RFSoC in near real time to both transmit (TX) using beamforming and receive (RX). The resulting data output was to be a heatmap displayed on a computer.

While this was the intial project goal, we were able to create a RADAR simulink model in the RADAR code folder, and transmit and recieve on the board in the "Vivado Designs" Folder.

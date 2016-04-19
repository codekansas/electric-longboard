# Files associated with my electric longboard build

Sorry in advance to anyone who actually wants to use my design, because I did a poor job of making notes of things as I was doing it. For example, I lost the original OpenSCAD design for the mount. However, hopefully some of these will be useful to someone.

#### Files contained herein:

 - `longboard/longboard.ino`: Demo code for connecting an Arduino to the electronic speed controller. It can be done! The wiring is as follows: Put your variables resistor (in my case, a foot switch) between the 5V pin and the A0 pin. Then put your fixed resistor (it should be about the same resistance as the variable one, in my case around 10K ohms) between A0 and GND. Then connect the ground pin on the ESC to the ground pin on the Arduino, and the control pin on the ESC (usually the white wire) to digital pin 2 on the Ardino. DO NOT CONNECT THE RED ESC WIRE TO ANYTHING, it will blow out the board. There you go! To test it, just plug everything into a power source and fiddle with the variable resistor. You might have to change some values from my code to get it to work the way you want.
 - `longboard_battery_holders.scad` and `longboard_battery_holders.stl`: Mounts for the batteries. I used two standard Lipo batteries, which were 150 x 53 x 30 millimeters in dimension. The `.scad` file can be edited to whatever dimensions you need, or, if those work, the `.stl` file is precompiled for your 3D printing needs.
 - `mount_final.dxf`: Unfortunately, I lost the original OpenSCAD file, so this is pretty much it. I'm not even sure about the dimensions. However, it might give someone an idea of what they want, so I left it in here. For pioneers who are running into the "can't weld aluminum to steel" issue, I found it was much easier to use a non-circular axel. I cut my mount out of 1/2 inch aluminum using a waterjet cutter (it was dope, although I had to pretend to be a Georgia Tech student).
 - `side_view.jpg` and `top_view.jpg`: Pics or it didn't happen. Hopefully I will update it with better pictures at some point (ones that actually show how it was built).

Feel free to contact me if you have questions about building your own. I had a fun time building it and am interested in hearing about other peoples' designs.

# Simple Particle Simulation Using PICO-8
A simple particle simulation made with pico-8. Now only includes the explosion effect. Other effects might be achieved by changing serval parameters in the code.
# Installation
Requirement: PICO-8 (obviously)  
Open the .p8 file or the .png with PICO-8!
# Control
Y to change palette  
X to explode!
# Parameters
p_rnd=true --random position  
p_auto=true --auto explosion  
p_auto_freq=30 --frequency of auto explosion, up to 30/s  
p_x=64  
p_y=64  
p_num=100 --# of p each explosion  
p_max_num=500 --# of p allow in the pool before resuing  
p_r=5	--radius  
p_vx=2  
p_vy=2  
p_life=3	--life time  
p_style=0  -- 0=>fill 1=>wire  
plt_num=1	--palete using (1-#plt)  
  
--palette of explosion.  
--randomly pick a color  
--from the selected subtables  
plt={{9,10},  
					{8,9,10},  
					{2,8},  
					{2,8,14},  
					{6,7},  
					{5,6,7},  
					{1,12},  
					{1,12,13},  
					{3,11},   
					{3,11,12}}   


> Written with [StackEdit](https://stackedit.io/).

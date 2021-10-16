pico-8 cartridge // http://www.pico-8.com
version 33
__lua__
poke(0x5f5d,255)

p_rnd=true ---random position
p_x=64
p_y=64
p_num=300 --# of each explosion
p_r=8	--radius
p_vx=2
p_vy=2
p_life=0.5	--life time
plt_num=1	--palete using (1-5)

--palette of explosion
--randomly pick an color
--from every subtables
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

function _init()
end

function _update()
	sparks_update()
	if btnp(5) then
		x=p_x
		y=p_y
		if p_rnd then 
			x=rnd(127)
			y=rnd(127)
		end
		explode(x,y,p_vx,p_vy,
										p_r,p_life,
										p_num,plt_num)
	end
	if btnp(4) then
		plt_num+=1
		if plt_num>#plt then
			plt_num=1
		end
	end
end

function _draw()
	cls()
	sparks_draw()
	print("ptcls:"..
							#sparks,5,10,7)
	cpu=stat(1)
	clr=7
	if cpu>0.333 then clr=9 end
	if cpu>0.666 then clr=8	end
	print("cpu:"..(cpu*100).."%",
							5,19,clr)
end
-->8
sparks={}


function sparks_add()
	add(sparks,{
					x=0,
					y=0,
					vx=0,
					vy=0,
					r=0,
					clr=9,
					shrink=0.1,
					active=false,
					}) 
end 

function sparks_update()
	for s in all(sparks) do
		if s.active then
			s.x += s.vx
			s.y += s.vy
			s.r -= s.shrink
			if s.r <= 0 then
				del(sparks,s)
			end
		end
	end
end

function sparks_draw()
	for s in all(sparks) do
		circfill(s.x,s.y,s.r,s.clr)
	end
end
-->8
function explode(x,y,
																	vx,vy,
																	r,life,
																	num,plt_num)
	clr=plt[plt_num]
	for i=1,num do
		sparks_add()
	end				
	for i=#sparks,1,-1 do
		if not sparks[i].active then
			sparks[i].active = true
			sparks[i].x = x
			sparks[i].y = y
			sparks[i].clr = rnd(clr)
			sparks[i].r = r * rnd(1)
			sparks[i].shrink = r/(life *
																								stat(7))
			sparks[i].vx = vx * (rnd(2)-1)
			sparks[i].vy = vy * (rnd(2)-1)
		end
	end
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000009000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000777077707770777077700770700077700770000077007770777000000000000000000000000000000000000000000000000000000000000000000000000
00000707070707070070007007000700070007000070007007000707000000000000000000000000000000000000000000000000000000000000000000000000
00000777077707700070007007000700077007770000007007770777000000000000000000000000000000000000000000000000000000000000000000000000
00000700070707070070007007000700070000070070007000070707000000000000000000000000000000000000000000000000000000000000000000000000
00000700070707070070077700770777077707700000077707770777000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000aaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000aaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000aaaaaa0000009999990000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000aaaaaa000a099999999000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000a00aaaa00000999999999900000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000090000000aa000000999999999900000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000aaa0000099999aaa99900000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000a0000009999aaaaa9000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000999aaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000a00000000000099aaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000aaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000aaa090000000a99aaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000aaaaa0000999aaa99aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000a0aaaaaaa0099999a99999000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000aaaaa999aa0099999aa9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000a000000000000000a0a99999a0099999aa9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000009999999009999aaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000aaa00099999990999aaaaa0009990000000000000000000000000000000000000000000000000000000000009000000000000000000000
00000000000000000aaaaa00999999999999aaa00099999000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000aaaaa0009999999999990000999999900000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000aaaaa0000999099999990009999999900000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000aaa000000000aaa9999a099999999900000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000aaaaaa99aaa99999999000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000aaaaaaaa00a099999999000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000099900aaa999aaa00aaa9999999900000000000000000000000000000000000000000000000000000009000000900000000000000000
00000000000000000000999990aa99999aaaaaaaa999999900000000000000000000000000000000a00000000000000000000000000000000000000000000000
00000000000000000009999999aa99999aa9aaaaaa09999900000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000099a99999a99999aa99aaaaa00999000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000009aaa9999aa999aaa999aaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000009a999990aaaaaa9999aaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000099999000009999999aaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000099999aaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000099900aaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000aaa00000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aaa00000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000900000000000000000000000000000000000000009990000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000099999000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000099999000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a000000000000000000099999000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aaa00000000000000000aa9990000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a00000000000000000999aa00000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009999000099999a00000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000099999000099999a00000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000999000900099999000099999000000000000000000
00000000000000000000000000000000000000000000000000000000a00000000000000000000000000009999909a900999990000a999a000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000090000000999990aaa000999000000aaa0000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000a0000000000000009999900a00000000000000aaa000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000009990000000000000000000a0a00000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000900000000a0000000000000000000000aaa0000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000009990000000000000000000000000a00000a00000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000a0000090000000aaa000000000000000aaa0000000000000000000000
000000000000000000000000000000000000000000000000000000000099000000000000000000a00000aaaaa000000000000000a00a00000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000aaa0000aaaaa00000000000000000aaa0000900000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000009a90000aaaaa000000000000000000a00009990000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000999990000aaa0000000000000000000000000900000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000009999999000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000900009999999900000009990000000090000000000000000000000a00
0000000000000000000000000000000000000000000000000000000000000000000000000000099999990000009999900000000000000000000000000000aaa0
000000000000000000000000000000000000000000000000000000000000000000000000a0000009999900000099999000000000000000000000000000000a00
00000000000000000000000000000000000000000000000000000000000000000000000aaa000000999000000099999000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000a0000000000000000009990000000000000000aaa000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000aaa000000000000009000000000aaaaa00000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000aaaaa00090000000000000000000aaaaa00000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000aaaaaa00999000000000009900000aaaaa00000000000000
000000000000000000000000000000000000000000000000000000000000000a00000000000000000aaaaaa00900000000000999900000aaa000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000aaa0000090000000000099990000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000a000000000000000000000009000900000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000999000a0000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009000009990000000000000000
00000000000000000000000000000000000000000000000000000000000090000000000000000000009000000000000000000099900099999000000000000000
0000000000000000000000000000000000000000000000000000000000099900000000000000000000a000000000000000000009000099999aa0000000000000
00000000000000000000000000000000000000000000000000000000000090000900000000000000000000000000000000000000000099999aaa000000000000
0000000000000000000000000000000000000000000000000000000000000000999000000000000000000000000000000000000000000999aaaa000000000000
00000000000000000000000000000000000000000000000000000000000000000900000000000000000000000000000000000000000009aaaaaa000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000099900000000000000000000000000090a000aaa0000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000009999a000000000000000000000000099900000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000999aaa90000000000000000000000009000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000099999a9990a000a00000000000000a00a000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000009999990090aaa0aaa00000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000900090000a00009000a000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000009990000000000a999000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000090000000000aaa90000000000000000000000000900000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a0000000000000000000000
0000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000aaa000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a0000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000


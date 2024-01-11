function _init()
	pos={}
    pos.x=63
	pos.y=63
	
	vel={}
	vel.x=0
	vel.y=0

 	btn_two_was_pressed = false
	flap_counter = 0
 	poke(0x5f5c, 255)
end

function _update()
	g = 0.5

	flap_counter = max(0, flap_counter - 1)

	vel_y_before = vel.y
 	pos.x,vel.x=update_coord(pos.x,vel.x)
 	pos.y,vel.y=update_coord(pos.y,vel.y + g)

	if vel_y_before > 0 and vel.y < 0 then
		vel.y *= 0
	end
 
	acc=0.1

 	if btn(0) then
 		vel.x=vel.x-acc
 	elseif btn(1) then
 		vel.x=vel.x+acc
	end

 	if btnp(2) then
		vel.y=vel.y-4
		btn_two_was_pressed = true
		flap_counter = 5
 	elseif btn(3) then
 		vel.y=vel.y+acc
	end
	
end
	
function update_coord(c,v)
	c=c+v
	
	if c>116 then 
		c=c-v
		v=-v
	elseif c<0 then
		c=c-v 
		v=-v
	end

 	return c,v
	
end

function _draw()
	cls()
	map(0,0,0,0,16,16)
	draw_bird(pos)
		
end

function draw_bird(p)
	if flap_counter > 0 then
		frame = 3 
	else
		frame = 1
	end
	spr(frame, p.x, p.y, 2, 2)
end
	
function draw_square(x,y,w,c)
	x0 = x
	x1 = x+w-1
	y0=y
	y1=y+w-1
	rectfill(x0,y0,x1,y1,c)
	end
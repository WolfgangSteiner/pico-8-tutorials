function _init()
    cls()
    points = {} 

    add(points,make_point(0,0))
    add(points,make_point(127,0))
    add(points,make_point(64,127))
    current_point = make_point(0,0)
    stride = 0.5
    for p in all (points)  do 
        draw_point(p,8)
    end
end

function make_point(x,y)
    return {x=x,y=y} 
end


function draw_point(p,c)
    pset(p.x,p.y,c)
end


function _draw()
   --limit = 0
   -- random_circle()
    for i = 1,1009 do
    random_triangle()
    
    end 
  --  limit += 1
    return limit
end


function random_triangle()
--select next point
local next_point = rnd(points)          
--compute direction
 local di = make_point(next_point.x - current_point.x,next_point.y - current_point.y)
--compute next point using stride
di.x *= stride
di.y *= stride
current_point.x += di.x
current_point.y += di.y
--draw next point
--if limit  <= 10000000 then 
local color = pget(current_point.x,current_point.y) +1--else
    --color = 0


draw_point(current_point,color)
end

function random_circle()
    local radius = 32
    local x0 = 64
    local y0 = 64
    local alpha = rnd(1)
    local x = radius * cos(alpha) --+ 
    local y = radius * sin(alpha)
    pset(x,y,7)
    pset(x0,y0,7)
end

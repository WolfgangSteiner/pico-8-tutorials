function _init()
    cls()
end
function _draw()
    random_circle()

end

function random_circle()
    local radius = 32
    local x0 = 64
    local y0 = 64
    local alpha = rnd(1)
    local x = radius * cos(alpha) + x0 
    local y = radius * sin(alpha) + y0
    pset(x,y,7)
    pset(x0,y0,7)
end
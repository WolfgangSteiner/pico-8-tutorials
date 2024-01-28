function vec2(x,y)
    return {x=x,y=y}
end

function vec2_sub(a,b)
    return {x=a.x-b.x,y=a.y-b.y}
end

function vec2_add(a,b)
    return {x=a.x+b.x,y= a.y+b.y}
end

function vec2_mul(v,s)
    return{x=v.x*s,y=v.y*s}
end

function random(a,b)
    return rnd(b-a) + a
end

function vec2_eq(a,b)
    return a.x == b.x and a.y ==b.y
end

function vec2_random_direction()
    local alpha = rnd()
    local x = cos(alpha)
    local y = sin (alpha)
    return vec2(x,y)
end

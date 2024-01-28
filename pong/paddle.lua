function create_paddle(x,y)
    local paddle = {}
    paddle.h = 15
    paddle.w = 3
    paddle.vel = 4
    paddle.p = vec2(3,64)
    paddle.color = 12
    paddle.show_center = true
    paddle.draw = draw_paddle
    paddle.update = update_paddle
    return paddle
end

function update_paddle(paddle)
    if btn(2) then 
        local d = paddle.p.y - paddle.h\2 - court.t
        local v = min(d, paddle.vel)
        paddle.p.y = paddle.p.y - v
        
    elseif btn(3) then 
        local y1 = paddle.p.y + paddle.h\2 
        local y2 = court.h - court.t
        local d = y2 - y1 - 1
        local v = min(d,paddle.vel) 
        paddle.p.y = paddle.p.y + v
    end
 end

function draw_paddle(paddle)
    rectfill_centered(paddle.p.x, paddle.p.y, paddle.w, paddle.h, paddle.color)
    if paddle.show_center then
        pset(paddle.x,paddle.y, 7)
    end
end

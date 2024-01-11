function create_paddle(x,y)
    local paddle = {}
    paddle.h = 15
    paddle.w = 3
    paddle.vel = 4
    paddle.x = x
    paddle.y = y
    paddle.color = 12
    paddle.show_center = true
    return paddle
end

function update_paddle(paddle, court)
    if btn(2) then 
        local d = paddle.y - paddle.h\2 - court.t
        local v = min(d, paddle.vel)
        paddle.y = paddle.y - v
        
    elseif btn(3) then 
        local y1 = paddle.y + paddle.h\2 
        local y2 = court.h - court.t
        local d = y2 - y1 - 1
        local v = min(d,paddle.vel) 
        paddle.y = paddle.y + v
    end
 end

function draw_paddle(paddle)
    rectfill_centered(paddle.x, paddle.y, paddle.w, paddle.h, paddle.color)
    if paddle.show_center then
        pset(paddle.x,paddle.y, 7)
    end
end

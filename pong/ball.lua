function create_ball()
    local ball = {}
    ball.color = 7 --rnd(15) + 1
    ball.d = 3
    ball.x = 64
    ball.y = 64
    ball.vx = random_speed(1)
    ball.vy = random_speed(1)
    ball.acc = 1.025
    return ball
end

function random_speed(vmax)
    local v = rnd(vmax) + 1
    local sign = rnd(1)
    if sign < 0.5 then 
        sign = -1
    else 
        sign = 1
    end
    return sign * v   
end

function update_ball(ball,paddle,court)
    ball.x = ball.x + ball.vx
    ball.y = ball.y + ball.vy
    -- ball.color = rnd(15) + 1
    local paddle_was_hit = paddle_hits_ball(paddle,ball)
    if ball.x >= court.w - court.t or paddle_was_hit then 
        ball.vx = -ball.vx * ball.acc
        if paddle_was_hit then
            sfx(2)
        else 
            sfx(1)
        end
    end

    if ball.y >= court.h - court.t or ball.y <= 0 + court.t then 
        ball.vy = -ball.vy * ball.acc
        sfx(1)
    end
    if ball.x - ball.d\2 <= 0 then 
        ball.x = 64 
        ball.y = 64
        ball.vx = random_speed(1)
        ball.vy = random_speed(1)
        sfx(3)
    end
end

function paddle_hits_ball(paddle, ball)
    local y1 = paddle.y - paddle.h\2
    local y2 = paddle.y + paddle.h\2
    local d1 = paddle.w\2
    local d2 = ball.d\2
    if ball.x - d2 <= paddle.x + d1 and ball.y >= y1 - d2 and ball.y <= y2 + d2 then 
        return true
    end
    return false 
end


function draw_ball(ball)
    rectfill_centered(ball.x,ball.y,ball.d, ball.d, ball.color)
end
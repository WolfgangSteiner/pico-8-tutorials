function create_ball()
    local ball = {}
    ball.color = rnd(15) + 1
    ball.d = 3
    ball.x = 64
    ball.y = 64
    ball.vx = random_speed(4)
    ball.vy = random_speed(4)
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

function update_ball(ball)
    ball.x = ball.x + ball.vx
    ball.y = ball.y + ball.vy
    ball.color = rnd(15) + 1
    if ball.x >= court.w - court.t or ball.x <= 0 then 
        ball.vx = -ball.vx 
    end

    if ball.y >= court.h - court.t or ball.y <= 0 + court.t then 
        ball.vy = -ball.vy 
    end
end

function draw_ball(ball)
    rectfill_centered(ball.x,ball.y,ball.d, ball.d, ball.color)
end
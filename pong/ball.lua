function create_ball()
    local ball = {}
    ball.color = 7 --rnd(15) + 1
    ball.d = 3
    ball.p = vec2(64,64)
    ball.v_start = 3
    ball.v = random_speed(ball.v_start)
    
    ball.acc = 1.025
    ball.draw = draw_ball
    ball.update = update_ball
    return ball
end

function random_speed(vmax)
    return vec2_mul(vec2_random_direction(),vmax)
end

function update_ball(ball)
    ball.p = vec2_add(ball.p,ball.v)
    -- ball.color = rnd(15) + 1
    local paddle_was_hit = paddle_hits_ball(paddle,ball)
    if ball.p.x >= court.w - court.t or paddle_was_hit then 
        ball.v.x = -ball.v.x * ball.acc
        if paddle_was_hit then
            sfx(2)
            state.score = state.score + 1
        else 
            sfx(1)
        end
    end

    if ball.p.y >= court.h - court.t or ball.p.y <= 0 + court.t then 
        ball.v.y = -ball.v.y * ball.acc
        sfx(1)
    end
    if ball.p.x  <= 0 then 
        ball.p = vec2(64,64) 
        ball.v = random_speed(ball.v_start)
        sfx(3)
        state.lifes = state.lifes - 1
        
    end
end

function paddle_hits_ball(paddle, ball)
    local y1 = paddle.p.y - paddle.h\2
    local y2 = paddle.p.y + paddle.h\2
    local d1 = paddle.w\2
    local d2 = ball.d\2
    if ball.p.x - d2 <= paddle.p.x + d1 and ball.p.y >= y1 - d2 and ball.p.y <= y2 + d2 then 
        return true
    end
    return false 
end


function draw_ball(ball)
    rectfill_centered(ball.p.x,ball.p.y,ball.d, ball.d, ball.color)
end
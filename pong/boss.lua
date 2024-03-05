function create_boss()
    local boss = {}
    boss.p = vec2(64,64)
    boss.lifes = 3
    boss.draw = draw_boss
    boss.update = update_boss
    boss.music = true
    boss.sprites = {[3]=2,[2]=3,[1]=4}

    return boss
end

function boss_appearance()
    if state.score == 1  and state.boss_fight == false then
        state.boss_fight = true
        state.boss_was_spawned = true
        local boss = create_boss()
        add(entities,boss)
        if boss.music == true then
            sfx(8) elseif boss.music == false then 
                sfx(9)
            end
        --del(entities,ball)
        state.boss_fight = true 

        
        --if sfx(8)  sfx(9)
        --print("boss life,95,")
    end
end

function create_bad_ball(boss)
    local bad_ball = create_ball()
    bad_ball.p = vec2(boss.p.x, boss.p.y)

    bad_ball.v.x = -1
    bad_ball.v.y = paddle.vel - 3
    bad_ball.d = 3
    bad_ball.color = rnd(15 + 1) 
    bad_ball.update = update_bad_ball
    return bad_ball      
end

function update_bad_ball(bad_ball)
        bad_ball.color = rnd(15+1)
        bad_ball.p = vec2(bad_ball.p.x,bad_ball.p.y)
        bad_ball.p.x = bad_ball.p.x + bad_ball.v.x
        if btn(2) then 
            bad_ball.p.y = bad_ball.p.y - bad_ball.v.y
        elseif btn(3) then
            bad_ball.p.y = bad_ball.p.y + bad_ball.v.y
    end
end


function random_spawning(b)
    local random_number = rnd()
    return random_number <= b
end

function shoot_bad_balls(boss,bad_ball)
    end
--end

function update_boss(boss)
    boss.p.x += rnd(4) - 2
    boss.p.y += rnd(4) - 2
    if boss.p.x > 120 then
        boss.p.x -= 1
    end
    if boss.p.x < 10 then
        boss.p.x += 1
    end
    if boss.p.y > 120 then
        boss.p.y -= 1
    end
    if boss.p.y < 10 then
        boss.p.y += 1
    end

    if random_spawning(0.04) then
      local bb = create_bad_ball(boss)
      add(entities, bb)
    end
end

--function draw_bad_ball(bad_ball)
--    rectfill(bad_ball.p.x,bad_ball.p.y,bad_ball.d,bad_ball.d)
--end

function draw_boss(boss)
    local boss_sprite = boss.sprites[boss.lifes]
    spr(boss_sprite,boss.p.x,boss.p.y)
end

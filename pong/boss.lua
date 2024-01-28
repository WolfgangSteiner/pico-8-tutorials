function create_boss()
    local boss = {}
    boss.p = vec2(64,64)
    boss.lifes = 2
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

function create_bad_ball()
    local bad ball = {}
    bad_ball.x = boss.x
    bad_ball.y = boss.y
end


function shoot_bad_balls(boss,bad_ball)
    if state.boss_fight == true then
    end
end

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

  -- if vec2_eq(ball.p,boss.p)
  --  then draw_boss()

    --if ball.p ==

end

function draw_boss(boss)
    local boss_sprite = boss.sprites[boss.lifes]
    spr(boss_sprite,boss.p.x,boss.p.y)
end
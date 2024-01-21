function create_boss()
    local boss = {}
    boss.x = 64
    boss.y = 64
    boss.lifes = 3
    return boss
end

function boss_appearance()
    if state.score == 1 then
        state.boss_fight = true
    end
end

function update_boss()
    if state.boss_fight == true then
        

    end
end

function draw_boss()
spr(2,64,64)
end
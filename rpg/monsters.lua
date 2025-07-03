function create_monster(x,y,frames,type)
    local monster = {}
    monster.m_p = vec2(x,y) 
    monster.sprite = sprite_new(vec2(0,0),frames)
    monster.type = type
    monster.attackable = true
    monster.is_obstacle = true
    monster.draw = draw_monster
    monster.update = update_monster
    monster.move = monster_make_move
    monster.attack = monster_attack
    monster.gets_hit = monster_gets_hit
    monster.attacks = monster_attacks 
    monster.die = monster_die
    monster.was_hit = 0
    return monster
   end

function create_slime(x,y)
    local slime = create_monster(x,y,{9,10},"slime")
    slime.a_c = 2
    slime.attack_value = 3
    slime.hp = 8
    slime.does_attack = true
    slime.does_move = true
    return slime
end

function monster_gets_hit(monster)
    monster.was_hit = 15
end

function monster_attacks(monster)
    
end


function update_slime(e)
   
end

function monster_make_move(e)
    local dis = vec2_dist(e.m_p,player.m_p) 
    local dir = random_map_direction()
    local new_pos = vec2_add(e.m_p,dir)
   -- if local dis < 2 then 
    --lseif
    if is_player_near(e.m_p,1) and e.does_attack == true then
        perform_melee_attack(e,player)
        sfx(7)
    elseif is_walkable_at(new_pos) and not get_entity_at(new_pos) and e.does_move == true then
        e.m_p = new_pos
    end
end



function update_monster(e)
    for e in all(entities) do 
        if e.type == "cultist" then 
            cultist_hp = e.hp
        end
    end
end 

function monster_die(e)
    local pos = e.m_p 
    del(entities,e)
    local heart = create_heart(pos)
    if rnd(8) <= 10 then 
        add(entities, heart)
    end
end

function draw_monster(e)
    e.sprite.draw(e.sprite)
    if e.was_hit > 0 then 
        spr(44, e.sprite.p.x,e.sprite.p.y)
        e.was_hit -= 1
    end
end

function create_heart(pos)
    local heart = {}
    heart.sprite = sprite_new(vec2(0,0), {51})
    heart.attackable = false
    heart.m_p = pos
    heart.update = update_heart
    heart.draw = draw_heart
    heart.type = "heart"
    return heart 
end

function update_heart(heart)
    if vec2_eq(player.m_p,heart.m_p) then
        del(entities,heart)
        player.hp = min(player.max_hp,player.hp + 5)
        sfx(8)
    end
end

function draw_heart(heart)
    heart.sprite.draw(heart.sprite)
end

function create_cultist(x,y)
    local cultist = create_monster(x,y,{70,71},"cultist")
    cultist.sprite = sprite_new(vec2(0,0),{70,71})
    cultist.a_c = 0
    cultist.attack_value = 0
    cultist.hp = 50
    cultist.max_hp = 50
    cultist.does_attack = false
    cultist.does_move = false
    cultist.move = cultist_make_move
    cultist.protected = true
    cultist.set_protected = false
    cultist.update = update_cultist
    cultist.hp_count = 0
    cultist.count = 1
    return cultist 
end

function update_cultist(cultist)
    if cultist.protected == false then 
        cultist.hp_count = cultist.max_hp - cultist.hp
    end

    if cultist.hp_count >= 17*cultist.count then 
        cultist.hp_count = 0 
        cultist.count += 1
        cultist.protected = true
        player.m_p = vec2(87,39)
        sfx(21)
    end

    if is_entity_there("corrupted_ball") == false and cultist.protected == true and cultist.set_protected == true then 
        cultist.protected = false 
        cultist.set_protected = false
        local positions = {{86,33},{87,33},{88,33},{86,34},{88,34},{86,35,},{87,35},{88,35}}

        for p in all(positions) do 
            mset(p[1],p[2],8)
        end

        sfx(23)
    end


    if cultist.protected == true and cultist.set_protected == false then 
        local positions = {{86,33},{87,33},{88,33},{86,34},{88,34},{86,35,},{87,35},{88,35}}
        local positions2 = {{81,33,},{87,37},{88,31},{91,32}}
        for p in all(positions) do 
            mset(p[1],p[2],74)
        end

        for p in all(positions2) do 
           add(entities,create_corrupted_ball(p[1],p[2]))
        end

        cultist.set_protected = true
    end
end

function draw_cultist(cultist)
    cultist.sprite.draw(cultist.sprite)
end

function cultist_make_move(cultist)
end

function cultist_attacks(cultist)
end

function create_corrupted_ball(x,y)
    local corrupted_ball = create_monster(x,y,{72,73},"corrupted_ball")
    corrupted_ball.sprite = sprite_new(vec2(0,0),{72,73})
    corrupted_ball.a_c = 5
    corrupted_ball.attack_value = 3
    corrupted_ball.hp = 8
    corrupted_ball.does_move = true
    corrupted_ball.is_obstacle = true
    corrupted_ball.does_attack = true
    return corrupted_ball
end

function update_corrupted_ball(corrupted_ball)
end

function draw_corrupted_ball(corrupted_ball)
    corrupted_ball.sprite.draw(corrupted_ball.sprite)
end
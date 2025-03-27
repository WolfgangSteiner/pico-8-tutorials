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
    if is_player_near(e.m_p,1) then
        perform_melee_attack(e,player)
        sfx(7)
    elseif is_walkable_at(new_pos) and not get_entity_at(new_pos) then
        e.m_p = new_pos
    end
end



function update_monster(e)
   
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

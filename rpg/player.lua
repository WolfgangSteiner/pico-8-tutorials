function create_player()
   local player = {}
   player.sprite = sprite_new(vec2(0,0), {0,1})
   player.spr = 1
   player.v = vec2(1,1)
   player.m_p =    vec2(87,50) --vec2(5,63)
   player.alive = true
   player.die = player_die
   player.update = update_player
   player.attack_counter = 0
   player.attack_cooldown = 3 
   player.attack_value = 4
   player.a_c = 5
   player.hp = 25
   player.max_hp = 25
   player.was_hit = 0
   player.gets_hit = player_gets_hit
   player.attacks = player_attacks
   player.has_attacked = 0
   player.draw = draw_player
   player.last_move_time = 0
   player.move_cooldown = 0.5
   player.has_iron_key = true
   player.has_stone_key = true
   return player
end

function update_player(player)
   -- if player.walking_counter < player.walking_cooldown then 
     --   player.walking_counter += 0.1
        --return
       --else player.walking_counter = 0
    if  player.hp < 0 then
        player.hp = 0
     end

    if player.hp <= 0 and player.alive then
        player_die(player)
        sfx(11)
    elseif player.alive == false then 
        player.sprite.cells = {58}
    end

    if player.alive == false then 
        return 
    end
    
    local time_since_last_move = time() - player.last_move_time
    if time_since_last_move < player.move_cooldown then 
        return
    end

    --player skips a move    
    if btnp(5) then
        player_has_moved = true
        player.last_move_time = time()
        return
    end

    local new_m_p = compute_new_player_position(player)
    if not vec2_eq(new_m_p,player.m_p) then
        player_has_moved = true
        player.last_move_time = time()
        local e = get_entity_at(new_m_p)
        if e != nil and is_monster_at(new_m_p) then
             perform_melee_attack(player,e)
             player_attacks(player)
        elseif is_walkable_at(new_m_p) then
            player.m_p = new_m_p
            sfx(0)
        end

        --check for dungeon entrance
        if vec2_eq(player.m_p,vec2(15,10)) then 
            player.m_p = vec2(87,62)
            sfx(-1,0)
            sfx(1,0)
        end
        --check for dungeon exit
         if vec2_eq(player.m_p,vec2(87,63)) then 
            player.m_p = vec2(15,11)
            sfx(-1,0)
        end
        --doors and events 
        if vec2_eq(player.m_p,vec2(87,44)) and player.has_iron_key == true then
            player.has_iron_key = false
            mset(87,43,8)
            sfx(14)
        end

        if vec2_eq(player.m_p,vec2(87,42)) and player.has_stone_key == true then
            player.has_stone_key = false
            mset(87,41,8)
            sfx(14)
            sfx(18)
        end

        if vec2_eq(player.m_p,vec2(97,48)) and not slimes_defeated then 
            local positions = {{100,46},{105,50},{101,51},{103,48},{105,46},{102,44},{107,49},{99,51},{105,51}}
             slime_fight = true
            --close the door
            mset(96,48,6)
            sfx(-1,0)
            sfx(14)
            for p in all(positions) do
                add(entities,create_slime(p[1],p[2]))
            end
            sfx(15,0)
        end

        if slime_fight == true then 
            if is_in_area(97,43,108,53,"slime") == false then 
                mset(96,48,8)
                sfx(14)
                sfx(18)
                sfx(-1,0)
                sfx(1)
                slime_fight = false 
                slimes_defeated = true
                add(entities,create_key(102,48,{64,65},"stone"))
            end
        end

        if vec2_eq(player.m_p,vec2(87,40)) and not cultist_defeated and not cultist_fight then
            cultist_fight = true
            draw_cultist_bar = true
            sfx(-1,0)
            sfx(19,0)
            sfx(20,1)
            sfx(21)
            add(entities,create_cultist(87,37))
            mset(87,41,6)
        end
    end
end

function player_gets_hit(player)
    player.was_hit = 15
end

function player_attacks(player)
    player.has_attacked = 15
    player.sprite.cells = {2}
    sfx(6)
end

function compute_new_player_position(player)    
    local new_m_p = vec2(player.m_p) 

    if btnp(1) then
        new_m_p.x = min(player.m_p.x + player.v.x, 127)
  
    elseif btnp(0) then
        new_m_p.x = max( player.m_p.x - player.v.x, 0)

    elseif btnp(2) then 
        new_m_p.y = max(player.m_p.y - player.v.y,0)

    elseif btnp(3) then
        new_m_p.y = min(player.m_p.y + player.v.y,63)
    end

    return new_m_p 

end

function player_make_move()
    
end

function draw_player(player)
    player.sprite.draw(player.sprite)

    if player.was_hit > 0 then 
        spr(44,player.sprite.p.x,player.sprite.p.y)
        player.was_hit -= 1
    end

    if player.has_attacked > 0 then
        player.has_attacked -=1
    else
        player.sprite.cells = {0,1}
    end
end

function player_die(player)
    player.alive = false
    player.sprite.cells = {58}
end
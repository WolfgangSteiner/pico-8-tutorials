function create_player()
   local player = {}
   player.sprite = sprite_new(vec2(0,0), {0,1})
   player.spr = 1
   player.v = vec2(1,1)
   player.m_p = vec2(5,63) 
   player.update = update_player
   --player.walking_counter = 0 
  -- player.walking_cooldown = 1
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
   return player
end

function update_player(player)
   -- if player.walking_counter < player.walking_cooldown then 
     --   player.walking_counter += 0.1
        --return
       --else player.walking_counter = 0
    
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
        if e != nil and e.type != "npc" and e.type != "heart" then
             perform_melee_attack(player,e)
             player_attacks(player)
        elseif is_walkable_at(new_m_p) then
            player.m_p = new_m_p
            sfx(0)
        end

        if vec2_eq(player.m_p,vec2(15,10)) then 
            player.m_p = vec2(101,62)
        end
         if vec2_eq(player.m_p,vec2(101,63)) then 
            player.m_p = vec2(15,11)
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

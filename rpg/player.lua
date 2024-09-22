function create_player()
   local player = {}
   player.sprite = sprite_new(vec2(0,0), {1,2})
   player.spr = 1
   player.v = vec2(1,1)
   player.m_p = vec2(5,63) 
   player.update = update_player
   --player.walking_counter = 0 
  -- player.walking_cooldown = 1
   player.attack_counter = 0
   player.attack_cooldown = 3 
   return player
end

function update_player(player)
   -- if player.walking_counter < player.walking_cooldown then 
     --   player.walking_counter += 0.1
        --return
        --else player.walking_counter = 0
    

    local new_m_p = compute_new_player_position(player)
    
    if not vec2_eq(new_m_p,player.m_p) then
        player_has_moved = true
        if is_entity_at(new_m_p) then
            -- blocked by npc  
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


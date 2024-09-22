function random_map_direction()
    directions = {vec2(-1,0),vec2(1,0),vec2(0,-1),vec2(0,1)}
    return rnd(directions)
end

function is_entity_at(pos)
    for e in all(entities) do 
        if vec2_eq(pos,e.m_p) then 
            return true 
        end 
    end 
    return false
end

function is_walkable_at(pos)
    local sprite_number = mget(pos.x,pos.y) 
    return fget(sprite_number,0)
end

function is_player_at(pos)
    return vec2_eq(pos,player.m_p)
end
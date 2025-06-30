function random_map_direction()
    directions = {vec2(-1,0),vec2(1,0),vec2(0,-1),vec2(0,1)}
    return rnd(directions)
end

function get_entity_at(pos)
    for e in all(entities) do 
        if vec2_eq(pos,e.m_p) then 
            return e
        end 
    end 
    return nil
end

function is_monster_at(pos)
    for e in all(entities) do
        if vec2_eq(pos,e.m_p) and e.attackable == true then
            return e
        end
    end 
end

function is_walkable_at(pos)
    local sprite_number = mget(pos.x,pos.y)

    if fget(sprite_number,0) == false then 
        return false 
    end

    for e in all(entities) do 
        if vec2_eq(pos,e.m_p) and e.is_obstacle then 
            return false
        end
    end

    return true
end

function is_player_at(pos)
    return vec2_eq(pos,player.m_p)
end

function perform_melee_attack(a,b)
        a.attacks(a)
    local dice_roll = roll_dice(10)
    if dice_roll + a.attack_value > b.a_c then 
        local dmg = a.attack_value
        if dice_roll >= 9 then
            dmg *= 2
        end
        b.hp -= dmg
        if b.hp > 0 then
            b.gets_hit(b)
        else 
            b.die(b)
        end
    end
end

function is_player_near(pos,d)
    local dis = vec2_dist(pos,player.m_p)
    return dis <= d 
end

function is_in_camera(e)
    local dis = vec2_dist(camera.m_p,e.m_p)
    return dis <= 9
end

function is_in_area(x0,y0,x1,y1,type,number)
    local count = 0
    for e in all(entities) do
       if e.m_p.x >= x0 and e.m_p.x <= x1 and e.m_p.y >= y0 and e.m_p.y <= y1 and e.type == type then 
        return true
        end
    end
    return false
end

--function random_area_position(a,b)
    --local dis_1 = a.x - 1 
    --local dis_2 = a.y - 1
  --  return vec2(rnd((b.x - a.x)+2)+ dis_1,rnd((b.y - a.y)+2)+ dis_2)
--end

function is_entity_there(type)
    for e in all(entities) do 
        if e.type == type then
            return true 
        end
    end
    return false 
end
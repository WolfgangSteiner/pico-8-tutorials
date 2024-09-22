function create_monster(x,y,frames,type)
    local monster = {}
    monster.m_p = vec2(x,y) 
    monster.sprite = sprite_new(vec2(0,0),frames)
    monster.type = type
    monster.draw = draw_monster
    monster.update = update_monster
    monster.move = monster_make_move
    return monster
   end

function create_slime(x,y)
    local slime = create_monster(x,y,{9,10},"slime")
    return slime
end



function update_slime(e)
    
    
end

function monster_make_move(e)
    local dis = vec2_dist(e.m_p,player.m_p) 
    local dir = random_map_direction()
    local new_pos = vec2_add(e.m_p,dir)
   -- if local dis < 2 then 
    --lseif
    if is_walkable_at(new_pos) and not is_entity_at(new_pos) and not is_player_at(new_pos)then
        e.m_p = new_pos
    end
end


function update_monster()
end 

function draw_monster(e)
    e.sprite.draw(e.sprite)
end
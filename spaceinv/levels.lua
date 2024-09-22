function create_level_1()
    local level = scene_new()
    local x = 5
    local y = 5
    scene_add_entity(level, create_starfield())
    scene_add_entity(level, player)
    for i = 0,23 do
        x = 16*(i%8) +5
        y = 16*flr(i/8) + 5
        local alien = sprite_new(vec2(x,y),{5})
        alien.v = vec2(0,0.04) 
        scene_add_entity(level,alien)
         

    end
    level.music = 6 
    return level
end



function update_level_1(level,player,alien,shot)
if hitbox(shot,alien) then 
    del(scene.entities,alien)
    end
end




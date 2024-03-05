
function create_player()
    local p = sprite_new(vec2(64, 119), {1,2,3})
    p.v = vec2(3, 3)
    p.update = update_player
    p.shooting = false
    p.shooting_counter = 0
    return p
end

function update_player(player)
    sprite_animate(player)

    if btn(1) then
        player.p.x = min(player.p.x + player.v.x, 120)
  
    elseif btn(0) then
        player.p.x =max( player.p.x - player.v.x, 0)
    end
    if btn(2) then 
        player.p.y = max(player.p.y - player.v.y,0)
    elseif btn(3) then
        player.p.y = min(player.p.y + player.v.y,120)
    end

    if btn(5) and player.shooting_counter > 2 then 
        player.shooting_counter = 0
        scene_add_entity(current_scene, create_shot(player))
    end

    player.shooting_counter = player.shooting_counter + 0.1
    local d = player.p.x - 120
      
end

function create_shot(player)
    local shot = sprite_new(player.p, {4}) 
    shot.v = vec2(0, -3)
    shot.sound = 2
    shot.update = update_shot
    sfx(2)
    return shot
end

function update_shot(shot)
    sprite_update(shot)
    if shot.p.y < 0 then 
        shot.is_alive = false
    end
end


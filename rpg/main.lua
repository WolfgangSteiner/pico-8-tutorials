function _init()
    camera = {m_p = vec2(0,0), size = vec2(16,16)}
    player = create_player()
    tick = 0
    last_timestamp = time()
    tick_duration = 3
    player_has_moved = false
    entities = {}
    spawn_all_slimes()
    spawn_all_npcs()
    spawn_all_shooters()
    spawn_all_swirls()
    spawn_all_keys()
   --music = sfx (4)
end

function _update()
    update_player(player)
    update_camera()
    current_time = time()
    if current_time - last_timestamp >= tick_duration or player_has_moved then
        tick += 1 
        last_timestamp = time()
        player_has_moved = false
        for e in all(entities) do
            if e.move != nil and is_in_camera(e) then
                e.move(e)
            end    
        end
    end
    for e in all(entities) do 
        -- transform sprites from map to screen
        transform_sprite_position(e) 
        -- perform sprite animations
        e.sprite.update(e.sprite)
        e.update(e)
    end
end

function update_camera()
    camera.m_p.x = mid(player.m_p.x,camera.size.x/2,127 - camera.size.x/2) --- camera.size.x/2
    camera.m_p.y = mid(player.m_p.y,camera.size.y/2,64 - camera.size.y/2) --- camera.size.y/2
end

function transform_sprite_position(e)
    local offset = vec2_mul(camera.size, 0.5)
    e.sprite.p = vec2_mul(vec2_sub(vec2_add(e.m_p,offset),camera.m_p),8)
end





function _draw()
    transform_sprite_position(player)
    sprite_update(player.sprite)
    cls()
    map(camera.m_p.x - camera.size.x/2,camera.m_p.y - camera.size.y/2,0,0,camera.size.x,camera.size.y)
    for e in all (entities) do 
        e.draw(e)
    end
    player.draw(player)
    rectfill(90, 0, 128, 8, 0)
    print("\135"..tostr(player.hp), 111, 1, 7 )

    if player.has_iron_key == true then 
        spr(61,105,1)
    end

    if player.alive == false then 
        rectfill(49,57,80,65,0)
        print("you die ",53,59,1)
        
    end
end

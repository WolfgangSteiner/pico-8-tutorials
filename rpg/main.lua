function _init()
    camera = {m_p = vec2(0,0), size = vec2(16,16)}
    player = create_player()
    tick = 0
    last_timestamp = time()
    tick_duration = 3
    player_has_moved = false
    entities = {}
    add(entities,create_npc(15,39,{33,34},"please help us,\nthere are strange voices\ncoming out of the cave\nnorth of our village!"))
    add(entities,create_npc(14,48,{27,28},"welcome to oakville!"))
    add(entities,create_npc(5,44,{31,32},"walk into a monster\nto attack it"))
    add(entities,create_slime(12,59))
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
           e.move(e)
        end
    end
    for e in all(entities) do 
        update_sprites(e) 
        e.sprite.update(e.sprite)
        e.update(e)
    end
end

function update_camera()
    camera.m_p.x = mid(player.m_p.x,camera.size.x/2,127 - camera.size.x/2) --- camera.size.x/2
    camera.m_p.y = mid(player.m_p.y,camera.size.y/2,64 - camera.size.y/2) --- camera.size.y/2
end

function update_sprites(e)
    local offset = vec2_mul(camera.size,0.5)
    e.sprite.p = vec2_mul(vec2_sub(vec2_add(e.m_p,offset),camera.m_p),8)
end





function _draw()
    update_sprites(player)
    cls()
    map(camera.m_p.x - camera.size.x/2,camera.m_p.y - camera.size.y/2,0,0,camera.size.x,camera.size.y)
    for e in all (entities) do 
        e.draw(e)
    end
    player.sprite.draw(player.sprite)
    
end
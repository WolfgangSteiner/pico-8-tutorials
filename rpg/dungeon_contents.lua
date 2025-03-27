function create_shooter(x,y,dir,frames)
    local shooter = {}
    shooter.m_p = vec2(x,y)
    shooter.sprite = sprite_new((vec2(0,0)),frames)
    shooter.attackable = false
    shooter.is_obstacle = true
    shooter.dir = dir
    shooter.cooldown = 3
    shooter.last_shooting_time = 0
    shooter.draw = draw_shooter
    shooter.update = update_shooter
    return shooter
end

function update_shooter(shooter)
    local time_since_last_shot = time() - shooter.last_shooting_time
    if time_since_last_shot < shooter.cooldown then
        return
    end

    local bullet = create_bullet(shooter.m_p,shooter) 
    add(entities,bullet)
    shooter.last_shooting_time = time()
    sfx(10)
end

function draw_shooter(shooter)
    shooter.sprite.draw(shooter.sprite)
end

function create_bullet(pos,shooter)
    local vel = determine_bullet_vel(shooter)
    local bullet ={}
    bullet.attackable = false
    bullet.is_obstacle = false
    bullet.dmg = 9
    bullet.vel = vel
    bullet.m_p = pos
    bullet.update = update_bullet
    bullet.draw = draw_bullet
    bullet.sprite = sprite_new(vec2(0,0),{57})
    return bullet
end

function determine_bullet_vel(shooter)
    if shooter.dir == "up" then
        return vec2(0,-1)
    elseif shooter.dir == "down" then
        return vec2(0,1)
    elseif shooter.dir == "left" then
        return vec2(-1,0)
    elseif shooter.dir == "right" then
        return vec2(1,0)
    end
end

function update_bullet(bullet)
    bullet.m_p = vec2_add(bullet.m_p, bullet.vel)
    if not is_walkable_at(bullet.m_p) then
        del(entities,bullet)   
    end

   -- for e in all(entities) do
        if vec2_eq(bullet.m_p,player.m_p) then
            player.hp -= bullet.dmg
            del(entities,bullet)
            sfx(9)
        
    end
end

function draw_bullet(bullet)
    bullet.sprite.draw(bullet.sprite)
end
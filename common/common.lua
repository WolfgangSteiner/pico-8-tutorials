-- misc functions

function random(a,b)
    return rnd(b-a) + a
end

-- 2d vector

function vec2(x,y)
    return {x=x,y=y}
end

function vec2_sub(a,b)
    return {x=a.x-b.x,y=a.y-b.y}
end

function vec2_add(a,b)
    return {x=a.x+b.x, y=a.y+b.y}
end

function vec2_mul(v,s)
    return{x=v.x*s,y=v.y*s}
end

function vec2_eq(a,b)
    return a.x == b.x and a.y ==b.y
end

function vec2_random_direction()
    local alpha = rnd()
    local x = cos(alpha)
    local y = sin (alpha)
    return vec2(x,y)
end


-- entity
function entity_new()
    return {
        p=vec2(0,0),
        v=vec2(0,0),
        is_alive = true,
        update=entity_update,
        draw=entity_draw,
    }
end

function entity_update(e)
    e.p = vec2_add(e.p, e.v)
end

function entity_draw(e)
end

-- sprite
function sprite_new(pos, cells)
    local s = entity_new()
    s.p = pos
    s.cells = cells
    s.current_cell_idx = 1
    s.animation_delay = 0.5
    s.animation_last_time = time()
    s.update = sprite_update
    s.draw = sprite_draw
    return s
end

function sprite_set_cells(s, cells)
    s.cells = cells
    s.current_cell_idx = 1
    s.animation_last_time = time()
end

function sprite_animate(s)
    if #s.cells < 2 then
        return
    end
    local dt = time() - s.animation_last_time
    if s.animation_delay > 0 and dt >= s.animation_delay then
        s.animation_last_time = time()
        s.current_cell_idx = (s.current_cell_idx % #s.cells) + 1
    end
end

function sprite_update(s)
    entity_update(s)
    sprite_animate(s)
end

function sprite_draw(s)
    spr(s.cells[s.current_cell_idx], s.p.x, s.p.y)
end

-- scene
function scene_new()
    return {
        entities = {},
        update = scene_update,
        draw = scene_draw,
    }
end

function scene_add_entity(s, e)
    add(s.entities, e)
end

function scene_update(s)
    for e in all(s.entities) do
        e.update(e)
        if e.is_alive == false then
            del(s.entities, e)
        end
    end
end

function scene_draw(s)
    for e in all(s.entities) do
        e.draw(e)
    end
end


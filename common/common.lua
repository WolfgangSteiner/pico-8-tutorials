-------------------------------------------------------------------------------
-- misc functions
-------------------------------------------------------------------------------
function random(a,b)
    return rnd(b-a) + a
end



function float(e,amp,factor,offset)
    e.p.y = amp*sin(time()*factor) + offset

end


-------------------------------------------------------------------------------
-- vec2
-------------------------------------------------------------------------------
function vec2(x,y)
    if type(x) == "table" then
        return {x = x.x, y = x.y} 
    else
        return {x=x,y=y}
    end
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

function vec2_eq(a,b)
    return a.x == b.x and a.y == b.y 
end
 
function vec2_abs(a)
    return sqrt(a.x*a.x + a.y*a.y)
end

function vec2_dist(a,b)
   return vec2_abs(vec2_sub(a,b))
end



-------------------------------------------------------------------------------
-- entity
-------------------------------------------------------------------------------
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


function hitbox(a,b)
    if a.p == b.p then
        return true 
    else
        return false
    end
end



-------------------------------------------------------------------------------
-- sprite
-------------------------------------------------------------------------------
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


-------------------------------------------------------------------------------
-- scene
-------------------------------------------------------------------------------
function scene_new()
    return {
        entities = {},
        update = scene_update,
        draw = scene_draw,
        music = nil,
        has_ended = false
    }
end

function start_scene(scene)
    current_scene = scene
    scene.start_time = time()
    sfx(-1,3)
    if scene.music != nil then
        sfx(scene.music,3)
    end
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


-------------------------------------------------------------------------------
-- text (scroller)
-------------------------------------------------------------------------------
function text_entity_init(pos, text, color)
    local ts = entity_new()
    ts.p = pos
    ts.text = text
    ts.color = color
    ts.draw = function(ts)
        print(ts.text, ts.p.x, ts.p.y, ts.color)
    end
    return ts
end

function text_scroller_init(pos, text, color)
    local ts = text_entity_init(pos, text, color)
    ts.v = vec2(-1.5, 0)
    ts.has_ended = false
    ts.stop_at_right_edge = false
    ts.update = text_scroller_update
    return ts
end

function text_scroller_update(ts)
    entity_update(ts)
    local text_width = 4 * #ts.text
    local offset = 0 
    if (ts.stop_at_right_edge) offset = 128
    if ts.p.x <= -text_width + offset then
        ts.v.x = 0
        ts.p.x = -text_width + offset
        ts.has_ended = true
    end
end


--function new_text

-------------------------------------------------------------------------------
--text
-------------------------------------------------------------------------------

function text_size(s)
    local arr = split(s,"\n")
    local w = 0
    local h = #arr*6 - 1
    for l in all(arr) do
       w = max(#l*4 - 1,w)  
    end
    return vec2(w,h)

end

function print_centered(s,x,y,c)
local size = text_size(s)
    print(s,x - size.x/2,y,c)
end

function speech_bubble(s,x,y,c)
    local size = text_size(s)
    local x0 = x - size.x/2 - 1
    local y0 = y - size.y - 2 - 2
    local x1 = x + size.x/2 + 1
    local y1 = y - 2
    rectfill(x0,y0 + 1,x1,y1 -1,7)
    rectfill(x0 + 1,y0,x1 -1,y1,7)
    line(x,y,x,y1,7)
    line(x,y,x + 1,y1,7)

    print_centered(s,x,y - size.y - 2,c)
end



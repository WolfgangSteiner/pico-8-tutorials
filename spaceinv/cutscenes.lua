function create_cutscene_1()
    local cs = scene_new()
    --cs.background = map(0,0,0,0,32,32)
    cs.oscar = sprite_new(vec2(7*8, 13*8), {35})
    cs.rick = sprite_new(vec2(6*8, 13*8),  {34})
    cs.update = update_cutscene_1
    cs.draw = draw_cutscene_1
    cs.start_time = time()
    cs.last_shot_time = 0
    cs.num_shots = 0
    cs.time_between_shots = 1
    cs.start_shots = false
    cs.msg = create_text_scroller()
    cs.entities = { cs.msg, cs.oscar, cs.rick }
    sfx(3,3)
    return cs
end

function create_text_scroller()
    local msg = entity_new()
    msg.p = vec2(64, 5)
    msg.v = vec2(-1.5*2, 0)
    msg.has_ended = false
    msg.text = "we are in a terranian soldier ship in the great war between our galaxy and the galaxy of zyxor. This is a patrol, so there are only two people abord."
    msg.draw = draw_text_scroller
    msg.update = update_text_scroller
    return msg
end

function update_text_scroller(msg)
    entity_update(msg)
    local text_width = 4 * #msg.text
    if msg.p.x <= -text_width + 128 then
        msg.v.x = 0
        msg.p.x = -text_width + 128
        msg.has_ended = true
    end
end

function draw_text_scroller(msg)
    print(msg.text, msg.p.x, msg.p.y, 2)
end

function update_cutscene_1(cs)
    local dt = time() - cs.start_time
    scene_update(cs)
    if (cs.msg.has_ended == true) and (cs.start_shots == false) then
        cs.start_shots = true
        -- stop music
        sfx(-1,3)
    end

    if cs.start_shots and cs.num_shots < 5 and dt - cs.last_shot_time >= cs.time_between_shots then
        sfx(4)
        cs.last_shot_time = dt
        cs.num_shots += 1
    end
end

function draw_cutscene_1(cs)
    map(5,0,0,0,32,32)
    rectfill(0,0,128,13,0)
    scene_draw(cs)
end

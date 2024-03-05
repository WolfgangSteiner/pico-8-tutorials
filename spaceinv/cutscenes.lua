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
    cs.msg = text_scroller_init(
        vec2(128, 5),
        "we are in a terranian soldier ship in the great war between our galaxy and the galaxy of zyxor. this is a patrol, so there are only two people abord.")
    cs.msg.stop_at_right_edge = false
    cs.entities = { cs.msg, cs.oscar, cs.rick }
    sfx(3,3)
    return cs
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

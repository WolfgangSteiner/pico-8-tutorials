function create_cutscene_1()
    local cs = scene_new()
    --cs.background = map(0,0,0,0,32,32)
    cs.oscar = sprite_new(vec2(8*8, 13*8), {36,37})
    cs.oscar.animation_delay = 0.6
    cs.rick = sprite_new(vec2(6*8, 13*8),  {34,35})
    cs.time_between_talking = 1
    cs.update = update_cutscene_1
    cs.draw = draw_cutscene_1
    cs.last_shot_time = 0
    cs.num_shots = 0
    cs.time_between_shots = 0.25
    cs.start_shots = false
    cs.rick_has_spoken = false
    cs.msg = text_scroller_init(
        vec2(128, 5),
        "we are in a terranian soldier ship in the great war between our galaxy and the galaxy of zyxor. this is a patrol, so there are only two people abord.",
        2)
    cs.msg.stop_at_right_edge = false
    cs.msg.v = vec2(-1.5,0)
    cs.entities = { cs.msg, cs.oscar, cs.rick }
    cs.music = 3
    return cs
end


function update_cutscene_1(cs)
    scene_update(cs)
    if cs.msg.has_ended and not cs.start_shots then
        cs.start_shots = true
        sfx(5,3) -- start siren
    end

    if cs.start_shots and time() - cs.last_shot_time >= cs.time_between_shots then
        sfx(4)
        local shot = sprite_new(vec2(rnd(17*8),rnd(9*8)+2*8), {38,39,40})
        scene_add_entity(cs, shot)
        cs.last_shot_time = time()
        cs.num_shots += 1

        if cs.num_shots == 10 then
            scene_add_entity(cs,text_entity_init(vec2(0,0),"rick: o no! an ambush!",12))
            sfx(7)
        elseif cs.num_shots == 18 then  
            scene_add_entity(cs,text_entity_init(vec2(52,9),"oscar: go get 'em!",3))
            sfx(9)
        elseif cs.num_shots == 25 then
            cs.has_ended = true
        end
    end
end


function draw_cutscene_1(cs)
    map(5,0,0,0,32,32)
    rectfill(0,0,128,17,0)
    scene_draw(cs)
end

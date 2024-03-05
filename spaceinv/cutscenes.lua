function create_cutscene_1()
    local cutscene_1 = {}
    --cutscene_1.background = map(0,0,0,0,32,32)
    cutscene_1.oscar = { sprite=35, vel=2 } 
    cutscene_1.rick = { sprite=34, vel=2 }
    cutscene_1.rick.p = vec2(6*8,13*8)
    cutscene_1.oscar.p = vec2(7*8,13*8)
    cutscene_1.update = update_cutscene_1
    cutscene_1.draw = draw_cutscene_1
    cutscene_1.start_time = time()
    cutscene_1.msg = { p=vec2(132,5), vel = -15}
    cutscene_1.music = sfx(3,3)
    cutscene_1.last_shot_time = 0
    cutscene_1.num_shots = 0
    cutscene_1.time_between_shots = 1
    cutscene_1.start_shots = false
    cutscene_1.msg.text = "we are in a terranian soldier ship in the great war between our galaxy and the galaxy of zyxor. This is a patrol, so there are only two people abord."
    return cutscene_1
end

function update_cutscene_1(cutscene_1) 
    local dt = time() - cutscene_1.start_time
    local text_width = 4 * #cutscene_1.msg.text
    local shot_x = 0
    cutscene_1.msg.p.x += cutscene_1.msg.vel
    cutscene_1.msg.p.y = 5 
    if cutscene_1.msg.p.x <= -text_width + 128 then
        cutscene_1.msg.vel = 0
        cutscene_1.msg.p.x = -text_width + 128
        cutscene_1.start_shots = true
        sfx(-1,3)
    end

    if cutscene_1.start_shots and cutscene_1.num_shots < 5 and dt - cutscene_1.last_shot_time >= cutscene_1.time_between_shots then
        sfx(4)
        shot_x += 5 
        cutscene_1.last_shot_time = dt
        cutscene_1.num_shots += 1
    end
end

function draw_cutscene_1(cutscene_1)
    map(5,0,0,0,32,32)
    rectfill(0,0,128,13,0)
    print(cutscene_1.msg.text, cutscene_1.msg.p.x, cutscene_1.msg.p.y,2)
    spr(cutscene_1.rick.sprite,cutscene_1.rick.p.x,cutscene_1.rick.p.y)
    spr(cutscene_1.oscar.sprite,cutscene_1.oscar.p.x,cutscene_1.oscar.p.y)
    if cutscene_1.start_shots and cutscene_1.num_shots < 5 and dt - cutscene_1.last_shot_time >= cutscene_1.time_between_shots then
    spr(36,shot_x,12)    
end
end
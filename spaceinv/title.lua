function create_title_screen()
    local title_screen = scene_new()
    local text = text_entity_init(vec2(40,50),"alien attack",2)
    local text_2 = text_entity_init(vec2(15,100),"press any button to begin",11)
    local background = create_starfield()
     title_screen.music = 10
    text.update = function(e)
        float(e,5,0.25,50)
    end
    title_screen.update = update_title
    scene_add_entity(title_screen,background)
    scene_add_entity(title_screen,text)
    scene_add_entity(title_screen,text_2)
    return title_screen
end

function update_title(title)
    scene_update(title)
    if btn(4) or btn(5) then 
        start_scene(intro)
    end
end








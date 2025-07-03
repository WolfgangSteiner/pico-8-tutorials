function create_title_screen()
    local title_screen = scene_new()
    local text = text_entity_init(vec2(10,30),"the corrupted caves",2)
    local text_2 = text_entity_init(vec2(15,100),"press any button to begin",8)
    title_screen.update = update_title
    scene_add_entity(title_screen,text)
    scene_add_entity(title_screen,text_2)
    return title_screen
end

function update_title(title_screen)
    scene_update(title_screen)
    if btn(4) or btn(5) then 
        start_scene(game)
        spawn_all_slimes()
        spawn_all_npcs()
        spawn_all_shooters()
        spawn_all_swirls()
        spawn_all_keys()
    end
end

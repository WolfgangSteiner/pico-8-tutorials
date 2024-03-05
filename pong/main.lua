function _init()
    state = create_game_state()
    music = sfx(9)
    court = create_court()
    paddle = create_paddle(1, 64)
    ball = create_ball()
    entities = {court,paddle,ball}
end


function _update()
    update_game_state()
    if state.running == true then
        for e in all(entities) do
            if e.update then
                e.update(e)
            end
        end
    end
    boss_appearance()
end


function _draw()
    cls()
    for e in all(entities) do
         e.draw(e)
    end
    draw_game_state(state)
   -- mapdraw(0)
end

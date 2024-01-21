function _init()
    court = create_court()
    paddle = create_paddle(1, 64)
    ball = create_ball()
    state = create_game_state()
end


function _update()
    update_game_state()
    boss_appearance()
    if state.running == true then
        update_paddle(paddle, court)
    end
    if state.boss_fight == false then
        update_ball(ball,paddle,court)
    end
    
end


function _draw()
    cls() 
    draw_court(court)
    draw_paddle(paddle)
    if state.boss_fight == false then 
    draw_ball(ball)
    end
    draw_game_state(state)
    if state.boss_fight == true then
        draw_boss()
    end
end
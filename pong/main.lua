function _init()
    court = create_court()
    paddle = create_paddle(1, 64)
    ball = create_ball()
    state = create_game_state()
end


function _update()
    update_game_state()
    if state.running == true then
        update_paddle(paddle, court)
        update_ball(ball,paddle,court)
    end
    
end


function _draw()
    cls() 
    draw_court(court)
    draw_paddle(paddle) 
    draw_ball(ball)
    draw_game_state(state)
end
function _init()
    court = create_court()
    paddle = create_paddle(1, 64)
    ball = create_ball()
end


function _update()
    update_paddle(paddle, court)
    update_ball(ball,paddle,court)
    
end


function _draw()
    cls() 
    draw_court(court)
    draw_paddle(paddle) 
    draw_ball(ball)
    
end
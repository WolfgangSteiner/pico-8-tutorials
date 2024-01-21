function create_game_state()
    local state = {}
    state.lifes = 3
    state.score = 0
    state.running = true
    state.boss_fight = false
    return state 
end
 function draw_game_state(state)
    score = ""..state.score * 100
    score_len = #score
    print(score, 124 - score_len * 4, 5, 7)
    local x = 30
    for i = 1, state.lifes do
        spr(1,x,5)
        x = x + 6
    end
    if state.running == false then
        print("GAME OVER", 32, 62)
    end
 end

 function update_game_state()
    if state.lifes < 1 then
       state.running = false
    end
end
    
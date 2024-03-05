
function create_player()
  local  player = {}
  player.p = vec2(64, 119)
  player.v = 3
  player.spr = 1
  player.update = update_player
  player.draw = draw_player
  player.shooting = false
  player.shooting_counter = 0
  return player
end

function update_player(player)
    player.spr = player.spr + 0.17
    if player.spr >= 4 then player.spr = 1
    end
    if btn(1) then
        player.p.x = min(player.p.x + player.v, 120)
  
    elseif btn(0) then
        player.p.x =max( player.p.x - player.v, 0)
    end
    if btn(2) then 
        player.p.y = max(player.p.y - player.v,0)
    elseif btn(3) then
        player.p.y = min(player.p.y + player.v,120)
    end


    if btn(5) and player.shooting_counter > 2   then 
        player.shooting_counter = 0
        add(entities, create_shot(player)) 
    end

    player.shooting_counter = player.shooting_counter + 0.1
    local d = player.p.x - 120
      
end


function create_shot(player)
  local shot = {}
  shot.p = vec2(player.p.x, player.p.y)
  shot.v = 3
  shot.sound =2
  shot.spr = 4
  shot.update = update_shot
  shot.draw = draw_shot
  sfx(2)
  return shot
end

function update_shot(shot)
  shot.p.y = shot.p.y - shot.v
  if shot.p.y < 0 then 
    del(entities,shot)
  end
end

function draw_shot(shot)
  spr(shot.spr,shot.p.x,shot.p.y)
end

function draw_player(player)
  spr(player.spr, player.p.x, player.p.y)
end

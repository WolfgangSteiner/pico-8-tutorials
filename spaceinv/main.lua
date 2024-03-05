function _init()
  cutscene_1_active = true
  if cutscene_1_active == false then
    counter = 0;
    player = create_player()
    entities = {create_starfield(),player,shot,}
    sfx(0)
  else 
    cutscene_1 = create_cutscene_1()
  end
end

function _update()
  --counter += 0.01
  if cutscene_1_active == true then
    update_cutscene_1(cutscene_1)
  else
  for e in all (entities) do
    if e.update then 
      e.update(e)
      end
    end
  end
end

function _draw()
    cls()
    if cutscene_1_active == true then 
      draw_cutscene_1(cutscene_1)
    else
    for e in all (entities) do
        if e.draw then
            e.draw(e)
          end
        end
    end
end

function draw_intro()
  local c = (counter * 20) % 14 + 2
  print("!!WELCOME!!", 40, 0, c)
  local r = 40
  
  shot = create_shot()local cx = 64
  local cy = 64
  local c = 0
  for phi = 0, 1.0, 0.025 do
      local rx = r*cos(0.5*counter)
      local ry = r*sin(0.5*counter)
      local x = cos(phi + counter)
      local y = sin(phi + counter)
      pset(rx*x+cx, ry*y+cy, c + 2)
      c = (c + 1) % 14
  end
end

function _init()
  title =  create_title_screen()
  intro = create_cutscene_1()
  counter = 0;
  player = create_player()
  player.animation_delay = 0.125
  level_1 = create_level_1()
  start_scene(title)
end

function _update()
  current_scene.update(current_scene)
  if current_scene.has_ended then
    start_scene(level_1)
  end
end

function _draw()
  cls()
   -- circfill(64,64,32,3)
    current_scene.draw(current_scene)
end


--[[
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
--]]

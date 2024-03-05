function _init()
  intro = create_cutscene_1()
  counter = 0;
  player = create_player()
  level = scene_new()
  scene_add_entity(level, create_starfield())
  scene_add_entity(level, player)
  --sfx(0)
  current_scene = intro
end

function _update()
  current_scene.update(current_scene)
end

function _draw()
    cls()
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

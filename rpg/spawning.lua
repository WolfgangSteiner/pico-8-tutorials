function spawn_all_slimes()
    local positions = {{12,59}}

    for p in all(positions) do
        add(entities,create_slime(p[1],p[2]))
    end
end

function spawn_all_npcs()
    add(entities,create_npc(15,39,{33,34},"please help us,\nthere are strange voices\ncoming out of the cave\nnorth of our village!"))
    add(entities,create_npc(14,48,{27,28},"welcome to oakville!"))
    add(entities,create_npc(5,44,{31,32},"walk into a monster\nto attack it"))
    add(entities,create_npc(9,39,{52,53},"you can pass a turn\n by pressing\151"))
    add(entities,create_npc(17,12,{54},"warning!\ndanger ahead!"))
end

function spawn_all_shooters()
  --  local positions_up = {{71,51}}
   -- local positions_down = {{11,53},{74,46},{71,46},{66,40},{71,30}}
    --local positions_left = {}
    --local positions_right = {}

    add(entities,create_shooter(11,53,"down",{55,56}))
    add(entities,create_shooter(74,46,"down",{55,56}))
    add(entities,create_shooter(71,46,"down",{55,56}))
    add(entities,create_shooter(66,40,"down",{55,56}))
    add(entities,create_shooter(71,30,"down",{55,56}))
    add(entities,create_shooter(71,51,"up",{55,56}))
end


function create_npc(x,y,frames,message)
 local npc = {}
 npc.m_p = vec2(x,y) 
 npc.sprite = sprite_new(vec2(0,0),frames)
 npc.message = message
 npc.type = "npc"
 npc.show_message = false
 npc.draw = draw_npc
 npc.update = update_npc
 npc.move = npc_make_move
 return npc
end

function update_npc(npc)
    local d = vec2_dist(npc.m_p,player.m_p)
    if npc.show_message == false and d < 2 then
        sfx(3)
    end
    npc.show_message = (d < 2) 
end

function draw_npc(npc)
    npc.sprite.draw(npc.sprite)
    if npc.show_message == true then
        speech_bubble(npc.message,npc.sprite.p.x + 3,npc.sprite.p.y - 1)
    end
end

function npc_make_move(e)
end


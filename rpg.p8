pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
#include rpg/main.lua
#include rpg/player.lua
#include common/common.lua
#include rpg/npc.lua
#include rpg/rpg_common.lua
#include rpg/monsters.lua
__gfx__
000000000444000000444000000440000004400004440000d666d66d6ff6fff611115111000000000000000033335333353358833999999333335333cccccccc
000000000fff000000fff000000ff000000ff0000fff0000d666d66df6ff6fff115111510000000000bbbb0033533353599588889999999935333333cccccccc
007007000ddd600000ddd000000dd0000006d0006ddd0000ddddddd6fff6ff6f5111111500bbbb000bbbbbb053333335999988889999999933388883cccccccc
0007700044dd6000044dd000000d40000006d0006ddd400066dd66d66fffffff111511110bbbbbb00b9bb9b033353333999988889999999933888888cccccccc
0007700044dd5000044dd566000d40000005d0005ddd400066d666d6ffff6ff6511115110b9bb9b00bbbbbb053333533999954439999999933888888cccccccc
007007000ddd000000ddd000000dd000000dd0000ddd0000ddddddddf6f6ffff111151150bbbbbb00bbbbbb033335335344334439999999953888888cccccccc
000000000ddd000000ddd000000dd000000dd0000ddd000066d666d6ffffff6f151111110bbbbbb00000000035333333344353359999999933888888cccccccc
0000000000000000000000000000000000000000000000006ddddd6d6ff6ff6f11511515000000000000000033533535553333539999999933888888cccccccc
cccccccccccccccc35383353555555555358888888888535888888884f44f4f44f44f4f444444444003333330000000000099000999999993588888800000000
ccccccccacccccac33888335444444443388888888888833888888884f44f4f44f44f4f4455555540000333300099000000ff000999999993388888800055000
cccbbbccaccaccac38898833555555553555555555555553555555554f44f4f44f44f4f445c5cc5430000300000ff00000888800334444333334444300044000
ccb28bcc3acacc3a33888333444444448888888888888888888888884f44f4f44f44555445c5cc54330000000088880000f88f00334444333334444300222200
ccb82bcc3ac3cc3a53383533444444448888888888888888888888884f44f4f44f445454455555543330330000f88f0000044000534444353534444500422400
ccbbbbcc33c3cc33333b3353555555555555555555555555555555554f44f4f44f44555445c5cc543000003300044000000440003344443333344443000cc000
ccbbbccc33c3cc333bbbbb33444444448888888888888888888888884f44f4f44f44f4f4455555543330333300044000000440003344443333344443000cc000
cccccccc33c3cc3335bbb335555555558888888888888888888888884f44f4f44f44f4f444444444333033330000000000000000334444333533335300000000
0005500000055008800550005ddd665d560000565d65666d53dd3653000000000000000053353353000000000000000000000000000000000000000000000000
000440008055550880555508dd5d66d5d0000005d55d66d6dd3d36350000000000cccc0033335335000000000000000000000000000000000000000000000000
00222200800ff000000ff008d6655ddd0000000055656dd6333553d300cccc000cccccc035354444000000000000000000000000000000000000000000000000
00422400007777088077770066655dd5000000006d656dd666333d330cccccc00c9cc9c044444444000000000000000000000000000000000000000000000000
000cc00080f770f000f770f856d655d60000000065d655d653d633360c9cc9c00cccccc044443ff3000000000000000000000000000000000000000000000000
000cc0000005504000055040665665660000000056566566635663630cccccc00cccccc03ff33ff5000000000000000000000000000000000000000000000000
000cc000000550400005504066566d66000000005d566d6636563d660cccccc0000000005ff53ff3000000000000000000000000000000000000000000000000
000000000000000000000000ddd5dd660000000055d5dd66dd33d36300000000000000003ff35335000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e1c0c0c0c0c0c0c0c0b0b0b0707070b0b0b0a1b0b0b0b0b092b0c0c0d0e0c0c0c0c0c0c0c0c0c0c0c0c0d1e1c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
c01111c0d0e0c0c0b0b0b0b070b0b0b04161616151b0b0b0b0c0c0c0d1e1c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
c01111c0d1e1c0b0b0b0b07070b0b041616161616151b0b0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d0e0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
c0c0c0c0c0c0c0b0b0b0b07070b0b031313191313131b0c092c0c0c0c0c0c0c0c0c0c0c0c0c0d1e1c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
d0e0c0c0c0c0b0b0b0b0b07070b0b031913131319131c0c0c0c0c0c0c0c0d0e0c0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
d1e1c0c0b0b0b0b0b0b0b07070b0b031313131313131c0c0c021c0c0c0c0d1e1c0c0c0d0e0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
c0c0c0b0b0b0b0b0b0b0b07070b0b031318131313131c0c0c0c0c0c0c0c0c0c0c0c0c0d1e1c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
c0c0b0b0b0b0b0b0b0b0b07070b0b0b0b070b0b0b0b0c092c0c02192c0c0c0c0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
c0b0b0b0b0b0b0b0b0b0b070707070707070b0b0b0b0c0c0c0c0c0c0c0c0c0c0d0e0c0d0e0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
b0b0b0b0b0b0b0b0b0b0b07070b0b0b0b0b0b0b0b0b0c0d0e0d0e0c01111c0c0d1e1c0d1e1c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
41616151b0b0b0b0b0b0b07070b0b0b0b0b0b0b0b0b0c0d1e1d1e1c01111c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
31913131b0b0b0b0b0b0b07070b0b0b0b0b0b0b0b0b0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
31318131b0b0b0b0b0b0b07070b0b0b0b0b0b0b0b0b0c0c0c0c0c0c0c0c0d0e0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
c0c07070707070b0b0b0b07070b0b0b0b0b0b0b0b0b0c0c0c0c0c0c0c0c0d1e1c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
d0e0c0c0d0e070707070b07070b0b0b041616151b0d0e0c0c0c0c0c0d0e0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
d1e1c0c0d1e1c0c0b070707070b0b0b031319131b0d1e1c0d0e0c0c0d1e1b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
111101d0e0c0c0c0b0b0b07070b0b0b031813131b0b0c0c0d1e1c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
011111d1e1c0c0c0b0b0b07070b0b0b0b07021b0b0b0d0e0c0c0d0e0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
111101c0c0c0c0c0c0c0b070707070707070b0b0b0b0d1e1c0c0d1e1c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
c0d0e0c0c0d0e0c021c0b07070b0b0b0b0b0b0b0b021b0c0c0c0c0c0d0e0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
c0d1e1c0c0d1e1c0c0b0b07070b0b0b021b0b0b0b0c0c0d0e0c0c0c0d1e1b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0
b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b080808080808080808080808080808080808080808080808080808080808080808080808080808080
c0c0c0c0c0c0c0c0c0c0b07070b0b0b0b0b0b0c0c0c0c0d1e1c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b000000000000000000000000000000000000000000000
00000000008080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
d0e0c0d0e0c0c0c0c0b0b07070b0b0c0c0c0c0d0e0c0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b000000000000000000000000000000000000000000000
00000000008080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
d1e1c0d1e1d0e0c0b0b0b07070b0d0e0c0c0c0d1e1c0c0d0e0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b000000000000000000000000000000000000000000000
00000000008080808080808080808080808080808080808080808080806060606060606060606060606060606080808080808080808080808080808080808080
c0c0c0c0c0d1e1c0b0b0b07070b0d1e101111111c0c0c0d1e1c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b000000000000000000000000000000000000000000000
00000000008080808080808080808080808080808080808080808080806060606060606060606060606060606080808080808080808080808080808080808080
d0e0c0c0c0c0b021b0b0b07070b0c011f0f0011111c0c0c0c0c0c0d0e0c0b0b0b0b0b0b0b0b0b0b0b0b000000000000000000000000000000000000000000000
00000000008080808080808080808080808080808080808080808080806060606080808080808080808060606080808080808080808080808080808080808080
d1e1c0c0c0d0e0b0b021b07070b011f001f0f0f01111d0e0c0c0c0d1e1c0b0b0b0b0b0b0b0b0b0b0b0b000000000000000000000000000000000000000000000
00000000008080808080808080808080808080808080808080808080806060606080808080808080808060606080808080808080808080808080808080808080
d0e0c0d0e0d1e1b0b0b0b07070b001f0f0f0f0f0f011d1e1c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b000000000000000000000000000000000000000000000
00000000008080808080808080808080808080808080808080808080806060606080808080908080808060606080808080808080808080808080808080808080
d1e1c0d1e1c0c0b0b0b0b07070b0f0f001f0f001f001c0c0d0e0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b000000000000000000000000000000000000000000000
00000000008080808080808080808080808080808080808080808080806060606080808080808080808060606080808080808080808080808080808080808080
c0c0c0c0c0c0c0b0b0b0b07070b0b011f0f011111111d0e0d1e1c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b000000000000000000000000000000000000000000000
00000000008080808080808080808080808080808080808080808080806060606080808080808080808060606080808080808080808080808080808080808080
b0b0b0b0b0b021b0b0b0b07070b0c0c0c0d0e0c0c0c0d1e1c0c0c0d0e0c0b0b0b0b0b0b0b0b0b0b0b0b000000000000000000000000000000000000000000000
00000000008080808080808080808080808080808080808080808080806060606060606060806060606060606080808080808080808080808080808080808080
70707070707070707070707070c0c0c0c0d1e1c0c0c0c0c0c0c0c0d1e1c0b0b0b0b0b0b0b0b0b0b0b0b000000000000000000000000000000000000000000000
00000000008080808080808080808080808080808080808080808080806060606060606060806060606060606080808080808080808080808080808080808080
__gff__
0000000000000001010000010000000000000100000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000000b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0b0b0b0b0b0b0b262525262523252325252325252625230b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0b0b0b0b0b232323232323232323232323232623232323232323230b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0b2323232325232323232525262623262523232323232323232323230b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
23232323232523262523232323252325232325232323232623232523230b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
23232525232323232325262323252323232623232323232623232523230b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
2326262323252323252525252326232523252326232326252323232323230b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
2323232323232325252323232326232326232326232323232323252323230b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
2323232323232623232625252323252323232323232323232323232323230b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
232323232323232323262325232323242323230c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0d0e0c0c0c0d0e232323232323230c070c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
1d1e0c0c0c1d1e0c0c0d0e0c0c0c0c070c0c0c0c0c0c0c0d0e0c0c0c0c0c0c0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0c0c0d0e0c0c0c0c0c1d1e0c0c0c0b070c0c0c0c0c0c0c1d1e0c0c0c0c0c0d0e0c0c0c0d0e0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0c0c1d1e0c0c0c0c0c0c0c0c0c0c0b070b0c0c0c0c0c0c0c0c0c0c0c0c0c1d1e0c0c0c1d1e0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0c0c0c0c0c0c0c0c0c0d0e0c0c0b07070b0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d0e0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0d0e0c0c0c0d0e0c0c1d1e0c0c0b070b0b0b0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c1d1e0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
1d1e0c0c0c1d1e0c0c0c0c0c0c0b07070b0b0c0c0c0d0e0c0c0c0c0d0e0c0c0c0c0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0c0c0c0c0f110c0c0c0c0c0c0c0b0b070b0b0c0c0c1d1e0c0c0c0c1d1e0c0c0c0c0c0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0d0e0c0b1211100c0c0d0e0c0b0b07070b0b0c0c0c0c0c0c0c0c0d0e0c0c0c0c0c0c0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
1d1e0c120b11110c0c1d1e0c0b0b070b0b0c0c0c0c0c0c0c0d0e1d1e0c0c0c110c0d0e0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0c0c0c0c0b120c0c0c0c0c0c0b0b070b290c0c0c0c0c0c0c1d1e0c0c0c0c0c0c0c1d1e0c0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0c0c0c0d0e0c0c0c0c0c0c290b0b070b0b0c0c0c0c0c0c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0d0e0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0c0c0c1d1e0c0c0c0c0d0e0c0b07070b0b0c0c0c0d0e0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c1d1e0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0c0c0c0c0c0c0c0c0c1d1e0c0b070b0b0b0c0c0c1d1e0c0c0c0c0c0d0e0d0e0c0c110c0c0c0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0d0e0c0c0c0d0e0c0c0c0c0c0b07070b0b0c0c0c0c0c0c0c0c0c0c1d1e1d1e0c0c0c0c0d0e0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
1d1e0c0c0c1d1e0c0c0c0c0c0b0b070b0b0b0b0b0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c1d1e0c0c0c0c0c0d0e0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0c0c0c0d0e0d0e0d0e0c0c0b0b0b070b0b0b0b0b0b0b0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c1d1e0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0c0c0c1d1e1d1e1d1e0c0c290b0b070b0b0b0b0b0b0b0b0c0c0c0c0c0c0c0d0e0c0c0c0c0c0c0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0e0d0e0d0e0c0c0c0c0c0c0b0b0b070b0b0b0b0b0b0b290b0c0c0c0c0c0c1d1e0c0c0c0c0c0c0c0c0c0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
1e1d1e1d1e0c0c0c0c290c0b0b0b070b0b0b0b0b0b0b0b0b0b0c0c0c0c0c0c0c0c0c0d0e0c0c0c0d0e0c0c0c0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b000000000000
0e0c0c0c0c0c0c0c0c0c0b0b0b07070b0b0b0b0b0b0b0b0b0b290c0c0c0c0c0c0c0c1d1e0c0c0c1d1e0c0d0e0c0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b00000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000000000000022200000001f670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000200000000000000000f5000f55000000000000c5000c55000000000000f5000f5500000000000000000c5000000000000000000e5500000000000000000b55000000000000e5000e550000000000000000
001000172322023220242202422024220232202122021220232202422024220232202122021220242202922029220242202322021220212202122023220242002520024200232002320022200222002320024200
001000001900000000150000900016150171001715015100151501500013000180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000200000000000000000f5002015000000000000c5001d15000000000000f500201500000000000000000c5000000000000000001f1500000000000000001b15000000000000e5001d150000000000000000
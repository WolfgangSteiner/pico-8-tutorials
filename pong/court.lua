function create_court() 
    local court = {}
    court.color = 8
    court.w = 128
    court.h = 128
    court.t = 1
    return court
end 

function draw_court(court)
    rectfill(0, 0, court.w-1, court.t - 1, court.color)
    rectfill (court.w - court.t, 0, court.w-1, court.h, court.color)
    rectfill(0, court.h - court.t, court.w-1, court.h,  court.color)

end
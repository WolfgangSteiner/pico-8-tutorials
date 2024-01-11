function rectfill_centered(x, y, w, h, c)
    local x0 = x - w\2
    local y0 = y - h\2
    local x1 = x + w\2
    local y1 = y + h\2
    rectfill(x0, y0, x1, y1, c)
end
function create_starfield()
    local starfield = {}
   starfield.stars = {}
   starfield.update = update_starfield
   starfield.draw = draw_starfield
   for i = 1,15 do
        add(starfield.stars,create_star())
   end
   return starfield 
end

function update_starfield(starfield)
    for star in all (starfield.stars) do
        star.p.y = star.p.y + star.vel
        if star.p.y >= 128 then 
            star.p.x = rnd(128)
            star.p.y = 0
            star.color = random_star_color()
        end
    end

end

function draw_starfield(starfield)
    for star in all (starfield.stars) do
        if star.color == 11 then
            circfill(star.p.x,star.p.y,1,star.color) 
        else
            pset(star.p.x,star.p.y,star.color)
        end
    end
end


function create_star()
star = {}
star.p = vec2(rnd(127),rnd(127))
star.color = random_star_color()
star.vel = rnd({1,2,3})
return star
end

function random_star_color()
   return rnd({9,10,7,15,11})
end
local width = love.graphics.getWidth()
local height = love.graphics.getHeight()

lst_cross = {}
lst_circle = {}

function grid()
    love.graphics.setColor(love.math.colorFromBytes(255,0,0))
    love.graphics.setLineWidth(3)
    -- lignes veticales
    for x=0,3 do
        love.graphics.line((x*width/3),0,(x*width/3), height )
    end
    -- lignes horizontales
    for y=0,3 do
        love.graphics.line(0,(y*height/3),width,(y*height/3))
    end
    love.graphics.setColor(love.math.colorFromBytes(255,255,255))
end

function love.load()
    cursor = love.mouse.newCursor("img/Goku.png", 0, 0)
    cross = love.graphics.newImage("img/cross.png")
    circle = love.graphics.newImage("img/circle.jpg")
end

function love.update(dt)
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()
end


function love.draw()
    grid()

    for x=0,3 do
        for y=0,3 do
            if mouseX >= (x * width/3) and mouseX < ((x+1) * width/3) and  mouseY >= (y * height/3) and mouseY < ((y+1) * height/3) then
                if love.mouse.isDown(1) then
                    table.insert(lst_cross, {x=x*width/3, y=y*height/3})
                elseif love.mouse.isDown(2) then
                    table.insert(lst_circle, {x=x*width/3, y=y*height/3})
                end
            end
        end
    end
    
    -- dessine les images stockées dans la liste
    for i = 1, #lst_cross do
        local pos = lst_cross[i]
        love.graphics.draw(cross, pos.x, pos.y)
    end
    
    for i = 1, #lst_circle do
        local pos = lst_circle[i]
        love.graphics.draw(circle, pos.x, pos.y)
    end

end

----- Permet de relancer le jeu n'importe quand en appuyant sur la touche espace
function love.keypressed(k)
    if k == 'space' then
       love.event.quit("restart")
    end
 end

function love.mousepressed(x, y, button)
    
    if button == 1 or button == 2 then -- button 1 = clic gauche // button 2 = clic droit
        love.mouse.setCursor(cursor)
    end
end
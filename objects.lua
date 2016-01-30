

local anim8 = require 'lib/anim8'
local image , animation

clock = {}

image = love.graphics.newImage("assets/sprites/clock_anim.png")
local g = anim8.newGrid(64,128,image:getWidth(),image:getHeight())
animation = anim8.newAnimation(g('1-4',1),0.1)

function clock:add()
end


function clock:draw(x,y)
	animation:draw(image,x,y,0,1,1,image:getWidth()/2,image:getHeight()/2-32)
end


function clock:update(dt)
	animation:update(dt)
end









local anim8 = require 'lib/anim8'


enemy_blue = {}
enemy_blue.x = 0
enemy_blue.y = 0
enemy_blue.width = 0
enemy_blue.height = 0
enemy_blue.speed = 500
enemy_blue.friction = 7.5
enemy_blue.img = love.graphics.newImage("assets/sprites/GermBlueSheet.png")
enemy_blue.g = anim8.newGrid(64,64,enemy_blue.img:getWidth(),enemy_blue.img:getHeight())
enemy_blue.animation = anim8.newAnimation(enemy_blue.g('1-8',1),0.2)


enemy_green = {}
enemy_green.x = 0
enemy_green.y = 0
enemy_green.width = 0
enemy_green.height = 0
enemy_green.speed = 500
enemy_green.friction = 7.5
enemy_green.img = love.graphics.newImage("assets/sprites/GermGreenSheet.png")
enemy_green.g = anim8.newGrid(64,64,enemy_green.img:getWidth(),enemy_green.img:getHeight())
enemy_green.animation = anim8.newAnimation(enemy_green.g('1-8',1),0.2)


enemy_orange = {}
enemy_orange.x = 0
enemy_orange.y = 0
enemy_orange.width = 0
enemy_orange.height = 0
enemy_orange.speed = 500
enemy_orange.friction = 7.5
enemy_orange.img = love.graphics.newImage("assets/sprites/GermOrangeSheet.png")
enemy_orange.g = anim8.newGrid(64,64,enemy_orange.img:getWidth(),enemy_orange.img:getHeight())
enemy_orange.animation = anim8.newAnimation(enemy_orange.g('1-8',1),0.2)


enemy_maggot = {}
enemy_maggot = {}
enemy_maggot.x = 0
enemy_maggot.y = 0
enemy_maggot.width = 0
enemy_maggot.height = 0
enemy_maggot.speed = 500
enemy_maggot.friction = 7.5
enemy_maggot.img = love.graphics.newImage("assets/sprites/MaggotSheet.png")
enemy_maggot.g = anim8.newGrid(64,28,enemy_maggot.img:getWidth(),enemy_maggot.img:getHeight())
enemy_maggot.animation = anim8.newAnimation(enemy_maggot.g('1-4',1),0.2)



enemy_goal = {}
enemy_goal.x = 0
enemy_goal.y = 0
enemy_goal.width = 0
enemy_goal.height = 0
enemy_goal.speed = 500
enemy_goal.friction = 7.5


function enemy_blue:load()

	--blue_germ = love.graphics.newImage("assets/Germs/Blue1.png")
end

function enemy_green:load()

	--green_germ = love.graphics.newImage("assets/Germs/Green1.png")
end

function enemy_orange:load()

	--orange_germ = love.graphics.newImage("assets/Germs/Orange1.png")
end

function enemy_goal:load()

    door = love.graphics.newImage("assets/door.jpg")
end

function enemy_blue:spawn(x,y,width,height)
	table.insert(enemy_blue, {x=x, y=y, health = 5,width = width, height=height})

end
function enemy_green:spawn(x,y,width,height)
	table.insert(enemy_green, {x=x, y=y, health = 5,width = width, height=height})

end
function enemy_orange:spawn(x,y,width,height)
	table.insert(enemy_orange, {x=x, y=y, health = 5,width = width, height=height})

end
function enemy_goal:spawn(x,y,width,height)
  table.insert(enemy_goal, {x=x, y=y, health = 5,width = width, height=height})

end
function enemy_maggot:spawn(x,y,width,height)
  table.insert(enemy_maggot, {x=x, y=y, health = 5,width = width, height=height})

end




function enemy_blue:draw()
	for i, v in ipairs(enemy_blue) do
		love.graphics.setColor(255,255,255,255)
		enemy_blue.animation:draw(enemy_blue.img,v.x,v.y,0,1,1,enemy_blue.width+32,enemy_blue.height+32)
	end
end

function enemy_green:draw()
	for i, v in ipairs(enemy_green) do
		love.graphics.setColor(255,255,255,255)
		--love.graphics.draw(green_germ,v.x,v.y,0,1,1,enemy_green.width+32,enemy_green.height+32)
    enemy_green.animation:draw(enemy_green.img,v.x,v.y,0,1,1,enemy_green.width+32,enemy_green.height+32)
	end
end


function enemy_orange:draw()
	for i, v in ipairs(enemy_orange) do
		love.graphics.setColor(255,255,255,255)
		--love.graphics.draw(orange_germ,v.x,v.y,0,1,1,enemy_orange.width+32,enemy_orange.height+32)
    enemy_orange.animation:draw(enemy_orange.img,v.x,v.y,0,1,1,enemy_orange.width+32,enemy_orange.height+32)
	end
end

function enemy_goal:draw()
  for i, v in ipairs(enemy_goal) do
    love.graphics.setColor(255,255,255,255)
    love.graphics.draw(door,v.x,v.y,0,1,1,enemy_goal.width+32,enemy_goal.height+32)
  end
end


function enemy_maggot:draw()
  for i, v in ipairs(enemy_maggot) do
    love.graphics.setColor(255,255,255,255)
    enemy_maggot.animation:draw(enemy_maggot.img,v.x,v.y,0,1.5,1.5,enemy_orange.width+32,enemy_orange.height+32)
end
end




function enemy_blue:update(dt)
 enemy_blue.animation:update(dt)
 enemy_green.animation:update(dt)
 enemy_orange.animation:update(dt)
 enemy_maggot.animation:update(dt)
end


function enemy_build()



   for i,v in ipairs(enemy_blue) do
    if v.x < p.x + p.width and
      p.x < v.x + enemy_blue.width and
      v.y < p.y + p.height and
      p.y < v.y + enemy_blue.height then
      sound_play(collect)
      table.remove(enemy_blue, i)
      SCORE = SCORE + 15
    end
  end

  for i,v in ipairs(enemy_green) do
    if v.x < p.x + p.width and
      p.x < v.x + enemy_green.width and
      v.y < p.y + p.height and
      p.y < v.y + enemy_green.height then
      sound_play(collect)
      table.remove(enemy_green, i)
      SCORE = SCORE + 15
    end
  end

  for i,v in ipairs(enemy_orange) do
    if v.x < p.x + p.width and
      p.x < v.x + enemy_orange.width and
      v.y < p.y + p.height and
      p.y < v.y + enemy_orange.height then
      sound_play(collect)
      table.remove(enemy_orange, i)
      SCORE = SCORE + 15
    end
  end

    for i,v in ipairs(enemy_goal) do
    if v.x < p.x + p.width and
      p.x < v.x + enemy_goal.width and
      v.y < p.y + p.height and
      p.y < v.y + enemy_goal.height then
      sound_play(goal)
      addlevel = true
      table.remove(enemy_goal, i)
      SCORE = SCORE + 15
    end
  end

   for i,v in ipairs(enemy_maggot) do
    if v.x < p.x + p.width and
      p.x < v.x + enemy_maggot.width and
      v.y < p.y + p.height and
      p.y < v.y + enemy_maggot.height then
      sound_play(collect3)
      table.remove(enemy_maggot, i)
      SCORE = SCORE + 50
    end
  end


end






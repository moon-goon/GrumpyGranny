require = "player"
enemy = {}
enemy.x = 0
enemy.y = 0
enemy.width = 15
enemy.height = 15
enemy.speed = 500
enemy.friction = 7.5

function enemy:spawn(x,y)
	table.insert(enemy, {x=x, y=y, health = 5,width = width, height=height})

end


function enemy:draw()
	for i, v in ipairs(enemy) do
		love.graphics.setColor(255,0,0)
		love.graphics.rectangle("fill",v.x,v.y,enemy.width,enemy.height)
	end
end


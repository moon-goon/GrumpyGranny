
load_manager = {}



function load_manager()

	title1 = love.graphics.newImage("assets/title1.png")
	title2 = love.graphics.newImage("assets/title2.png")
	title3 = love.graphics.newImage("assets/title3.png")
	title4 = love.graphics.newImage("assets/title4.png")
	title5 = love.graphics.newImage("assets/title5.jpg")


	fact1 = love.graphics.newImage("assets/gfacts/gfact1.png")




end

function load_display(image)

	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(image,300,camera.y)

end

function load_title(image)

	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(image,0,camera.y)

end




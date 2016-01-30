map = {}

function map:load()

	map.img = love.graphics.newImage("assets/background.psd")
	map.x = 0 
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	map.img2 = love.graphics.newImage("assets/bg1.jpg")
	map.x = 0
	map.y = -800
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	map.img3 = love.graphics.newImage("assets/bg2.jpg")
	map.x = 0
	map.y = -1600
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	map.top = love.graphics.newImage("assets/ceiling.jpg")
	map.x = 0
	map.y = -2000
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	map.wall_img = love.graphics.newImage("assets/walls.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	map.wall_img2 = love.graphics.newImage("assets/walls2.psd")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	--------------------- level 2 -----------------------------

	map.background_lv2 = love.graphics.newImage("assets/background2.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	map.wall_lv2 = love.graphics.newImage("assets/walls2.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	--------------------- level 3 -------------------------------

	map.background_lv3 = love.graphics.newImage("assets/background3.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	map.wall_lv3 = love.graphics.newImage("assets/walls3.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	--------------------- level 4 -------------------------------
	
	map.background_lv4 = love.graphics.newImage("assets/background4.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	map.wall_lv4 = love.graphics.newImage("assets/walls4.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	--------------------- level 5 -------------------------------
	
	map.background_lv5 = love.graphics.newImage("assets/background5.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	map.wall_lv5 = love.graphics.newImage("assets/walls5.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	--------------------- level 6 -------------------------------
	
	map.background_lv6 = love.graphics.newImage("assets/background5.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	map.wall_lv6 = love.graphics.newImage("assets/walls5.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	--------------------- level 7 -------------------------------
	
	map.background_lv7 = love.graphics.newImage("assets/background5.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	map.wall_lv7 = love.graphics.newImage("assets/walls5.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	--------------------- level 8 -------------------------------
	
	map.background_lv8 = love.graphics.newImage("assets/background5.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	map.wall_lv8= love.graphics.newImage("assets/walls5.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	--------------------- level 9 -------------------------------
	
	map.background_lv9 = love.graphics.newImage("assets/background5.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

	map.wall_lv9 = love.graphics.newImage("assets/walls5.png")
	map.x = 0
	map.y = 0
	map.width = map.img:getWidth()
	map.height = map.img:getHeight()

end 

function map:draw() 
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.img,0,0)
	love.graphics.draw(map.wall_img,0,0)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.img2,0,-800)
	love.graphics.draw(map.wall_img2,0,-800)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.img3,0,-1600)
	love.graphics.draw(map.wall_img2,0,-1600)
	---------------------------------------------------- lv2
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv2,0,-2400)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv2,0,-2400)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv2,0,-3200)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv2,0,-3200)
	---------------------------------------------------- lv3
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv3,0,-4000)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv3,0,-4000)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv3,0,-4800)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv3,0,-4800)
	---------------------------------------------------- lv4
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv4,0,-5600)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv4,0,-5600)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv4,0,-6400)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv4,0,-6400)
	---------------------------------------------------- lv5
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv5,0,-7200)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv5,0,-7200)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv5,0,-8000)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv5,0,-8000)
	---------------------------------------------------- lv6
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv5,0,-8800)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv5,0,-8800)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv5,0,-9600)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv5,0,-9600)
	---------------------------------------------------- lv7
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv5,0,-10400)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv5,0,-10400)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv5,0,-11200)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv5,0,-11200)
	---------------------------------------------------- lv8
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv5,0,-12000)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv5,0,-12000)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv5,0,-12800)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv5,0,-12800)
	---------------------------------------------------- lv9
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv5,0,-13600)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv5,0,-13600)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.background_lv5,0,-14400)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(map.wall_lv5,0,-14400)
	

end
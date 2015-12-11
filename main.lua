

function love.load(dt)
    debug = false;
    gravityFlag = true;
    g = love.graphics
    playerColor = {255,0,128}
    groundColor = {25,200,25}
    CLIMBING_ABILITY = 5
    dt = 0
    
    -- instantiate our player and set initial values
    require "player"
    require "platform"
    require "/camera/camera"
    require "enemies"


    p = player:new()

  
   -- cam = camera:new(p, -WIDTH/2, -WIDTH+WIDTH/2)    


    
    p.x = love.graphics:getWidth() /2
    --p.y = love.graphics:getHeight() - 200
    p.y = 100
    p.width = 25
    p.height = 40
    p.jumpSpeed = -800
    p.runSpeed = 500


    gravity = 1800
    
    ground = platform:new(0,760,600,20)
    block1 = platform:new(200, 150, 200, 20);
    block2 = platform:new(400, 250, 180, 20);
    block3 = platform:new(200, 400, 250, 20);
    block4 = platform:new(400, 550, 120, 20);
    block5 = platform:new(200, 700, 200, 20);

    block11 = platform:new(50, 0, 200, 20);
    block12 = platform:new(250, -150, 180, 20);
    block13 = platform:new(450, -300, 300, 20);
    block14 = platform:new(50, -450, 90, 20);
    block15 = platform:new(150, -600, 500, 20);
    block16 = platform:new(300, -750, 120, 20);
    block17 = platform:new(250, -900, 180, 20);
    block18 = platform:new(50, -1050, 90, 20);
    block19 = platform:new(100, -1200, 100, 20);
    block20 = platform:new(200, -1350, 240, 20);



  
    blocks = {}
    blocks[1] = ground





  

    timer = 1000
  


    --blocks[2] = block1
    --blocks[3] = block2
    --blocks[4] = block3
    --blocks[5] = block4
    --blocks[6] = block5

    --blocks[4] = platform:new(700, 350, 30, 150)
    --blocks[5] = platform:new(550, 320, 30, 150)
    --blocks[6] = platform:new(900, 300, 30, 150)
    --blocks[7] = platform:new(1100, 200, 30, 200)
    --blocks[8] = platform:new(1101, 400, 200, 20)
    --blocks[9] = platform:new(700, 350, 200, 20)

    
    for _,v in ipairs(blocks) do 
      v.current["above"] = 0
      v.current["below"] = 0
      v.current["left"] = 0
      v.current["right"] = 0
      v.last["above"] = 0
      v.last["below"] = 0
      v.last["left"] = 0
      v.last["right"] = 0
    end


end
 



function love.update(dt)

  

  if p.y > love.graphics.getWidth()/2 then
    camera.y = p.y - 500
  end

  
    timer = timer - dt
    
    if timer <= 999 then
      print (timer)
      blocks[2] = block5
    end
     if timer <= 998 then
      print (timer)
      blocks[3] = block4
    end
      if timer <= 997 then
      print (timer)
      blocks[4] = block3
      collect[1] = dust1

    end
      if timer <= 996 then
      print (timer)
      blocks[5] = block2
    end
      if timer <= 995 then
      print (timer)
      blocks[6] = block1
    end
      if timer <= 994 then
      print (timer)
      blocks[7] = block11
    end
      if timer <= 993 then
      print (timer)
      blocks[8] = block12
    end
      if timer <= 992 then
      print (timer)
      blocks[9] = block13
    end
      if timer <= 991 then
      print (timer)
      blocks[10] = block14
    end
      if timer <= 990 then
      print (timer)
      blocks[11] = block15
    end
      if timer <= 989 then
      print (timer)
      blocks[12] = block16
    end
      if timer <= 988 then
      print (timer)
      blocks[13] = block17
    end
      if timer <= 987 then
      print (timer)
      blocks[14] = block18
    end
      if timer <= 986 then
      print (timer)
      blocks[15] = block19
    end
      if timer <= 985 then
      print (timer)
      blocks[16] = block20
    end
  



    if love.keyboard.isDown("right") then
        p:moveRight()
       -- cam:movingRight()
    end
    if love.keyboard.isDown("left") then
        p:moveLeft()
      --  cam:movingLeft()
    end
  if debug then
    if not love.keyboard.isDown("z") then
     if love.keyboard.isDown("d") then
         p.x = p.x + 1
      end
      if love.keyboard.isDown("a") then
          p.x = p.x - 1
      end
      if love.keyboard.isDown("w") then
          p.y = p.y - 1
      end
      if love.keyboard.isDown("s") then
          p.y = p.y + 1
      end
    end
  end
  
  dt = dt
  
    -- if the x key is pressed...
    if love.keyboard.isDown("x") then
    -- make the player jump
        p:jump()

    end
 
    -- update the player's position
    p:update(dt, gravity)
   -- cam:update(dt)
 
    -- stop the player when they hit the borders
    p.collided = false;
    for _,v in ipairs(blocks) do 
      p:compareLocation(v, dt)
    end
end
 
function love.draw()
  --love.graphics.translate(cam.x, cam.y)
  camera:set()
  
  -- draw the player shape
  g.setColor(playerColor)
  p:draw();
  enemy:draw()
  
  -- draw the ground
  g.setColor(groundColor)
  for _,v in ipairs(blocks) do 
    v:draw()
  end
  
  -- debug information
  if (debug) then
    g.setColor(255, 255, 255)
    local isTrue = ""
    g.print("Player coordinates: ("..math.floor(p.x).." - "..math.floor(p.x+p.width)..", "..math.floor(p.y).." - "..math.floor(p.y+p.height)..")", -cam.x, -cam.y + 5)
    g.print("Current state: "..p.state, -cam.x, -cam.y + 20)
    g.print("Speeds: "..p.xSpeed..", "..p.ySpeed, -cam.x, -cam.y + 35)
  end  
  camera:unset()
end
 
function love.keyreleased(key)
  if key == "escape" then
    love.event.push("kill")   
  end
  if (key == "right") or (key == "left") then
    p.decelarating = true;
  end
  
  if (key == "`") then
    debug = not debug
  end
  if (key == "tab") then
    gravityFlag = not gravityFlag
  end
   if (key == "q") then
    p.x = 10 p.y = 10
  end
  
  -- debug movement
  if love.keyboard.isDown("z") then
    if key == "d" then
      p.x = p.x + 1
    end
    if key == "a" then
      p.x = p.x - 1
    end
    if key == "w" then
      p.y = p.y - 1
    end
    if key == "s" then
      p.y = p.y + 1
    end
  end    
end



function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2 + w2 and
  x2 < x1 + w1 and
  y1 < y2 + h2 and
  y2 < y1 + h1
end



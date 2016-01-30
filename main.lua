
require "map"
require "sound_manager"
require "load_manager"
require "objects"
require 'lib/anim8'


function love.load(dt)

    love.math.setRandomSeed(os.time())

    debug = false;
    gravityFlag = true;
    g = love.graphics
    playerColor = {255,0,128}
    groundColor = {25,200,25}
    CLIMBING_ABILITY = 5
    dt = 0
    SCORE = 0
    -- instantiate our player and set initial values
    require "player"
    require "platform"
    require "/camera/camera"
    require "enemies"

    gamestate = "start"
    addlevel = false
    gameover = false

    map:load()
    sound_manager()
    load_manager()
    enemy_blue:load()
    enemy_green:load()
    enemy_orange:load()
    enemy_goal:load()
    sound_play(title)

    p = player:new()

    img = love.graphics.newImage("assets/platform.psd")
    ground_img = love.graphics.newImage("assets/Floors/Floor1.png")
    controls_img = love.graphics.newImage("assets/controls.png")
    credits_img = love.graphics.newImage("assets/credits.png")
    title_img = love.graphics.newImage("assets/splashscreen.png")
    gameover_img = love.graphics.newImage("assets/gameover.png")
    gfact1_img = love.graphics.newImage("assets/gfacts/gfact1.png")
    gfact2_img = love.graphics.newImage("assets/gfacts/gfact2.png")
    gfact3_img = love.graphics.newImage("assets/gfacts/gfact3.png")
    gfact4_img = love.graphics.newImage("assets/gfacts/gfact4.png")
    gfact5_img = love.graphics.newImage("assets/gfacts/gfact5.png")
    gfact6_img = love.graphics.newImage("assets/gfacts/gfact6.png")
    gfact7_img = love.graphics.newImage("assets/gfacts/gfact7.png")
    gfact8_img = love.graphics.newImage("assets/gfacts/gfact8.png")
    gfact9_img = love.graphics.newImage("assets/gfacts/gfact9.png")
    theend = love.graphics.newImage("assets/theend.png")

    font = love.graphics.newFont("font/LuckiestGuy.ttf", 35)
    love.graphics.setFont(font)

    p.x = love.graphics:getWidth() /2
    p.y = 600
    p.width = 64
    p.height = 64
    p.jumpSpeed = -800
    p.runSpeed = 500


    gravity = 1800
  
    
    ground = platform:new(0,760,600,20)
    block1 = platform:new(200, 150, 128, 20);
    block2 = platform:new(400, 250, 128, 20);
    block3 = platform:new(200, 400, 128, 20);
    block4 = platform:new(400, 550, 128, 20);
    block5 = platform:new(100, 700, 128, 20);
    block11 = platform:new(50, 0, 128, 20);
    block12 = platform:new(250, -150, 128, 20);
    block13 = platform:new(450, -300, 128, 20);
    block14 = platform:new(50, -450, 128, 20);
    block15 = platform:new(150, -600, 128, 20);
    block16 = platform:new(300, -750, 128, 20);
    block17 = platform:new(250, -900, 128, 20);
    block18 = platform:new(50, -1050, 128, 20);
    block19 = platform:new(100, -1200, 128, 20);
    block20 = platform:new(200, -1350, 128, 20);

 -----------------level2--------------------
    block21 = platform:new(400, -1350, 128, 20);
    block22 = platform:new(150, -1500, 128, 20);
    block23 = platform:new(300, -1650, 128, 20);
    block24 = platform:new(400, -1800, 128, 20);
    block25 = platform:new(300, -1950, 128, 20);
    block26 = platform:new(450, -2100, 128, 20);
    block27 = platform:new(100, -2250, 128, 20);
    block28 = platform:new(450, -2400, 128, 20);
    block29 = platform:new(150, -2550, 128, 20);
    block30 = platform:new(390, -2700, 128, 20);
    block31 = platform:new(150, -2850, 128, 20);
    block32 = platform:new(275, -3000, 128, 20);
    block33 = platform:new(300, -3150, 128, 20);

    ---------------- level3 --------------------
    block34 = platform:new(105, -3300, 128, 20);
    block35 = platform:new(175, -3450, 128, 20);
    block36 = platform:new(200, -3600, 128, 20);
    block37 = platform:new(175, -3750, 128, 20);
    block38 = platform:new(200, -3900, 128, 20);
    block39 = platform:new(175, -4050, 128, 20);
    block40 = platform:new(200, -4200, 128, 20);
    block41 = platform:new(175, -4350, 128, 20);
    block42 = platform:new(200, -4500, 128, 20);
    block43 = platform:new(175, -4650, 128, 20);
    block44 = platform:new(450, -4800, 128, 20);
   ---------------- level4 ---------------------
    block45 = platform:new(175, -4950, 128, 20);
    block46 = platform:new(200, -5100, 128, 20);
    block47 = platform:new(450, -5250, 128, 20);
    block48 = platform:new(100, -5400, 128, 20);
    block49 = platform:new(400, -5550, 128, 20);
    block50 = platform:new(450, -5700, 128, 20);
    block51 = platform:new(175, -5850, 128, 20);
    block52 = platform:new(200, -6000, 128, 20);
    block53 = platform:new(450, -6150, 128, 20);
    block54 = platform:new(100, -6300, 128, 20);
    block55 = platform:new(400, -6450, 128, 20);
    block56 = platform:new(450, -6600, 128, 20);
    block57 = platform:new(175, -6750, 128, 20);
    block58 = platform:new(200, -6900, 128, 20);
    block59 = platform:new(450, -7050, 128, 20);
    -------------- level5 ----------------------
    block60 = platform:new(0, -7210, 128, 20);
    block61 = platform:new(130, -7210, 128, 20);
    block62 = platform:new(260, -7210, 128, 20);

  
    blocks = {}
    blocks[1] = ground

    enemies = {}

    timer = 1000


     


       randomN = math.random(20,500)
       randomX = math.random(50,500)
       randomY = math.random(600,-9000)

  
    
    for i = 1, 50 do
      enemies[randomN] = enemy_blue:spawn(math.random(50,550),math.random(550,-10000),15,15)
      enemies[randomN] = enemy_orange:spawn(math.random(50,550),math.random(550,-10000),15,15)
      enemies[randomN] = enemy_green:spawn(math.random(50,550),math.random(550,-10000),15,15)
    end




    
    enemies[10] = enemy_goal:spawn(250, -1425, 128, 20)
    enemies[11] = enemy_goal:spawn(335, -3075, 128, 20)
    enemies[12] = enemy_goal:spawn(520, -4875, 128, 20)
    enemies[13] = enemy_goal:spawn(130, -5475, 128, 20)

    enemies[14] = enemy_maggot:spawn(200,390, 128, 20)



  
    for _, i in ipairs(enemies) do
      i = 30
      i = i + 1
      enemies[i] = enemy_blue:spawn(math.random(40,500),math.random(600,-10000),15,15)
      enemies[i] = enemy_green:spawn(math.random(40,500),math.random(600,-10000),15,15)
      enemies[i] = enemy_orange:spawn(math.random(40,500),math.random(600,-10000),15,15)
    end


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

  timer = timer -1
 clock:update(dt)
  enemy_build()


  enemy_blue:update(dt)
 
  if p.x < 0 then p.x = 0 end
  if p.x > 600 then p.x = 600 end

 --- for i, enemy in ipairs(enemies) do
 ---   if CheckCollision(p.x,p.y,p.width,p.height,enemy.x,enemy.y,enemy.width,enemy.height) then
 ---     print("ddddddd")
 ---     table.remove(enemies, i)
 ---   end
 --- end

---for i,v in ipairs(enemies) do
---    if CheckCollision(player.x,player.y,player.width,player.height, v.x,v.y,v.width,v.height) then
---    
---      table.remove(enemy, i)
---    end
---  end
  

 -- if p.y < love.graphics.getHeight()/2  then
 --   camera.y = p.y - 400
 -- end


  if (p.y < love.graphics.getHeight()*.75) and ((p.ySpeed<0) or ((p.ySpeed>0) and (p.ySpeed<800)))and (timer < 998)then
      camera.y = p.y - 600
    else
      camera.y = (camera.y) 
  end

    
  if (p.y>camera.y+800) then
      gameover = true
      
  end


    
      blocks[2] = block5
      blocks[3] = block4
      blocks[4] = block3             
      blocks[5] = block2
      blocks[6] = block1
      blocks[7] = block11
      blocks[8] = block12
      blocks[9] = block13
      blocks[10] = block14
      blocks[11] = block15
      blocks[12] = block16
      blocks[13] = block17
      blocks[14] = block18
      blocks[15] = block19
      blocks[16] = block20


      if addlevel == true then
       blocks[17] = block21
       blocks[18] = block22
       blocks[19] = block23
       blocks[20] = block24
       blocks[21] = block25
       blocks[22] = block26
       blocks[23] = block27
       blocks[24] = block28
       blocks[25] = block29
       blocks[26] = block30
       blocks[27] = block31
       blocks[28] = block32
       blocks[29] = block33
     end



      if addlevel == true and (p.y > -5000) and (p.y < -2000)then
       blocks[30] = block34
       blocks[31] = block35
       blocks[32] = block36
       blocks[33] = block37
       blocks[34] = block38
       blocks[35] = block39
       blocks[36] = block40
       blocks[37] = block41
       blocks[38] = block42
       blocks[39] = block43
       blocks[40] = block44
       blocks[41] = block45
       blocks[42] = block46
       blocks[43] = block47
       blocks[44] = block48
      
    end
      if addlevel == true and (p.y > -5000) and (p.y < -4000)then
       blocks[45] = block49
       blocks[46] = block50
       blocks[47] = block51
       blocks[48] = block52
       blocks[49] = block53
       blocks[50] = block54
       blocks[51] = block55
       blocks[52] = block56
       blocks[53] = block57
       blocks[54] = block58
       blocks[55] = block59

       blocks[56] = block60
       blocks[57] = block61
       blocks[58] = block62
 

       
    end






    if love.keyboard.isDown("right") then
        p:moveRight()

       -- cam:movingRight()
    end
    if love.keyboard.isDown("left") then
        p:moveLeft()
      --  cam:movingLeft()
    end
        -- if the x key is pressed...
   -- if love.keyboard.isDown(" ") then
    -- make the player jump
    --    p:jump()

  --  end
    -- if the x key is pressed...
    if love.keyboard.isDown(" ") and (gameover==false)then
    -- make the player jump
        p:jump()
    end
    if love.keyboard.isDown(" ") and (gameover==true) then
        p.x = 580
        p.y = ground.y - 75
        camera.y = p.y -700
        SCORE = 0
       --- enemies[1] = enemy_blue:spawn(100,690,15,15)
       --- enemies[2] = enemy_blue:spawn(330,-1270,15,15)
       --- enemies[3] = enemy_blue:spawn(250,-870,15,15)

       --- enemies[4] = enemy_green:spawn(100,320,15,15)
       --- enemies[5] = enemy_green:spawn(230,-1620,15,15)
        ---enemies[6] = enemy_green:spawn(460,-320,15,15)


       --- enemies[7] = enemy_orange:spawn(400,220,15,15)
       --- enemies[8] = enemy_orange:spawn(130,-420,15,15)
       --- enemies[9] = enemy_orange:spawn(260,500,15,15)


       randomN = math.random(20,500)
       randomX = math.random(50,500)
       randomY = math.random(600,-9000)

  
    
    for i = 1, 50 do
      enemies[randomN] = enemy_blue:spawn(math.random(50,550),math.random(550,-10000),15,15)
      enemies[randomN] = enemy_orange:spawn(math.random(50,550),math.random(550,-10000),15,15)
      enemies[randomN] = enemy_green:spawn(math.random(50,550),math.random(550,-10000),15,15)
    end

      --enemies[i] = enemy_green:spawn(math.random(40,500),math.random(600,-10000),15,15)
      --enemies[i] = enemy_orange:spawn(math.random(40,500),math.random(600,-10000),15,15)

    
        enemies[10] = enemy_goal:spawn(250, -1425, 128, 20)
        gameover = false
    end










  dt = dt

  Timer = dt - 1

  
 
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


   if timer <= 1000 then
     load_title(title1)
   end
   if timer <= 700 then
    load_title(title2)
   end 
   if timer <= 500 then
    load_title(title3)
   end
   if timer <= 300 then
     load_title(title4)
   end
   if timer <= 100 then
     load_title(title5)
  end




  if gamestate == "play" then
      sound_stop(title)
      sound_play(bgm)
      camera:set()



  love.graphics.setColor(255,255,255,255)
  map:draw()
  
  love.graphics.setColor(255,255,255,255)
  love.graphics.draw(ground_img,0,750)
  -- draw the player shape

      clock:draw(230,-300)
      clock:draw(230,-700)
      clock:draw(430,-1300)
   
  g.setColor(playerColor)
  p:draw();
  enemy_blue:draw()
  enemy_green:draw()
  enemy_orange:draw()
  enemy_goal:draw()

  enemy_maggot:draw()

  
  -- draw the ground
  g.setColor(groundColor)
  g.setColor(255, 255, 255,255)
  for _,v in ipairs(blocks) do 
    v:draw()
  end

  love.graphics.setColor(255,255,0)
  love.graphics.print("Score :"..SCORE,love.graphics:getWidth()-200,camera.y)

  love.graphics.setColor(255,255,0)
  love.graphics.print("HIT 'C' for Control",love.graphics:getWidth()-360,680)

  love.graphics.setColor(255,255,0)
  love.graphics.print("HIT 'X' for Credits",love.graphics:getWidth()-360,-680)

  love.graphics.setColor(255,255,0)
  love.graphics.print("HIT 'M' for Main Screen",love.graphics:getWidth()-440,-80)



  if love.keyboard.isDown("c") or love.keyboard.isDown("C")then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(controls_img, 100, (camera.y + 150))
  end

  if love.keyboard.isDown("x") or love.keyboard.isDown("X")then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(credits_img, 100, camera.y+150)
  end

  if love.keyboard.isDown("m") or love.keyboard.isDown("M") then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(title_img,0,camera.y)
  end

if gameover == true then
  love.graphics.setColor(255,255,255)
  love.graphics.draw(gameover_img,100,camera.y+150)
  enemy_blue:draw()
  enemy_green:draw()
  enemy_orange:draw()
  enemy_goal:draw()
  end
  if (addlevel == true) and (p.y > -1600)then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(gfact1_img,100,camera.y+150)
    
  end
  if (addlevel == true) and (p.y < -1425) and (p.y >-3300)then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(gfact2_img,100,camera.y+150)
    
  end
  if (addlevel == true) and (p.y < -3300) and (p.y > -5400)then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(gfact3_img,100,camera.y+150)
    
  end
  if (addlevel == true) and (p.y < -4500) and (p.y > -6000)then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(gfact4_img,100,camera.y+150)
    
  end
  if (addlevel == true) and (p.y > -1600)then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(gfact5_img,100,camera.y+150)
    
  end
  if (addlevel == true) and (p.y > -1600)then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(gfact6_img,100,camera.y+150)
    
  end
  if (addlevel == true) and (p.y > -1600)then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(gfact7_img,100,camera.y+150)
    
  end
  if (addlevel == true) and (p.y > -1600)then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(gfact8_img,100,camera.y+150)
    
  end
  if (addlevel == true) and (p.y > -1600)then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(gfact9_img,100,camera.y+150)
    
  end
  if (addlevel == true) and (love.keyboard.isDown(" ")) then
      addlevel = false
    end

 if  (p.y <= -7274) then
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(theend,100,camera.y+150)
  end



    print(timer)


  camera:unset()
end

end

function love.keypressed(key)
  if (key == "q") or (key == "Q") then
    love.event.quit()
  end
end 



function love.keyreleased(key)

  if (key == "right") or (key == "left") then
    p.decelarating = true;
  end
 
  if timer < 100 then 
    if key == ("p") then
      gamestate = "play"
      sound_play(cough)
      timer = 0
    end
  end


  
end


function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2 + w2 and
  x2 < x1 + w1 and
  y1 < y2 + h2 and
  y2 < y1 + h1
end



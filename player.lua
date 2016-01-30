require ('main')

local anim8 = require 'lib/anim8'

player = {}
p_img = love.graphics.newImage("assets/GrannySprites/Stand1.png")
playerUp = love.graphics.newImage("assets/GrannySprites2/RightAirUp1.png")
playerDown = love.graphics.newImage("assets/GrannySprites2/RightAirDown1.png")

playerR = love.graphics.newImage("assets/sprites/GrannyWalkRight.png")
r = anim8.newGrid(64,64,playerR:getWidth(),playerR:getHeight())
animR = anim8.newAnimation(r('1-8',1),0.1)
playerL = love.graphics.newImage("assets/sprites/GrannyWalkLeft.png")
l = anim8.newGrid(64,64,playerR:getWidth(),playerR:getHeight())
animL = anim8.newAnimation(r('1-8',1),0.1)


playerState = "idle"
function player:new()
  local object = {
  x = 0,
  y = 0,
  accelaration = 50,
  xSpeedMax = 400,
  ySpeedMax = 800,
  width = 0,
  height = 0,
  xSpeed = 0,
  ySpeed = 0,
  state = "",
  jumpSpeed = 0,
  runSpeed = 0,
  canJump = false,
  onFloor = false,
  decelarating = false,
  collided = false,
  collidedLeft = false,
  colidedRight = false,
  notice = "blank";
  }
  setmetatable(object, { __index = player })
  return object
end
 
-- Movement functions
function player:jump()
  if self.canJump then
    self.ySpeed = self.jumpSpeed
    self.canJump = false
    self.onFloor = false;
  end
end
 
function player:moveRight()
  if self.xSpeed < self.xSpeedMax then self.xSpeed = self.xSpeed + self.accelaration end
  self.decelarating = false;


end
 
function player:moveLeft()
  if self.xSpeed > -self.xSpeedMax then self.xSpeed = self.xSpeed + -self.accelaration end
  self.decelarating = false;
end
 
function player:decelarate()
  if (self.xSpeed > 0) then self.xSpeed = self.xSpeed - self.accelaration end
  if (self.xSpeed < 0) then self.xSpeed = self.xSpeed + self.accelaration end
end
 
function player:hitFloor(maxY)
  self.y = maxY - self.height
  self.ySpeed = 0 
  self.canJump = true
  self.onFloor = true
end

function player:hitRoof(maxY)
  self.y = maxY
  self.ySpeed = 0
end

function player:hitWallLeft(maxX)
  self.collidedLeftWall = maxX
  self.x = maxX
  self.xSpeed = 0;
  self.collidedLeft = true;
end

function player:hitWallRight(maxX)
  self.collidedRightWall = maxX - self.width
  self.x = maxX - self.width
  self.xSpeed = 0;
  self.collidedRight = true;
end

function player:compareLocation(c, dt)
  c.last["above"] = c.current["above"]
  c.last["below"] = c.current["below"]
  c.last["left"] = c.current["left"]
  c.last["right"] = c.current["right"]
  c.current["above"] = 0
  c.current["below"] = 0
  c.current["left"] = 0
  c.current["right"] = 0
  
  if self:getBottomEdge() < c:getTopEdge() then c.current["above"] = 1 end -- we are above
  if self:getRightEdge() < c:getLeftEdge() then c.current["left"] = 1 end -- we are left
  if self:getLeftEdge() > c:getRightEdge() then c.current["right"] = 1 end -- we are right
  if self:getTopEdge() > c:getBottomEdge() then c.current["below"] = 1 end -- we are below
    
  -- -- -- -- -- -- -- -- -- -- -- 
  -- Top
  -- -- -- -- -- -- -- -- -- -- -- 
  if c.last["above"] == 1 and c.current["above"] == 0 and c.current["left"] == 0 and c.current["right"] == 0 then self:hitFloor(c:getTopEdge()) c.activatedTop = true end  
  if c.activatedTop == true then -- falling off
    if c.current["left"] == 1 and c.last["left"] == 0 then self.onFloor = false c.activatedTop = false end 
    if c.current["right"] == 1 and c.last["right"] == 0 then self.onFloor = false c.activatedTop = false end
  end
  
  -- -- -- -- -- -- -- -- -- -- -- 
  -- Bottom
  -- -- -- -- -- -- -- -- -- -- -- 
  if c.last["below"] == 1 and c.current["below"] == 0 and c.current["left"] == 0 and c.current["right"] == 0 then self:hitRoof(c:getBottomEdge()) end  
  
  -- -- -- -- -- -- -- -- -- -- -- 
  -- Left
  -- -- -- -- -- -- -- -- -- -- -- 
  if c.last["left"] == 1 and c.current["left"] == 0 and c.current["above"] == 0 and c.current["below"] == 0 then self:hitWallRight(c:getLeftEdge()) c.activatedLeft = true end
  if c.activatedLeft == true then -- for moving above or below the ray
    if c.current["above"] == 1 and c.last["above"] == 0 then self.collidedRight = false c.activatedLeft = false end
    if c.current["below"] == 1 and c.last["below"] == 0 then self.collidedRight = false c.activatedLeft = false end
  end
  
  -- -- -- -- -- -- -- -- -- -- -- 
  -- Right
  -- -- -- -- -- -- -- -- -- -- -- 
  if c.last["right"] == 1 and c.current["right"] == 0 and c.current["above"] == 0 and c.current["below"] == 0 then self:hitWallLeft(c:getRightEdge()) c.activatedRight = true end
  if c.activatedRight == true then -- for moving above or below the ray
    if c.current["above"] == 1 and c.last["above"] == 0 then self.collidedLeft = false c.activatedRight = false end
    if c.current["below"] == 1 and c.last["below"] == 0 then self.collidedLeft = false c.activatedRight = false end
  end
end
 
-- Update function
  function player:update(dt, gravity) 
  animR:update(dt)
  -- Left and right ray blocks
  if self.collidedRight == true and self.x + (self.xSpeed * dt) > self.collidedRightWall then self.xSpeed = 0 end
  if self.collidedLeft == true and self.x + (self.xSpeed * dt) < self.collidedLeftWall then self.xSpeed = 0 end
  
  -- Clamp X and Y speeds
  if self.ySpeed > self.ySpeedMax then self.ySpeed = self.ySpeedMax end
  if self.ySpeed < -self.ySpeedMax then self.ySpeed = -self.ySpeedMax end
    
  self.x = self.x + (self.xSpeed * dt)
  self.y = self.y + (self.ySpeed * dt)
    
  -- apply gravity
  if gravityFlag then
    if self.onFloor == false then
      self.ySpeed = self.ySpeed + (gravity * dt)
    end
  end

  -- slow down
  if (self.decelarating) then self:decelarate() end
 
  -- update the player's state
  self:updateState()
end

function player:draw(x,y,width,height)

   g.setColor(255,255,255,255)

  if (self.canJump) then
    g.draw(p_img, self.x, self.y,0,1,1, p_img:getWidth()/2,p_img:getHeight()/2-32)
  end

 if not (self.canJump) then
    g.draw(playerUp, self.x, self.y,0,1,1, p_img:getWidth()/2,p_img:getHeight()/2-32)  
 end

 -- g.draw(p_img, self.x, self.y,0,1,1, p_img:getWidth()/2,p_img:getHeight()/2-32)
  
    if love.keyboard.isDown("right") then
      --  animR:draw(playerR,self.x, self.y,0,1,1, p_img:getWidth()/2,p_img:getHeight()/2-32)

      end
    if love.keyboard.isDown("left") then
      --  animR:draw(playerL,self.x, self.y,0,1,1, p_img:getWidth()/2,p_img:getHeight()/2-32)
      end

      if self.ySpeed > 0 then
          self.state = "fall"
         g.draw(playerDown, self.x, self.y,0,1,1, p_img:getWidth()/2,p_img:getHeight()/2-32)
     end
       if self.xSpeed > 0 then
        self.state = "moveRight"
        animR:draw(playerR,self.x, self.y,0,1,1, p_img:getWidth()/2,p_img:getHeight()/2-32)
    elseif self.xSpeed < 0 then
        self.state = "moveLeft"
        animR:draw(playerL,self.x, self.y,0,1,1, p_img:getWidth()/2,p_img:getHeight()/2-32)
    else 
      self.state = "stand"
    end
 
end


function player:updateState()

  if not(self.canJump) then
    if self.ySpeed < 0 then
      self.state = "jump"
      sound_play(jump)
    elseif self.ySpeed > 0 then
      self.state = "fall"
      sound_play(falling)
    end
  else
    if self.xSpeed > 0 then
      self.state = "moveRight"
    elseif self.xSpeed < 0 then
      self.state = "moveLeft"
    else
      self.state = "stand"
    end
  end    
  if self.collidedLeft == true then
    self.state = self.state.."ing on left wall"
  end
  if self.collidedRight == true then
    self.state = self.state.."ing on right wall"
  end
end

function player:getRightEdge() 
 return self.x+self.width  
end

function player:getLeftEdge() 
 return self.x  
end

function player:getTopEdge() 
 return self.y  
end

function player:getBottomEdge() 
 return self.y + self.height  
end

camera = {}
 
-- Constructor
function camera:new(toFollow, rightOffset, leftOffset)
    -- define our parameters here
    local object = {
    x = toFollow.x,
    y = toFollow.y,
    obj = toFollow,
    offset = rightOffset,
    offsetInt = rightOffset,
    rightOffset = rightOffset,
    leftOffset = leftOffset,
    maxCamMoveSpeed = 6
    }
    setmetatable(object, { __index = camera })
    return object
end

function camera:update(dt)
  
  offsetDiff = self.offsetInt - self.offset;
  
  if offsetDiff > 1 or offsetDiff < -1 then
		if self.obj.xSpeed ~= 0 then
      self.offset = self.offset + offsetDiff * 2 * dt
    else
      self.offset = self.offset + offsetDiff * 1 * dt
    end
	else
		self.offset = self.offsetInt;
  end
  
  
  
  xDiff = -self.obj.x - self.x - self.offset;
  
  percentage = self.obj.xSpeed / self.obj.xSpeedMax
  if percentage < 0 then percentage = -percentage end
  percentage = percentage * self.maxCamMoveSpeed
  
  if xDiff > 1 or xDiff < -1 then
    if self.obj.xSpeed ~= 0 then
      self.x = self.x + xDiff * percentage * dt
    else
      self.x = self.x + xDiff * 2 * dt;
    end
	else
		self.x = -self.obj.x - self.offset;
  end

  self.y = 0
  
end

function camera:movingRight() 
  self.offsetInt = self.rightOffset
end



function camera:movingLeft()
  self.offsetInt = self.leftOffset
end
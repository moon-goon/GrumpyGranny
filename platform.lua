
platform = {}
 
-- Constructor

function platform:new(x, y, width, height)
    -- define our parameters here
    local object = {
    x = x,
    y = y,
    width = width,
    height = height,
    activatedTop = false,
    activatedBottom = false,
    activatedLeft = false,
    activatedRight = false,
    last = {},
    current = {}
    }
    setmetatable(object, { __index = platform })
    return object
end

function platform:draw()
  g.rectangle("fill", self.x, self.y, self.width, self.height)
  if debug then
    g.setColor(255,255,0)
    g.line(self:getRightEdge(), self.y - self.height, self:getRightEdge(), self.y + self.height * 2)
    g.line(self:getLeftEdge(), self.y - self.height, self:getLeftEdge(), self.y + self.height * 2)
    g.line(self.x - self.width, self:getTopEdge(), self.x + self.width * 2, self:getTopEdge())
    g.line(self.x - self.width, self:getBottomEdge(), self.x + self.width * 2, self:getBottomEdge())
    g.setColor(groundColor)
  end
end

function platform:getRightEdge() 
 return self.x+self.width  
end

function platform:getLeftEdge() 
 return self.x  
end

function platform:getTopEdge() 
 return self.y  
end

function platform:getBottomEdge() 
 return self.y + self.height  
end
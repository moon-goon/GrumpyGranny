
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

  g.draw(img, self.x, self.y,0,1,1, self.width-96, self.height/2)

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
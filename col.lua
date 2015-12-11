
function objectCollision()
	for i,v in ipairs(box) do
		if CheckCollision(player.x,player.y,player.width,player.height, v.x,v.y,v.width,v.height) then
			TEsound.play(boxHit, "objects")
			table.remove(box, i)
			boxCount = boxCount - 1
			player.lives = player.lives - 1
		end
	end
	for i,v in ipairs(heart) do
		if CheckCollision(player.x,player.y,player.width,player.height, v.x,v.y,v.width,v.height) then
			TEsound.play(heartPickup, "objects")
			table.remove(heart, i)
			heartCount = heartCount - 1
			player.score = player.score + 1
			player.extraLivesScore = player.extraLivesScore + 1
		end
	end
end


function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2 + w2 and
  x2 < x1 + w1 and
  y1 < y2 + h2 and
  y2 < y1 + h1
end
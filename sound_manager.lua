
sound_manager = {}



function sound_manager()
    falling = love.audio.newSource("sound/ohyea.ogg", "static")
	collect = love.audio.newSource("sound/echo.wav", "static")
	goal = love.audio.newSource("sound/Dreaming.mp3","static")
	jump = love.audio.newSource("sound/jump_04.wav","static")
	bgm = love.audio.newSource("sound/InGame.mp3","static")
	cough = love.audio.newSource("sound/cough.wav","static")
	collect2 = love.audio.newSource("sound/collect2.mp3")
	collect3 = love.audio.newSource("sound/collect3.wav","static")
	title = love.audio.newSource("sound/Title.mp3","static")

	jump:setVolume(0.7)
	bgm:setLooping(true)


end

function sound_play(sound)

sound:play(sound)

end

function sound_stop(sound)


  love.audio.stop(sound)

end





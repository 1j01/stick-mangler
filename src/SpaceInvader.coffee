
class @SpaceInvader
	frames: [
		[
			[0,0,1,0,0,0,0,0,1,0,0]
			[0,0,0,1,0,0,0,1,0,0,0]
			[0,0,1,1,1,1,1,1,1,0,0]
			[0,1,1,0,1,1,1,0,1,1,0]
			[1,1,1,1,1,1,1,1,1,1,1]
			[1,0,1,1,1,1,1,1,1,0,1]
			[1,0,1,0,0,0,0,0,1,0,1]
			[0,0,0,1,1,0,1,1,0,0,0]
		]
		[
			[0,0,1,0,0,0,0,0,1,0,0]
			[1,0,0,1,0,0,0,1,0,0,1]
			[1,0,1,1,1,1,1,1,1,0,1]
			[1,1,1,0,1,1,1,0,1,1,1]
			[0,1,1,1,1,1,1,1,1,1,0]
			[0,0,1,1,1,1,1,1,1,0,0]
			[0,0,1,0,0,0,0,0,1,0,0]
			[0,1,0,0,0,0,0,0,0,1,0]
		]
	]
	
	GS = 10
	l = 1/2/2/2
	m = 1-l
	
	constructor: ->
		@x = 0
		@y = 0
		@go = +1
		crap = []
		t = 0
		setInterval =>
			frame = @frames[t % @frames.length]
		
			destroy shit for shit in crap
			crap = []
			
			for row, yi in frame
				for space, xi in row
					if space
						crap.push new Solid([
							{x: @x+(xi+l)*GS, y: @y+(yi+m)*GS}
							{x: @x+(xi+l)*GS, y: @y+(yi+l)*GS}
							{x: @x+(xi+m)*GS, y: @y+(yi+l)*GS}
							{x: @x+(xi+m)*GS, y: @y+(yi+m)*GS}
						])
			
			t += 1
			@x += GS * @go
			(@go = -1; @y += GS) if @x + GS * @frames[0][0].length >= world.width
			(@go = +1; @y += GS) if @x <= 0
		, 500
		
		# @points =
		# 	for y in [0...invader.length]
		# 		for x in [0...invader.length]
		# 			null
		
		# for frame, z in invader
		# 	for row, y in frame
		# 		for space, x in row
		# 			if space
		# 				points[y+0]?[x+0] ?= new Point((x+0)*GS, (y+0)*GS)
		# 				points[y+1]?[x+0] ?= new Point((x+1)*GS, (y+0)*GS)
		# 				points[y+0]?[x+1] ?= new Point((x+0)*GS, (y+1)*GS)
		# 				points[y+1]?[x+1] ?= new Point((x+1)*GS, (y+1)*GS)

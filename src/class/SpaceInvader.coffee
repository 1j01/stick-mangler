
class @SpaceInvader
	M = yes
	_ = no
	frames: [
		[
			[_,_,M,_,_,_,_,_,M,_,_]
			[_,_,_,M,_,_,_,M,_,_,_]
			[_,_,M,M,M,M,M,M,M,_,_]
			[_,M,M,_,M,M,M,_,M,M,_]
			[M,M,M,M,M,M,M,M,M,M,M]
			[M,_,M,M,M,M,M,M,M,_,M]
			[M,_,M,_,_,_,_,_,M,_,M]
			[_,_,_,M,M,_,M,M,_,_,_]
		]
		[
			[_,_,M,_,_,_,_,_,M,_,_]
			[M,_,_,M,_,_,_,M,_,_,M]
			[M,_,M,M,M,M,M,M,M,_,M]
			[M,M,M,_,M,M,M,_,M,M,M]
			[_,M,M,M,M,M,M,M,M,M,_]
			[_,_,M,M,M,M,M,M,M,_,_]
			[_,_,M,_,_,_,_,_,M,_,_]
			[_,M,_,_,_,_,_,_,_,M,_]
		]
	]
	
	GS = 10
	l = 1/2/2/2
	m = 1-l
	
	constructor: ->
		@x = 0
		@y = 0
		@go = +1
		solids = []
		t = 0
		iid = setInterval =>
			clearInterval iid if window.CRASHED
			frame = @frames[t % @frames.length]
			
			destroy shit for shit in solids
			solids = []
			
			for row, yi in frame
				for space, xi in row
					if space
						solids.push new Solid [
							{x: @x+(xi+l)*GS, y: @y+(yi+m)*GS}
							{x: @x+(xi+l)*GS, y: @y+(yi+l)*GS}
							{x: @x+(xi+m)*GS, y: @y+(yi+l)*GS}
							{x: @x+(xi+m)*GS, y: @y+(yi+m)*GS}
						]
			
			t += 1
			@x += GS * @go
			(@go = -1; @y += GS) if @x + GS * @frames[0][0].length >= world.width
			(@go = +1; @y += GS) if @x <= 0
		, 500

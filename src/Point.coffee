
class @Point
	
	constructor: (@x, @y)->
		points.push @
		things.push @
		@vx = 0
		@vy = 0
		@fx = 0
		@fy = 0
		@gravity = 0.5
		@airfriction = 0.1
		@friction = 0.7
	
	update: ->
		@vx /= (@airfriction + 1)
		@vy += @gravity
		@x += @vx += @fx
		@y += @vy += @fy
		@fx = 0
		@fy = 0
		if @y > 200
			@vy = -abs(@vy)/5
			@y = 200
			@vx /= (@friction + 1)

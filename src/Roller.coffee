
class @Roller extends Actor
	EnemyClasses.push @
	
	constructor: (x, y, @sides, @radius)->
		super
		@sides ?= choose(4, 5, 6, 7, 8)
		@radius ?= choose(15, 20, 24)
		@wheel = new Wheel(x, y, @sides, @radius)
		@root = @wheel.root
		@root.gravity = -0.0001
	
	update: ->
		@wheel.motorize @controller.x
	
	destroy: ->
		if @sides is 4 and @radius/2 > 10
			for point in @wheel.outerpoints
				dir = atan2(point.y - @root.y, point.x - @root.x)
				spawn = new Roller(point.x, point.y, 4, @radius/2)
				for sp in spawn.points
					sp.vx += point.vx
					sp.vy += point.vy
	
	draw: ->
		ctx.beginPath()
		ctx.lineTo(p.x, p.y) for p in @wheel.outerpoints
		ctx.closePath()
		ctx.fill "rgba(0, 0, 0, 0.5)"
		ctx.stroke "white"


class @Constraint
	
	constructor: (@a, @b, @length, @force)->
		constraints.push @
		things.push @
		@length ?= distance(@a, @b)
		@force ?= 1
	
	update: ->
		dx = @a.x - @b.x
		dy = @a.y - @b.y
		d = Math.sqrt(dx*dx + dy*dy)
		f = @force / 100
		fx = dx * (@length - d) * f
		fy = dy * (@length - d) * f
		@a.fx += fx
		@a.fy += fy
		@b.fx -= fx
		@b.fy -= fy
	
	draw: ->
		ctx.strokeStyle = @color ? "rgba(255, 255, 255, 1)"
		ctx.beginPath()
		ctx.moveTo(@a.x, @a.y)
		ctx.lineTo(@b.x, @b.y)
		ctx.stroke()

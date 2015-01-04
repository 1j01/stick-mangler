
class @Constraint
	
	constructor: (@a, @b, options)->
		constraints.push @
		things.push @
		@length ?= options?.length ? distance(@a, @b)
		@force ?= options?.force ? 1
	
	update: ->
		dx = @a.x - @b.x
		dy = @a.y - @b.y
		d = Math.sqrt(dx*dx + dy*dy)
		divisor = if d < 1 then 1 else d
		f = @force / 10
		fx = dx/divisor * (@length - d) * f
		fy = dy/divisor * (@length - d) * f
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

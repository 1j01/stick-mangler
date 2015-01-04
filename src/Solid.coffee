
class @Solid extends Entity
	
	testingcanvas = document.createElement "canvas"
	testingctx = testingcanvas.getContext "2d"
	
	constructor: (@points)->
		things.push @
		solids.push @
	
	path: (ctx)->
		ctx.beginPath()
		ctx.lineTo(p.x, p.y) for p in @points
		ctx.closePath()
	
	collision: (x, y)->
		@path testingctx
		testingctx.isPointInPath(x, y)
	
	draw: ->
		@path ctx
		ctx.fill "rgba(255, 0, 155, 0.2)"
		ctx.stroke "rgba(255, 0, 155, 1)"

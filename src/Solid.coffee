
class @Solid
	
	testingcanvas = new Canvas
	testingctx = testingcanvas.ctx
	
	constructor: (@points)->
		things.push @
		solids.push @
	
	path: (ctx)->
		ctx.polygon(@points)
	
	collision: (x, y)->
		@path testingctx
		testingctx.isPointInPath(x, y)
	
	draw: ->
		@path ctx
		ctx.fill "rgba(255, 0, 155, 0.2)"
		ctx.stroke "rgba(255, 0, 155, 1)"

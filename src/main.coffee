
do animate = ->
	
	canvas.width = window.innerWidth if canvas.width isnt window.innerWidth
	canvas.height = window.innerHeight if canvas.height isnt window.innerHeight
	
	view.scale = min(
		canvas.width / world.width
		canvas.height / world.height
	)
	
	ctx.clearRect(0, 0, canvas.width, canvas.height)
	
	ctx.save()
	ctx.scale(view.scale, view.scale)
	
	ctx.lineCap = "round"
	
	thing.update?() for thing in things by -1
	thing.draw?() for thing in things by -1
	
	ctx.restore()
	
	console.log "animate?", things
	lkjlkj
	# requestAnimationFrame animate


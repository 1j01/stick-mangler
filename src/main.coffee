
new Humanoid(50, 50)
new Bird(450, 50)
new Roller(150, 60)
new Roller(250, 80)
new Roller(350, 70)
# new Roller(150, 60, 4, 24)
# new Roller(250, 80, 4, 34)
# new Roller(350, 70, 4, 24)
new Box(400, 100, 50, 50)
new Box(400, 100, 25, 50)
new Box(400, 100, 25, 25)

new Solid [
	{x: -5, y: 200}
	{x: 200, y: 200}
	{x: 450, y: 250}
	{x: 450, y: 300}
	{x: 400, y: 450}
	{x: 400, y: 500}
	{x: -5, y: 500}
]

@view = scale: 3

do animate = ->
	requestAnimationFrame animate unless window.CRASHED
	
	canvas.width = window.innerWidth if canvas.width isnt window.innerWidth
	canvas.height = window.innerHeight if canvas.height isnt window.innerHeight
	
	ctx.clearRect(0, 0, canvas.width, canvas.height)
	
	ctx.save()
	ctx.scale(view.scale, view.scale)
	
	thing.update?() for thing in things by -1
	thing.draw?() for thing in things by -1
	
	ctx.restore()



@things = []
@solids = []
@points = []
@constraints = []

@EnemyClasses = []
@PlayerClasses = []



@canvas = document.createElement "canvas"
@ctx = canvas.getContext("2d")
$(canvas).appendTo "body"

ctx.color = (r, g, b, a=1)->
	ctx.fillStyle = "rgba(#{r},#{g},#{b},#{a/5})"
	ctx.strokeStyle = "rgba(#{r},#{g},#{b},#{a})"

ctx.draw = (r, g, b, a=1)->
	ctx.color(r, g, b, a)
	ctx.fill()
	ctx.stroke()


{@abs, @pow, @sin, @cos, @atan2} = Math
@TAU = Math.PI * 2

@distance = (a, b, c, d)->
	if c? and d?
		x1 = a
		y1 = b
		x2 = c
		y2 = d
	else
		x1 = a.x
		y1 = a.y
		x2 = b.x
		y2 = b.y
	
	dx = x1 - x2
	dy = y1 - y2
	d = Math.sqrt(dx*dx + dy*dy)

@sign = (x)->
	if x > 0
		+1
	else if x < 0
		-1
	else
		0

@destroy = (thing)->
	thing?.destroy?()
	for array in [things, points, constraints]
		i = array.indexOf thing
		array.splice(i, 1) if i >= 0

@choose = (args...)->
	arr = if args.length > 1 then args else args[0]
	arr[~~(Math.random()*arr.length)]


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



@destroy = (thing)->
	thing?.destroy?()
	for array in [things, points, constraints]
		i = array.indexOf thing
		array.splice(i, 1) if i >= 0

@nearest = (Class, {from})->
	throw new Error 'unsupported' if Class isnt Point
	# This helper could be extended in the future to allow searching for
	# FixedPoints (currently just plain Objects) and even (types of) Actors
	# Currently it only looks in `points` and only checks the type at the top
	nearest = null
	nearestdistance = Infinity
	for point in points when distance(from, point) < nearestdistance
		nearest = point
		nearestdistance = distance(from, point)
	nearest

@choose = (args...)->
	arr = if args.length > 1 then args else args[0]
	arr[~~(Math.random()*arr.length)]


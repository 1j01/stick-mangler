
ctx.fill = (color)->
	ctx.fillStyle = color if color
	CanvasRenderingContext2D::fill.apply ctx, []

ctx.stroke = (color)->
	ctx.strokeStyle = color if color
	CanvasRenderingContext2D::stroke.apply ctx, []


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


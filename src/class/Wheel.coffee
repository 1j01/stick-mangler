
class @Wheel extends Entity
	constructor: (x, y, @sides, @radius)->
		super
		
		@root = @point 0, 0
		@outerpoints = for i in [1..@sides]
			point = @point(
				sin(TAU * i/sides)*@radius
				cos(TAU * i/sides)*@radius
			)
			@constrain(point, @root)
			point

		for point1 in @outerpoints
			for point2 in @outerpoints
				constraint = @constrain(point1, point2, force: 1)
				constraint.color = "gray"
	
	motorize: (x)->
		for point in @outerpoints
			dir = atan2(point.y - @root.y, point.x - @root.x)
			rotatedir = dir + TAU/4 * sign(x)
			point.vx += sin(rotatedir) * abs(x)
			point.vy += sin(rotatedir) * abs(x)

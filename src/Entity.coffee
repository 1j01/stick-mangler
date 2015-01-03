
class @Entity
	
	constructor: (x, y)->
		things.push @
		@points = []
		@constraints = []
	
	constrain: (a, b, length, force)->
		constraint = new Constraint(a, b, length, force)
		@constraints.push constraint
		constraint
	
	point: (x, y)->
		point = new Point(x, y)
		@points.push point
		point
	
	destroy: ->
		destroy point for point in @points
		destroy constraint for constraint in @constraints

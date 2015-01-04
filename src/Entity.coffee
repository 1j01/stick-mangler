
class @Entity
	
	constructor: (x, y)->
		things.push @
		@points = []
		@constraints = []
	
	constrain: (a, b, options)->
		constraint = new Constraint(a, b, options)
		@constraints.push constraint
		constraint
	
	point: (x=0, y=0)->
		point = new Point(x, y)
		@points.push point
		@root ?= point
		point
	
	destroy: ->
		destroy point for point in @points
		destroy constraint for constraint in @constraints

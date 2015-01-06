
class @Entity
	
	constructor: (@startx, @starty)->
		things.push @
		@points = []
		@constraints = []
	
	constrain: (a, b, options)->
		constraint = new Constraint(a, b, options)
		@constraints.push constraint
		constraint
	
	constrainangle: (a, b, c, options)->
		constraint = new AngularConstraint(a, b, c, options)
		@constraints.push constraint
		constraint
	
	point: (x=0, y=0)->
		point = new Point(@startx+x, @starty+y)
		@points.push point
		@root ?= point
		point
	
	destroy: ->
		destroy point for point in @points
		destroy constraint for constraint in @constraints

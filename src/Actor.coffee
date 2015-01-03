
class @Actor extends Entity
	
	constructor: (x, y)->
		super
		@startx = x
		@starty = y
		@controller = new DummyController @
	
	joint: (x, y, from, length, force)->
		joint = new Point(@startx+x, @starty+y)
		if from
			@constrain(joint, from, length, force)
		else
			@root = joint
		joint


class @Actor extends Entity
	
	constructor: (x, y)->
		super
		@controller = new DummyController @


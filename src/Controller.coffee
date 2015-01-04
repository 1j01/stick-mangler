
class @Controller
	constructor: (@actor)->
		things.push @
		@x = 0
		@jump = no

class @DummyController extends Controller
	constructor: ->
		super
		@x = choose(+1, -1)
		@jump = no
	
	update: ->
		@x = choose(+1, -1) if chance(0.005)
		@x = -1 if @actor.root.x > 400
		@x = +1 if @actor.root.x < 40
		@jump = no

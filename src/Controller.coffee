
class @Controller
	constructor: (@actor)->
		things.push @
		@x = 0
		@jump = no

class @DummyController extends Controller
	constructor: ->
		super
		@x = if Math.random() < 0.5 then +1 else -1
		@jump = no
	
	update: ->
		if Math.random() < 0.005
			@x = if Math.random() < 0.5 then +1 else -1
		@x = -1 if @actor.root.x > 400
		@x = +1 if @actor.root.x < 40
		@jump = no


@arraysofstuff = [
	@things = []
	@solids = []
	@points = []
	@constraints = []
]

@EnemyClasses = []
@PlayerClasses = []

@canvas = new Canvas
{@ctx} = canvas
$(canvas).appendTo "body"

@view = scale: 3

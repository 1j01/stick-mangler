
@things = []
@solids = []
@points = []
@constraints = []

@EnemyClasses = []
@PlayerClasses = []

@canvas = document.createElement "canvas"
@ctx = canvas.getContext("2d")
$(canvas).appendTo "body"

@view = scale: 3

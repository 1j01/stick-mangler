
dragging = null
constraint = null
mouse = x: 0, y: 0
update_mouse = (e)->
	mouse.x = e.clientX / view.scale
	mouse.y = e.clientY / view.scale

$(@).on 'mousemove', update_mouse

$(canvas).on 'mousedown', (e)->
	update_mouse e
	destroy constraint
	point = nearest Point, from: mouse
	if point
		dragging = point
		constraint = new Constraint(mouse, dragging)
		constraint.color = "red"
		constraint.draw = ->
			ctx.save()
			ctx.setLineDash? [5,5,2,2]
			ctx.line(@a, @b)
			ctx.stroke @color
			ctx.restore()

$(@).on 'mouseup', (e)->
	destroy constraint


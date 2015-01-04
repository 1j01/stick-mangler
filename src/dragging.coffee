
dragging = null
hold = null
mouse = x: 0, y: 0

$(@).on 'mousemove', (e)->
	mouse.x = e.clientX / view.scale
	mouse.y = e.clientY / view.scale

$(canvas).on 'mousedown', (e)->
	dragging = points[0]
	d = Infinity
	for point in points when distance(mouse, point) < d and point isnt mouse
		dragging = point
		d = distance(mouse, point)
	hold = new Constraint(dragging, mouse)

$(@).on 'mouseup', (e)->
	destroy hold


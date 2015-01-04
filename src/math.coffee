
{@abs, @pow, @sin, @cos, @atan2} = Math
@TAU = Math.PI * 2

@distance = (a, b, c, d)->
	if c? and d?
		x1 = a
		y1 = b
		x2 = c
		y2 = d
	else
		x1 = a.x
		y1 = a.y
		x2 = b.x
		y2 = b.y
	
	dx = x1 - x2
	dy = y1 - y2
	d = Math.sqrt(dx*dx + dy*dy)

@sign = (x)->
	if x > 0
		+1
	else if x < 0
		-1
	else
		0

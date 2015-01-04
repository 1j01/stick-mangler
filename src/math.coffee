
{@abs, @pow, @sin, @cos, @atan2, @sqrt, @min, @max, @PI} = Math
@TAU = PI * 2

@distance = (a, b, c, d)->
	if d?
		[x1, y1, x2, y2] = [a, b, c, d]
	else
		[x1, y1, x2, y2] = [a.x, a.y, b.x, b.y]
	
	dx = x1 - x2
	dy = y1 - y2
	d = sqrt(dx*dx + dy*dy)

@sign = (x)->
	if x > 0
		+1
	else if x < 0
		-1
	else
		0

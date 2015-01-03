
class @Bird extends Actor
	PlayerClasses.push @
	EnemyClasses.push @
	
	constructor: (x, y)->
		super
		@head = @joint(0, 0)
		@beak = @joint(0, 0, @head)
		@tail = @joint(0, 0, @head)
		@rknee = @joint(0, 0, @tail)
		@lknee = @joint(0, 0, @tail)
		@rfoot = @joint(0, 0, @rknee)
		@lfoot = @joint(0, 0, @lknee)
		@w = 0
	
	update: ->
		console.log @beak
		@head.vy -= 2
		@beak.vy -= 0.5
		
		@w -= 0.01 * @controller.x
		@beak.vx += 0.7 * @controller.x
		@beak.vy *= 0.8
		@lknee.vy -= 0.1
		@rknee.vy -= 0.1
		
		# animate legs
		@lknee.vx += sin(TAU*(@w+1/4))*0.5
		@lknee.vy += cos(TAU*(@w+1/4))
		@rknee.vx += sin(TAU*(@w-1/4))*0.5
		@rknee.vy += cos(TAU*(@w-1/4))
		
		@lfoot.vx += sin(TAU*(@w+1/4))*0.2
		@rfoot.vx += sin(TAU*(@w-1/4))*0.2
	
	draw: ->
		ctx.fillStyle = "black"
		ctx.strokeStyle = "white"
		
		ctx.beginPath()
		beakx = @beak.x+@controller.x*2
		if beakx > @head.x
			ctx.arc(@head.x, @head.y, 4, TAU*1/4, TAU*3/4, no)
		else
			ctx.arc(@head.x, @head.y, 4, TAU*1/4, TAU*3/4, yes)
		
		ctx.moveTo(@head.x, @head.y+4)
		ctx.lineTo(beakx, @beak.y)
		ctx.lineTo(@head.x, @head.y-4)
		ctx.fill()
		ctx.stroke()
		
		# ctx.beginPath()
		# ctx.ellipse(@head.x-2, @head.y-2, 4, 4, 0, TAU, 0)
		# ctx.fill()
		# ctx.stroke()
	

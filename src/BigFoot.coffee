
class @BigFoot extends Actor
	EnemyClasses.push @
	
	constructor: (x, y)->
		super(x, y)
		@neck = @joint(0, 0)
		@head = @joint(0, 0, @neck)
		@lelbo = @joint(0, 0, @neck)
		@lhand = @joint(0, 0, @lelbo)
		@relbo = @joint(0, 0, @neck)
		@rhand = @joint(0, 0, @relbo)
		@tail = @joint(0, 0, @neck)
		@rknee = @joint(0, 0, @tail)
		@lknee = @joint(0, 0, @tail)
		@rfoot = @joint(0, 0, @rknee, 4, 12)
		@lfoot = @joint(0, 0, @lknee, 4, 12)
		@w = 0
	
	update: ->
		@neck.vy -= 3
		@head.vy -= 0.5
		@lelbo.vy -= 0.5
		@relbo.vy -= 0.5
		
		@w -= 0.01 * @controller.x
		@neck.vx += 0.5 * @controller.x
		@lknee.vy -= 0.1
		@rknee.vy -= 0.1
		
		# animate legs
		@lknee.vx += sin(TAU*(@w+1/4))*0.5
		@lknee.vy += cos(TAU*(@w+1/4))
		@rknee.vx += sin(TAU*(@w-1/4))*0.5
		@rknee.vy += cos(TAU*(@w-1/4))
		
		@lfoot.vx += sin(TAU*(@w+1/4))*0.2
		#@lfoot.vy += cos(TAU*(@w+1/4))*0.5 if @lfoot.vy > -1
		@rfoot.vx += sin(TAU*(@w-1/4))*0.2
		#@rfoot.vy += cos(TAU*(@w-1/4))*0.5 if @rfoot.vy > -1
		
		# animate arms
		@lhand.vx += sin(TAU*(@w+2/4))*0.5
		@lhand.vy += cos(TAU*(@w+2/4))*0.5
		@rhand.vx += sin(TAU*(@w-0/4))*0.5
		@rhand.vy += cos(TAU*(@w-0/4))*0.5
		
		@lelbo.vx += sin(TAU*(@w-3/4))*0.2
		@lelbo.vy += cos(TAU*(@w-3/4))*0.2
		@relbo.vx += sin(TAU*(@w-1/4))*0.2
		@relbo.vy += cos(TAU*(@w-1/4))*0.2
	
	draw: ->
		ctx.beginPath()
		ctx.rect(@head.x-5, @head.y-5, 10, 5)
		ctx.fillStyle = "black"; ctx.fill()
		ctx.strokeStyle = "white"; ctx.stroke()
		#ctx.fillRect(@head.x-3, @head.y-5, 6, 6)

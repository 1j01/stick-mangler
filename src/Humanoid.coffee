
class @Humanoid extends Actor
	PlayerClasses.push @
	EnemyClasses.push @
	constructor: (x, y)->
		super
		@neck = @joint(0, 0)
		@head = @joint(0, 0, @neck, 0, 1)
		@lelbo = @joint(0, 0, @neck, 5, 1)
		@lhand = @joint(0, 0, @lelbo, 5, 1)
		@relbo = @joint(0, 0, @neck, 5, 1)
		@rhand = @joint(0, 0, @relbo, 5, 1)
		@tail = @joint(0, 0, @neck, 5, 1)
		@rknee = @joint(0, 0, @tail, 5, 1)
		@lknee = @joint(0, 0, @tail, 5, 1)
		@rfoot = @joint(0, 0, @rknee, 5, 1)
		@lfoot = @joint(0, 0, @lknee, 5, 1)
		@w = 0
	
	update: ->
		if @tail.vy < 3
			# anticombobulations
			@neck.vy *= 0.8
			@head.vy *= 0.9
		
			@neck.vy -= 3.3
			@head.vy -= 0.5
			@lelbo.vy -= 0.5
			@relbo.vy -= 0.5
		
		
		@w -= 0.01 * @controller.x
		@neck.vx += 0.5 * @controller.x
		@head.vx += 0.05 * @controller.x
		@lknee.vy -= 0.1
		@rknee.vy -= 0.1
		
		# Animate legs
		@lknee.vx += cos(TAU*(@w+1/4))*0.5
		@lknee.vy -= sin(TAU*(@w+1/4))*0.8
		@rknee.vx += cos(TAU*(@w-1/4))*0.5
		@rknee.vy -= sin(TAU*(@w-1/4))*0.8
		# @TODONT: bend knee backwards
		#@lfoot.vx -= sin(TAU*(@w-1/4))*0.5
		#@rfoot.vx -= sin(TAU*(@w+1/4))*0.5
		
		# Animate arms
		@lelbo.vx += sin(TAU*(@w-3/4))*0.3
		@lelbo.vy += sin(TAU*(@w-3/4))*0.2
		@relbo.vx += sin(TAU*(@w-1/4))*0.3
		@relbo.vy += sin(TAU*(@w-1/4))*0.2
		
		@lhand.vx += sin(TAU*(@w-3/4))*0.2
		#@lhand.vy += sin(TAU*(@w-3/4))*0.2
		@rhand.vx += sin(TAU*(@w-1/4))*0.2
		#@rhand.vy += sin(TAU*(@w-1/4))*0.2
		
	
	draw: ->
		ctx.beginPath()
		ctx.rect(@neck.x-3, @neck.y-5, 6, 6)
		ctx.fillStyle = "black"; ctx.fill()
		ctx.strokeStyle = "white"; ctx.stroke()
	

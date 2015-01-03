
class @Humanoid extends Actor
	PlayerClasses.push @
	EnemyClasses.push @
	constructor: (x, y)->
		super
		@neck = @joint(0, 0)
		@head = @joint(0, 0, @neck)
		@lelbo = @joint(0, 0, @neck)
		@lhand = @joint(0, 0, @lelbo)
		@relbo = @joint(0, 0, @neck)
		@rhand = @joint(0, 0, @relbo)
		@tail = @joint(0, 0, @neck)
		@rknee = @joint(0, 0, @tail)
		@lknee = @joint(0, 0, @tail)
		@rfoot = @joint(0, 0, @rknee)
		@lfoot = @joint(0, 0, @lknee)
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
		
		# animate legs
		@lknee.vx += cos(TAU*(@w+1/4))*0.5
		@lknee.vy -= sin(TAU*(@w+1/4))
		@rknee.vx += cos(TAU*(@w-1/4))*0.5
		@rknee.vy -= sin(TAU*(@w-1/4))
		# @TODONT: bend knee backwards
		#@lfoot.vx -= sin(TAU*(@w-1/4))*0.5
		#@rfoot.vx -= sin(TAU*(@w+1/4))*0.5
		
		# animate arms
		if @weapon
			if weapon.melee
				@lhand.vx += sin(TAU*(@w+2/4))*0.5
				@lhand.vy += cos(TAU*(@w+2/4))*0.5
				@rhand.vx += sin(TAU*(@w-0/4))*0.5
				@rhand.vy += cos(TAU*(@w-0/4))*0.5
				
				@lelbo.vx += sin(TAU*(@w-3/4))*0.2
				@lelbo.vy += cos(TAU*(@w-3/4))*0.2
				@relbo.vx += sin(TAU*(@w-1/4))*0.2
				@relbo.vy += cos(TAU*(@w-1/4))*0.2
			else
				@lhand.vx += sin(TAU*(@w+2/4))*1.5
				@lhand.vy += cos(TAU*(@w+2/4))*0.5
				@rhand.vx += sin(TAU*(@w-0/4))*1.5
				@rhand.vy += cos(TAU*(@w-0/4))*0.5
				
		else if @galor
			@lelbo.vx += sin(TAU*(@w-3/4))*0.5
			@lelbo.vy += sin(TAU*(@w-3/4))*0.2
			@relbo.vx += sin(TAU*(@w-1/4))*0.5
			@relbo.vy += sin(TAU*(@w-1/4))*0.2
		else
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
		ctx.rect(@head.x-3, @head.y-5, 6, 6)
		ctx.fillStyle = "black"; ctx.fill()
		ctx.strokeStyle = "white"; ctx.stroke()
	


class @Humanoid extends Actor
	PlayerClasses.push @
	EnemyClasses.push @
	constructor: (x, y)->
		super
		
		@head = @point()
		@top = @point()
		@lelbo = @point()
		@lhand = @point()
		@relbo = @point()
		@rhand = @point()
		@bottom = @point()
		@rknee = @point()
		@lknee = @point()
		@rfoot = @point()
		@lfoot = @point()
		
		@neck = @constrain(@head, @top, length: 5, force: 5)
		@body = @constrain(@head, @bottom, length: 4, force: 5)
		@lupperarm = @constrain(@top, @lelbo, length: 7, force: 5)
		@rupperarm = @constrain(@top, @relbo, length: 7, force: 5)
		@llowerarm = @constrain(@lelbo, @lhand, length: 7, force: 5)
		@rlowerarm = @constrain(@relbo, @rhand, length: 7, force: 5)
		@lupperleg = @constrain(@bottom, @lknee, length: 6, force: 5)
		@rupperleg = @constrain(@bottom, @rknee, length: 6, force: 5)
		@llowerleg = @constrain(@lknee, @lfoot, length: 6, force: 5)
		@rlowerleg = @constrain(@rknee, @rfoot, length: 6, force: 5)
		
		# @llegmuscle = @constrainangle(@top, @bottom, @lknee, force: 5)
		# @rlegmuscle = @constrainangle(@top, @bottom, @rknee, force: 5)
		@lkneemuscle = @constrainangle(@bottom, @lknee, @lfoot, force: 5)
		@rkneemuscle = @constrainangle(@bottom, @rknee, @rfoot, force: 5)
		
		@w = 0
	
	update: ->
		fallingness = 0
		fallingness += point.vy for point in @points
		fallingness /= @points.length
		
		# support = min(1, max(0.1, 1 - fallingness))
		# this is far from ideal
		if fallingness < 0.9 or yes
			# anticombobulations
			@top.vy *= 0.8
			@head.vy *= 0.9
		
			@top.vy -= 3.3
			@bottom.vy -= 0.3
			@head.vy -= 0.5
			@lelbo.vy -= 0.5
			@relbo.vy -= 0.5
		
		@w -= 0.01 * @controller.x
		@top.vx += 0.5 * @controller.x
		@head.vx += 0.05 * @controller.x
		
		# Animate legs
		# @lknee.vx += cos(TAU*(@w+1/4))*0.5
		# @lknee.vy -= sin(TAU*(@w+1/4))*0.8
		# @rknee.vx += cos(TAU*(@w-1/4))*0.5
		# @rknee.vy -= sin(TAU*(@w-1/4))*0.8
		@lfoot.vx -= sin(TAU*(@w-1/4))*0.5
		@rfoot.vx -= sin(TAU*(@w+1/4))*0.5
		# @llegmuscle.angle = TAU * sin(TAU*(@w+1/4)) / 4
		# @rlegmuscle.angle = TAU * sin(TAU*(@w-1/4)) / 4
		@lkneemuscle.angle = @controller.x * -TAU * coserp(1/4, 1/2, TAU*(@w+1/4))
		@rkneemuscle.angle = @controller.x * -TAU * coserp(1/4, 1/2, TAU*(@w-1/4))
		# FIXME: leg shakeyness
		# TODO: move via leg animation
		
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
		ctx.rect(@top.x-3, @top.y-5, 6, 6)
		ctx.fill "black"
		ctx.stroke "white"
	

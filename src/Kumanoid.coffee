
class @Kumanoid extends Humanoid
	EnemyClasses.push @
	
	update: ->
		@neck.vy -= 3
		@lelbo.vy -= 0.5
		@relbo.vy -= 0.5
		
		@w -= 0.01 * @controller.x
		@lelbo.vx += 0.5 * @controller.x
		@lknee.vy -= 0.1
		@rknee.vy -= 0.1
		@lknee.vx -= sin(TAU*(@w))
		@lknee.vy -= cos(TAU*(@w))
		@rknee.vx -= sin(TAU*(@w+1/2))
		@rknee.vy -= cos(TAU*(@w+1/2))
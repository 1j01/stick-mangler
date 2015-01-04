
class @Bird extends Actor
	PlayerClasses.push @
	EnemyClasses.push @
	
	constructor: (x, y)->
		super
		
		@head = @point()
		@beak = @point()
		@tail = @point()
		@rknee = @point()
		@lknee = @point()
		@rfoot = @point()
		@lfoot = @point()
		
		@constrain(@beak, @head, length: 5, force: 5)
		@constrain(@tail, @head, length: 5, force: 5)
		@lupperleg = @constrain(@tail, @lknee, length: 6, force: 5)
		@rupperleg = @constrain(@tail, @rknee, length: 6, force: 5)
		@llowerleg = @constrain(@lknee, @lfoot, length: 6, force: 5)
		@rlowerleg = @constrain(@rknee, @rfoot, length: 6, force: 5)
		
		@w = 0
	
	update: ->
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
		
		beakx = @beak.x + @controller.x*2
		beaky = @beak.y
		dir = atan2(beaky-@head.y, beakx-@head.x)
		
		ctx.save()
		ctx.translate(@head.x, @head.y)
		ctx.rotate(dir)
		
		ctx.beginPath()
		
		ctx.arc(0, 0, 4, TAU/4, -TAU/4, no)
		ctx.moveTo(0, +4)
		ctx.lineTo(distance(beakx, beaky, @head.x, @head.y), 0)
		ctx.lineTo(0, -4)
		
		ctx.fill()
		ctx.stroke()
		
		ctx.restore()
	

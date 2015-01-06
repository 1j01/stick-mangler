
new Humanoid(350, 50)
new Bird(450, 50)
new Roller(150, 60)
new Roller(250, 80)
new Roller(350, 70)
# new Roller(150, 60, 4, 24)
# new Roller(250, 80, 4, 34)
# new Roller(350, 70, 4, 24)
new Box(100, 100, 25, 25)
new Box(200, 100, 50, 50)
new Box(300, 100, 25, 50)

new SpaceInvader

ground = new Solid [
	{x: -5, y: 200}
	{x: 200, y: 200}
	{x: 450, y: 250}
	{x: 450, y: 300}
	{x: 400, y: 450}
	{x: 400, y: 500}
	{x: -5, y: 500}
]

@world = {ground, width: 500, height: 300}


class @Box extends Entity
	constructor: (x, y, w=20, h=20)->
		super
		@tl = @point(x, y)
		@tr = @point(x+w, y)
		@bl = @point(x, y+h)
		@br = @point(x+w, y+h)
		# sides
		@constrain(@tl, @tr, force: 4)
		@constrain(@tr, @br, force: 4)
		@constrain(@br, @bl, force: 4)
		@constrain(@bl, @tl, force: 4)
		# x
		@constrain(@tl, @br, force: 3)
		@constrain(@bl, @tr, force: 3)


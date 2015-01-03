
class @Box extends Entity
	constructor: (x, y, w=20, h=20)->
		super
		@tl = @point(x, y)
		@tr = @point(x+w, y)
		@bl = @point(x, y+h)
		@br = @point(x+w, y+h)
		# sides
		@constrain(@tl, @tr, null, 4)
		@constrain(@tr, @br, null, 4)
		@constrain(@br, @bl, null, 4)
		@constrain(@bl, @tl, null, 4)
		# x
		@constrain(@tl, @br, null, 3)
		@constrain(@bl, @tr, null, 3)


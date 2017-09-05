images = require "images"

Class = require "nyaa.class"

Class "GroundProperties",
	__init: (arg) =>
		@name = arg.name
		@image = arg.image

		@buildableOn = arg.buildableOn or false
		@buildableAbove = arg.buildableAbove or false

	__tostring: =>
		"<GroundProperties: #{@name}>"


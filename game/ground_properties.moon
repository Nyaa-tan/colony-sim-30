images = require "images"

Class = require "nyaa.class"

Class "GroundProperties",
	__init: (arg) =>
		@name = arg.name
		@image = arg.image

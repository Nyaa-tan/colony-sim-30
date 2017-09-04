images = require "images"

Class = require "nyaa.class"

Class "GroundTypeReference",
	__init: (arg) =>
		@name = arg.name
		@image = arg.image

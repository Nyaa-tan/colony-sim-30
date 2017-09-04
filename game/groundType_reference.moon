images = require "images"

Class = require "class"

Class "GroundTypeReference",
	__init: (arg) =>
		@name = arg.name
		@image = arg.image

Class = require "class"

Class "Colony",
	__init: (arg) =>
		@name = arg.name or "Unknown colony"

		@resources = arg.resources or {}
		@population = arg.population or {}

		@structures = arg.structures or {}


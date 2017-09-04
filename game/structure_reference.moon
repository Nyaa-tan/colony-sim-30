Class = require "class"

Class "StructureReference",
	__init: (arg) =>
		@hitpoints = arg.hitpoints or 100

		@name = arg.name or "Unknown structure"

		@size = arg.size or 3

		@buildTime = arg.buildTime or 60 * 5



Class = require "nyaa.class"

Class "Structure",
	__init: (arg) =>
		@reference = arg.reference -- StructureReference

		@hitpoints = arg.hitpoints or @reference.hitpoints

		@timeToBuild = arg.timeToBuild or @reference.buildTime


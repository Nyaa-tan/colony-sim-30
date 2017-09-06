
Class = require "nyaa.class"

Class "Structure",
	__init: (arg) =>
		unless arg.properties
			error "no 'properties' attribute provided"

		@properties = arg.properties -- StructureProperties

		@hitpoints = arg.hitpoints or @properties.hitpoints

		@buildTime = arg.buildTime or @properties.buildTime

		@onUpdate = arg.onUpdate or nil

	__index: (key) =>
		@properties[key] or getmetatable(self)[key]

	update: (dt) =>
		if @buildTime > 0
			@buildTime -= dt

			@buildTime = math.max 0, @buildTime

		if @onUpdate
			@\onUpdate dt


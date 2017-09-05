
Class = require "nyaa.class"

Structure = require "game.structure"

Class "Colony",
	__init: (arg) =>
		@name = arg.name or "Unknown colony"

		@resources = arg.resources or {}
		@population = arg.population or {}

		@structures = arg.structures or {}

		@frame = arg.frame or 0

		@map = arg.map

	update: =>
		@frame += 1

		if @map.frame % 60 == 0
			for structure in *@structures
				structure\update 60

	addStructure: (x, y, z, properties) =>
		structure = Structure
			:properties
			colony: self

		if structure.buildTime > 0
			structure.buildTime -= @frame % 60

		table.insert @structures, structure

		halfSize = structure.size / 2

		for X = x - math.floor(halfSize), x + math.ceil(halfSize)
			for Y = y - math.floor(halfSize), y + math.ceil(halfSize)
				tile = @map\get X, Y, z

				unless tile
					return nil, "no tile at these coordinates"

				unless tile.groundType.buildableOn
					return nil, "not buildable"

		for X = x - math.floor(halfSize), x + math.ceil(halfSize)
			for Y = y - math.floor(halfSize), y + math.ceil(halfSize)
				@map\set X, Y, z, :structure

		structure



Class = require "class"

Tile = Class "Tile",
	__init: (arg) =>
		-- FIXME: Errors on missing parameters?

		@terrain = arg.terrain
		@structure = arg.structure

Class "Map",
	__init: (arg) =>
		@noises = arg.noises or nil -- FIXME
		@terrainChanges = arg.terrainChanges or {}

	---
	-- @return (Tile)
	get: (x, y, z) =>

	---
	-- @return nil
	set: (x, y, z, arguments) =>

	---
	-- @return (string)
	toMoon: =>

	__class: {
		:Tile

		---
		-- @param str (string)
		fromMoon: (str) =>
	}


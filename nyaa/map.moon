
Class = require "class"

Tile = Class "Tile",
	__init: (arg) =>
		-- FIXME: Errors on missing parameters?

		@terrain = arg.terrain
		@structure = arg.structure

Class "Map",
	:Tile
	---
	-- @return (Tile)
	get: (x, y, z) =>

	---
	-- @return nil
	set: (x, y, z, arguments) =>

	---
	-- @return (string)
	toMoon: =>

	---
	-- @param str (string)
	fromMoon: (str) =>



Class = require "class"
images = require "images"

Tile = Class "Tile",
	__init: (arg) =>
		-- FIXME: Errors on missing parameters?

		@terrain = arg.terrain
		@structure = arg.structure
		@x = arg.x
		@y = arg.y
		@z = arg.z
		@updated = false -- permet de savoir si une case est d'origine (générée par le bruit) ou si elle a été modifiée
		@groundType = arg.groundType or 20 -- -10 = lava | 0 = empty | 10 = cendres | 20 = weak dirt-like ground | 30 = stone
		@groundSprite = arg.groundSprite or images.get "ground_undef.png" -- image du sol
		@solidity = arg.solidity or 0 -- 0 pas de problème pour forer. +1 pour que ce soit du niveau technologique suivant.
		@structure = arg.structure or nil -- Si un batiment/unité occupe la case, elle est référencé ici.
		@ressources = arg.ressources or nil -- Ici, faire référence à la ressource du térrains : métal commun/rare/précieux, terre rare, artéfact, on doit connaître 
	
	crossable: =>
		if @groundType != 0 and not @structure then
			return true
		else return false
		
		local grid = {}

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


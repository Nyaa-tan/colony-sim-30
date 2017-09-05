
Class = require "nyaa.class"
images = require "images"
Ground = require "data.ground"

tool = (x,y,z) -> -- Cette fonction sert à générer une carte binaire de perlin noise
	part = 5
	pow = 1/9
	t = 2*love.math.noise(x,y,z)-1
	s = ((math.abs(t))^pow)*t/math.abs(t)+1
	t = (math.floor(s*part/2)/part)
	s = (math.abs(t)^(1/pow))*t/math.abs(t)
	return s
	
noise = (noise,xMax,yMax) ->
	xMax = 400
	yMax = 300
	grid = {}
	for x = 1, xMax
		grid[x] = grid[x] or {}
		for y = 1, yMax
		    grid[x][y] = tool((x+noise)/50,(y+noise)/50,noise)
	return grid
	
Tile = Class "Tile",
	__init: (arg) =>
		@groundChange = arg.groundChange or nil -- permet de savoir si une case est d'origine (générée par le bruit) ou si elle a été modifiée
		@groundType = arg.groundType or Ground[2]
		@structure = arg.structure or nil
		@ressources = arg.ressources or nil
	
	crossable: =>
		if @groundType != 0 and not @structure
			return true
		else return false

local Map

Map = Class "Map",
	__init: (arg) =>
		@noises = arg.noises or nil -- FIXME
		@defaultground = arg.defaultGround
		@grid = {}
		@xMax = arg.xMax or 300
		@yMax = arg.yMax or 200
		@zMin = arg.zMin or -3
		@zMax = arg.zMax or 3

	__class: {
		:Tile

		perlinMap: (arg) ->
			self = Map arg
			@noises or= 1

			mapSource1 = noise(@noises,@xMax,@yMax)		--Height Map
			mapSource2 = noise(@noises+0.1,@xMax,@yMax*2)	--GroundType Map
			for x = 1, @xMax
				@grid[x] = {}
				
				for y = 1, @yMax
					@grid[x][y] = {}
					
					for z = @zMin, mapSource1[x][y]
						@grid[x][y][z] = Tile
							groundType: Ground[mapSource2[x][y]+1]
							
					for z = mapSource1[x][y]+1, @zMax
						@grid[x][y][z] = Ground[3] -- empty ground

			self

		flatMap: (arg) ->
			self = Map arg

			rocks = Ground\getByName "Rocks"
			empty = Ground\getByName "Empty"

			for x = 1, @xMax
				@grid[x] = {}

				for y = 1, @yMax
					@grid[x][y] = {}

					for z = @zMin, @zMax
						if z <= 0
							@grid[x][y][z] = rocks
						else
							@grid[x][y][z] = empty

			self

		---
		-- @param str (string)
		fromMoon: (str) =>
	}

	---
	-- @return (Tile)
	get: (x, y, z) =>
		@grid[x][y][z]

	---
	-- @return boolean
	set: (x, y, z, arguments) =>
		local modified

		if arguments.groundType
			@grid[x][y][z].groundType = arguments.groundType
			modified = true

		if arguments.structure
			@grid[x][y][z].structure = arguments.structure
			modified = true

		if arguments.ressource
			@grid[x][y][z].ressource = arguments.ressource
			modified = true

		if modified
			@grid[x][y][z].groundChange = true

		modified
		
	---
	-- @return (string)
	toMoon: =>

Map


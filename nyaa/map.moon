
Class = require "class"
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
		@groundType = arg.groundType
		@structure = arg.structure or nil
		@ressources = arg.ressources or nil
	
	crossable: =>
		if @groundType != 0 and not @structure
			return true
		else return false

Class "Map",
	__init: (arg) =>
		@noises = arg.noises or nil -- FIXME
		@defaultground = arg.defaultGround
		@grid = {}
		@xMax = arg.xMax
		@yMax = arg.yMax
		@zMin = arg.zMin
		@zMax = arg.zMax
		mapSource1 = noise(@noises,@xMax,@yMax)		--Height Map
		mapSource2 = noise(@noises+0.1,@xMax,@yMax*2)	--GroundType Map
		for x = 1, @xMax
			for y = 1, @yMax
				for z = @zMin, mapSource1[x][y]
					grid[x][y][z] = Tile
						groundType: Ground[mapSource2[x][y]+1]
				for z = mapSource1[x][y]+1, @zMax
					grid[x][y][z] = Ground[3] -- empty ground
	---
	-- @return (Tile)
	get: (x, y, z) =>
		grid[x][y][z]

	---
	-- @return nil
	set: (x, y, z, arguments) =>
		if arguments.groundType
			grid[x][y][z].groundType = arguments.groundType
			modified = true
		if arguments.structure
			grid[x][y][z].groundType = arguments.structure
			modified = true
		if arguments.ressource
			grid[x][y][z].groundType = arguments.ressource
			modified = true
		if modified
			grid[x][y][z].groundChange = true
		
	---
	-- @return (string)
	toMoon: =>

	__class: {
		:Tile

		---
		-- @param str (string)
		fromMoon: (str) =>
	}


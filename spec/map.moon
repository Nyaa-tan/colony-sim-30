
describe "Map", ->
	Map = require "game.map"

	GroundType = require "game.ground_properties"
	Structure = require "game.structure"
	StructureProperties = require "game.structure_properties"
	Resource = require "game.resource"
	Colony = require "game.colony"

	TEST_GROUND = GroundType
		name: "Test Ground Type"
		buildableOn: true

	TEST_STRUCTURE_PROPERTIES = StructureProperties
		name: "Test Structure"
		buildTime: 60

	TEST_RESOURCE = Resource
		name: "Test Resource"

	it "constructor", ->
		assert Map {}

	it "\\get", ->
		m = Map.flatMap {}

		assert m\get 1, 1, 0

	it "\\set sets ground type", ->
		m = Map.flatMap {}

		m\set 1, 1, 1,
			groundType: TEST_GROUND

		assert.are.same TEST_GROUND, m\get(1, 1, 1).groundType

	it "builds structures", ->
		m = Map.flatMap {}

		colony = m\registerColony Colony
			name: "Test Colony"

		structure, reason = colony\addStructure 5, 5, 1, TEST_STRUCTURE_PROPERTIES

		assert.is.table structure, reason

		-- We’re updating more than necessary in case build values
		-- are not updated each frame.
		for i = 1, 60 + TEST_STRUCTURE_PROPERTIES.buildTime
			m\update!

		tile = m\get 5, 5, 1
		assert.is.table tile

		structure = tile.structure
		assert.is.table structure

		assert.are.same 0, structure.buildTime

	it "updates structures", ->
		updated = false

		m = Map.flatMap {}

		colony = m\registerColony Colony
			name: "Test Colony"

		properties = StructureProperties TEST_STRUCTURE_PROPERTIES
		properties.onUpdate = (using updated) ->
			updated = true

		structure, reason = colony\addStructure 5, 5, 1, properties

		assert.is.table structure, reason

		for i = 1, 120 + TEST_STRUCTURE_PROPERTIES.buildTime
			m\update!

		tile = m\get 5, 5, 1
		assert.is.table tile

		structure = tile.structure
		assert.is.table structure

		assert.is.true updated, "Properties’ callback was not called."


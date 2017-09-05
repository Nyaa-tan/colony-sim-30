
describe "Map", ->
	Map = require "nyaa.map"

	GroundType = require "game.groundType_reference"
	Structure = require "game.structure"
	StructureReference = require "game.structure_reference"

	TEST_GROUND = GroundType
		name: "Test Ground Type"

	TEST_STRUCTURE = Structure
		reference: StructureReference {}

	it "constructor", ->
		assert Map {}

	it "\\get", ->
		m = Map {}

		assert m\get 1, 1, 1

	it "\\set", ->
		m = Map {}

		m\set 1, 1, 1,
			groundType: TEST_GROUND

		assert.are.same TEST_GROUND, m\get(1, 1, 1).groundType

		m\set 1, 2, 1,
			structure: TEST_STRUCTURE

		assert.are.same TEST_STRUCTURE, m\get(1, 1, 1).structure


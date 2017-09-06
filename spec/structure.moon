
describe "Structure", ->
	Structure = require "game.structure"
	StructureProperties = require "game.structure_properties"

	TEST_PROPERTIES = StructureProperties
		name: "Test Structure"

	it "constructor", ->
		Structure
			properties: TEST_PROPERTIES

	it "constructor -- errors", ->
		f = ->
			Structure {}

		assert.has_error f, "no 'properties' attribute provided"


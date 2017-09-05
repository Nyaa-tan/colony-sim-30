
describe "Structure", ->
	Structure = require "game.structure"
	StructureReference = require "game.structure_reference"

	TEST_REFERENCE = StructureReference
		name: "Test Structure"

	it "constructor", ->
		Structure
			reference: TEST_REFERENCE

	it "constructor -- errors", ->
		f = ->
			Structure {}

		assert.has_error f, "no 'reference' attribute provided"


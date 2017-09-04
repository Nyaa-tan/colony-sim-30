
describe "DataCollection", ->
	DataCollection = require "nyaa.data_collection"

	A = {
		name: "Test A"
		id: "A"
	}

	B = {
		name: "Test B"
		id: "B"
	}

	it "constructs", ->
		c = DataCollection {A, B, A}

		assert.are.same A, c[1]
		assert.are.same B, c[2]
		assert.are.same A, c[3]

	it "\\push", ->
		c = DataCollection {}

		c\push A
		assert.are.same A, c[1]

		c\push A
		assert.are.same A, c[2]

		c\push B
		assert.are.same B, c[3]

	it "\\getByProperty", ->
		c = DataCollection {A, B}

		assert.are.same A, c\getByProperty (e) -> e.id == "A"
		assert.are.same B, c\getByProperty (e) -> e.id == "B"

	it "\\getByName", ->
		c = DataCollection {A, B}

		assert.are.same A, c\getByName A.name
		assert.are.same B, c\getByName B.name


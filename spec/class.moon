
describe "Class", ->
	Class = require "nyaa.class"

	it "__init", ->
		C = Class
			__init: (arg) =>
				@a = arg.a

		c = C a: math.pi

		assert.are.equal math.pi, c.a

	it "__index", ->
		C = Class
			__index: (key) => key

		c = C {}

		assert.are.equal true, c[true]

	it "__class", ->
		C = Class
			__class:
				A: 42

		assert.are.equal 42, C.A

	it "__call", ->
		C = Class
			__call: => true

		c = C {}

		assert.are.equal true, c!

	it "__construct", ->
		C = Class
			__construct: => true

		assert.are.equal true, C!

	it "__tostring", ->
		C = Class
			__name: "Test"

		c = C {}

		assert tostring(c)\match "Test"

	describe "ClassData", ->
		-- Not testing much here. This basically tests the thing exists
		-- and is somewhat usable.
		it "__tostring", ->
			C = Class {}
			c = C {}

			classData = getmetatable C

			assert tostring(classData)\match "ClassData"


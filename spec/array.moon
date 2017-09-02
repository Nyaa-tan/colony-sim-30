
Array = require "nyaa.array"

describe "Array", ->
	it "\\push & \\pop", ->
		a = Array {}

		for i = 1, 3
			a\push i

		for i = 3, 1, -1
			x = a\pop!

			assert.are.same i, x

	it "\\map", ->
		a = Array({1, 2, 3})\map (x) -> x - 1

		for i = 1, 3
			assert.are.same i-1, a[i]

	it "\\filter", ->
		a = Array([x for x = 1, 10])\filter (x) -> x % 2 == 0

		for value in *a
			assert value % 2 == 0


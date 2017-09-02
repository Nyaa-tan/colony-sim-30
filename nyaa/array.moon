
Class = require "nyaa.class"

local Array

---
-- @fixme Some of those operations are not very efficient.
Array = Class "Array",
	---
	-- Creates an array.
	--
	-- Continuous integer-indexed values will be used as initial stored values.
	-- If none, the created array will be empty.
	__init: (arg) =>
		for i = 1, #arg
			rawset self, i, arg[i]

	---
	-- Appends a value to the Array.
	--
	-- The value is always added as the last element.
	--
	-- @return (nil)
	push: (value) =>
		self[#self + 1] = value

	---
	-- Removes the last value from the array, and returns it.
	--
	-- @return (object)
	pop: =>
		last = self[#self]

		self[#self] = nil

		return last

	---
	-- Applies a function to all elements of the array, and returns a new array containing the results.
	--
	-- @param f (function)
	-- @return (Array)
	map: (f) =>
		Array [f x for x in ipairs self]

	---
	-- Applies a function to all elements of the array, and returns a new array containing the original values whose application through this function returned something truth-y.
	--
	-- @param filter (function)
	-- @return (Array)
	filter: (filter) =>
		newArray = Array {}

		for i = 1, #self
			value = self[i]

			if filter value
				newArray\push value

		newArray

	---
	-- Concatenates the stored values.
	--
	-- Throws errors if an element cannot be converted to a string.
	--
	-- @param separator (string) String to add between concatenated values.
	concat: (separator) =>
		table.concat self, separator

Array


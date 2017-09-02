
Class = require "nyaa.class"

local Array

---
-- @fixme Some of those operations are not very efficient.
Array = Class "Array",
	__init: (arg) =>
		for i = 1, #arg
			rawset self, i, arg[i]

	push: (value) =>
		self[#self + 1] = value

	pop: =>
		last = self[#self]

		self[#self] = nil

		return last

	map: (f) =>
		Array [f x for x in ipairs self]

	filter: (filter) =>
		newArray = Array {}

		for i = 1, #self
			value = self[i]

			if filter value
				newArray\push value

		newArray

	concat: (separator) =>
		table.concat self, separator

Array


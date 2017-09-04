
Class = require "nyaa.class"
Array = require "nyaa.array"

Class "DataCollection",
	__init: Array.__init
	__index: (key) =>
		rawget(self, key) or getmetatable(self)[key] or Array[key]

	getByProperty: (test) =>
		for elem in *self
			if test elem
				return elem

	getByName: (name) =>
		@\getByProperty (e) -> e.name == name


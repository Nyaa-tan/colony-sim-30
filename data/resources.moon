
Class = require "nyaa.class"

Resource = Class "Resource",
	__init: (arg) =>
		@name = arg.name

DataCollection = require "nyaa.data_collection"

DataCollection {
	Resource
		name: "Common Metals"

	Resource
		name: "Rare Metals"

	Resource
		name: "Minerals"

	Resource
		name: "Water"

	Resource
		name: "Organic Wastes"
}


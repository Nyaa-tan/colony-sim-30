
Class = require "nyaa.class"

Ground = require "game.ground_properties"

require("nyaa.data_collection") {
	Ground
		name: "Lava"
		image: "lava.png"
		
	Ground
		name: "Ash"
		image: "ash.png"
		buildableAbove: true

	Ground
		name: "Empty"
		image: "empty.png"
		buildableOn: true

	Ground
		name: "Dirt"
		image: "dirt.png"
		buildableAbove: true

	Ground
		name: "Rocks"
		image: "rock.png"
		buildableAbove: true
}


Layout = require "luigi.layout"

Widget = require "luigi.widget"

Widget.register "nyaa.map", =>
	@\onPreDisplay (e) ->
		-- Drawing code comes here.

with Layout {
	width: false
	height: false

	id: "map"
	type: "nyaa.map"
	flow: "y"
	{
		type: "panel"
		text: "info/status bar here"
		height: 64
		style: "unclickable glass"
		align: "middle left"
		flow: "x"

		-- Font metadata.
		size: 24
		padding: 16

		{width: false}
		{
			type: "button"
			text: "Overview"
			width: 96
			size: 14
			style: "glass"
			align: "middle center"
		}
		{
			type: "button"
			text: "Menu"
			width: 96
			size: 14
			style: "glass"
			align: "middle center"
		}
	}
	{
		flow: "x"
		width: false
		height: false
		id: "alertCards"
	}
	{
		type: "panel"
		style: "unclickable glass"
		width: false
		height: "auto"
		flow: "y"
		padding: 6
		{
			flow: "x"
			text: "Construction panel here"
			width: false
			height: 32

			-- Font metadata.
			size: 24
		}
		with [{
			type: "button"
			style: "glass"
			width: 128
			height: 160
		} for i = 1, 8]
			.flow = "x"
			.scroll = true
	}
}
	-- Complete path is needed here because the location of Luigi’s assets are based on it…
	\setTheme require "lib.luigi.luigi.theme.dark"

	\setStyle {
		glass:
			slices: =>
				if self.pressed.left
					"data/art/glass_white.png"
				else
					"data/art/glass.png"
		"unclickable glass":
			slices: "data/art/glass.png"
		"green glass":
			slices: "data/art/glass_green.png"
		"yellow glass":
			slices: "data/art/glass_yellow.png"
		"red glass":
			slices: "data/art/glass_red.png"
		"white glass":
			slices: "data/art/glass_white.png"
	}

	\show!

	.map\onPressDrag (e) ->
		print "clickity drag"

	card = .alertCards\addChild {
		type: "button"
		text: "info box"
		style: "green glass"
		width: 192 -- Arbitrary for now.
		height: 256
		align: "top left"
		{}
		{
			type: "button"
			style: "glass"
			text: "x"
			align: "middle center"
			width: 48
			height: 48
			size: 24
		}
	}

	-- "x" button.
	card[#card]\onPress (e using nil) ->
		self = e.target
		panel = card.parent

		index = 0
		while index <= #panel and panel[index] != card
			index += 1

		table.remove panel, index



Layout = require "luigi.layout"

with Layout {
	width: false
	height: false

	id: "map"
	type: "map"
	flow: "y"
	{
		type: "panel"
		text: "info/status bar here"
		height: 64
	}
	{
		flow: "x"
		width: false
		height: false
		{
			width: false
			flow: "y"
			{
				type: "button"
				text: "info boxes here, probably"
				width: 192 -- Arbitrary for now.
				height: 256
			}
		}
	}
	{
		type: "panel"
		width: false
		height: "auto"
		flow: "y"
		{
			flow: "x"
			type: "panel"
			text: "Construction panel here"
			width: 256 - 16
			height: 32
		}
		with [{type: "button", width: false, height: 128} for i = 1, 8]
			.flow = "x"
	}
}
	-- Complete path is needed here because the location of Luigi’s assets are based on it…
	\setTheme require "lib.luigi.luigi.theme.dark"

	\show!

	.map\onPressDrag (e) ->
		print "clickity drag"


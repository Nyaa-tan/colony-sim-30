
Layout = require "luigi.layout"

Widget = require "luigi.widget"

Widget.register "nyaa.map", =>
	@\onPreDisplay (e) ->
		-- Drawing code comes here.

layouts = require "game.ui.layouts"

style = {
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

with layouts.GAME_UI
	-- Complete path is needed here because the location of Luigi’s assets are based on it…
	\setTheme require "lib.luigi.luigi.theme.dark"

	\setStyle style

	.menuButton\onPress (e) ->
		\hide!
		layouts.MAIN_MENU\show!

	-- FIXME: Handle this in nyaa.map.
	.map\onPressDrag (e) ->
		print "clickity drag"

	-- FIXME: Add a custom method to register cards, in a custom widget type.
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

with layouts.MAIN_MENU
	\setTheme require "lib.luigi.luigi.theme.dark"
	\setStyle style

	.newGameButton\onPress (e) ->
		\hide!
		layouts.GAME_UI\show!

	\show!


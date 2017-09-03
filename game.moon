
Layout = require "luigi.layout"

Widget = require "luigi.widget"

Widget.register "nyaa.map", =>
	@addNotification = (arg) =>
		notifications = @layout.notifications

		arg.type or= "panel"
		arg.style or= "glass"
		arg.width or= 128
		arg.height or= 192
		arg.margin or= notifications.padding

		with notification = notifications\addChild arg
			with \addChild {
				flow: "x"
			}
				\addChild {}
				with \addChild {
					type: "button"
					text: "x"
				}
					\onPress (e) ->
						notification.closing = true

	@removeNotification = (arg) =>
		notifications = @layout.notifications

		for i = 1, #notifications
			notification = notifications[i]

			if notification == arg
				table.remove notifications, i
				notifications\reshape!
				break

	@updateNotifications = =>
		notifications = @layout.notifications

		i = 1
		while i <= #notifications
			notification = notifications[i]

			if notification.closing
				-- FIXME: Start with a fade-out animation, please.
				notification.width -= 5

				if notification.width <= 0
					@\removeNotification notification

					continue

			i += 1

	@\onPreDisplay (e) ->
		-- Drawing code comes here.

		@\updateNotifications!

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

	.overviewButton\onPress (e) ->
		print "overview clicked"

		layouts.GAME_UI.root\addNotification {
			text: "Heyya"
		}

	.menuButton\onPress (e) ->
		\hide!
		layouts.MAIN_MENU\show!

	-- FIXME: Handle this in nyaa.map.
	.map\onPressDrag (e) ->
		print "clickity drag"

with layouts.MAIN_MENU
	\setTheme require "lib.luigi.luigi.theme.dark"
	\setStyle style

	.newGameButton\onPress (e) ->
		\hide!
		layouts.GAME_UI\show!

	\show!


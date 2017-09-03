
Layout = require "luigi.layout"

{
	MAIN_MENU: Layout {
		width: false
		height: false
		flow: "x"
		{}
		{
			flow: "y"
			{}
			{
				type: "button"
				text: "New game!"
				id: "newGameButton"
				width: 200
			}
			{}
		}
		{}
	}
	GAME_UI: Layout {
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
				id: "overviewButton"
				width: 96
				size: 14
				style: "glass"
				align: "middle center"
			}
			{
				type: "button"
				text: "Menu"
				id: "menuButton"
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
			id: "notifications"
			padding: 4
			spacing: 4
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
}


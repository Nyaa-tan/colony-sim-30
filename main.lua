-- Import paths for external libraries.
package.path = package.path .. ";lib/luigi/?.lua"

-- It’s a hack, and will have to be dealt with properly at some point.
if love.system.getOS() == "Windows" then
	oldOpen = io.open
	io.open = function(file, ...)
		local absolute = false

		if string.sub(file, 2, 2) == ":" then -- Windows™, duh~
			absolute = true
		end

		if not absolute then
			file = love.filesystem.getSourceBaseDirectory() .. "/colony-sim-30/" .. file
		end

		return oldOpen(file, ...)
	end
end

-- Makes Löve able to read Moonscript files.
-- It sets its own package import paths for Moonscript files.
require "moonscript"

-- Our actual game entry point.
require "game"



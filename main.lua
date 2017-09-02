
-- Import paths for external libraries.
package.path = package.path .. ";lib/luigi/?.lua"

-- Makes Löve able to read Moonscript files.
-- It sets its own package import paths for Moonscript files.
require "moonscript"

-- Our actual game entry point.
require "game"



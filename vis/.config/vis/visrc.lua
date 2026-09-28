-- load standard vis module, providing parts of the Lua API
require('vis')

-- Plugins
local plug = require('plugins/vis-plug')
local plugins = {
	{ 'kupospelov/vis-ctags' },
}

plug.init(plugins, true)

-- Options
vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win) -- luacheck: no unused args
	-- Your per window configuration options e.g.
	-- vis:command('set number')
end)

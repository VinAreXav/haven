local bufferlist      = require('ide.components.bufferlist')
local explorer        = require('ide.components.explorer')
local outline         = require('ide.components.outline')
local callhierarchy   = require('ide.components.callhierarchy')
local timeline        = require('ide.components.timeline')
local terminal        = require('ide.components.terminal')
local terminalbrowser = require('ide.components.terminal.terminalbrowser')
local changes         = require('ide.components.changes')
local commits         = require('ide.components.commits')
local branches        = require('ide.components.branches')
local bookmarks       = require('ide.components.bookmarks')

require('ide').setup({
    -- values: "nerd", "codicon", "default"
    icon_set = "default",
    -- Set the log level for nvim-ide's log. Log can be accessed with 
    -- 'Workspace OpenLog'. Values are 'debug', 'warn', 'info', 'error'
    log_level = "info",
    components = {
        global_keymaps = {
        hide = "h",
        },
		Explorer = {
				keymaps = {
				hide = "x",
				}
		}
    },
    panels = {
        left = "explorer",
        right = "git",
		bottom = "terminalbrowser"
    },
  panel_groups = {
    explorer = { "explorer", "outline" },
    git = { "changes", "commits", "timeline", "branches" },
    terminalbrowser = { "terminal" }
  },
    workspaces = {
        -- which panels to open by default, one of: 'left', 'right', 'both', 'none'
        auto_open = 'right',
    },
    panel_sizes = {
        left = 25,
        right = 30,
        bottom = 10
    }
})

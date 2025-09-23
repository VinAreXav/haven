require('ide').setup({

    -- The global icon set to use.
    -- values: "nerd", "codicon", "default"
    icon_set = "default",
    -- Set the log level for nvim-ide's log. Log can be accessed with 
    -- 'Workspace OpenLog'. Values are 'debug', 'warn', 'info', 'error'
    log_level = "info",
    -- Component specific configurations and default config overrides.
    components = {
        -- The global keymap is applied to all Components before construction.
        -- It allows common keymaps such as "hide" to be overridden, without having
        -- to make an override entry for all Components.
        --
        -- If a more specific keymap override is defined for a specific Component
        -- this takes precedence.
        global_keymaps = {
            -- example, change all Component's hide keymap to "h"
        hide = "h",
        },
        -- example, prefer "x" for hide only for Explorer component.
		Explorer = {
				keymaps = {
				hide = "x",
				}
		}
    },

    -- default panel groups to display on left and right.
    panels = {
        left = "explorer",
        right = "git",
		bottom = "terminalbrowser"
    },
    -- panels defined by groups of components, user is free to redefine the defaults
    -- and/or add additional.
  panel_groups = {
    explorer = { "explorer", "outline" },
    git = { "changes", "commits", "timeline", "branches" },
    terminalbrowser = { "terminal" }
  },

    -- workspaces config
    workspaces = {
        -- which panels to open by default, one of: 'left', 'right', 'both', 'none'
        auto_open = 'right',
    },
    -- default panel sizes for the different positions
    panel_sizes = {
        left = 25,
        right = 30,
        bottom = 10
    }
})

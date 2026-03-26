-- default settings
local bridge_settings = {
  obsidian_server_address = "http://localhost:27123",
  cert_path = "~/Desktop/bale/.obsidian/obsidian-local-rest-api.crt",
  scroll_sync = false, -- See "Sync of buffer scrolling" section below
  cert_path = nil, -- See "SSL configuration" section below
  warnings = true, -- Show misconfiguration warnings
  picker = "telescope", -- Picker to use with ObsidianBridgePickCommand ("telescope" | "fzf_lua")
}

-- If you are using lazy in your config,
-- for example in lua/plugins/bridge.lua
return {
  "oflisback/obsidian-bridge.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  -- dependencies = { "ibhagwan/fzf-lua" }, -- For picker = "fzf_lua"
  opts = bridge_settings,
		lazy = false,
}

-- Or you may call setup directly:
-- Note: There's nothing special about the bridge_settings variable.
-- You can pass a table directly if you prefer.

require("obsidian").setup({
	workspaces = {
				{
      name = "personal",
      path = "~/Desktop/bale/",
        },
},
		dir = "~/Desktop/bale/",
		notes_subdir = "rough-notes",

daily_notes = {

    --Optional, if you keep daily notes in a separate directory.   
	folder = "notes/dailies",
    -- Optional, if you want to change the date format for the ID of daily notes.
	date_format = "%d-%m-%Y",
    -- Optional, if you want to change the date format of the default alias of daily notes.
	alias_format = "%B %-d, %Y",
    -- Optional, default tags to add to each new daily note created.
	default_tags = { "daily-notes" },
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
	template = nil,
    -- Optional, if you want `Obsidian yesterday` to return the last work day or `Obsidian tomorrow` to return the next work day.
    workdays_only = true,
  },
   -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
  completion = {
    -- Enables completion using nvim_cmp
    nvim_cmp = true,
    -- Trigger completion at 2 chars.
    min_chars = 2,
    -- Set to false to disable new note creation in the picker
    create_new = true,
  },

  new_notes_location = "notes_subdir",
legacy_commands = false

})


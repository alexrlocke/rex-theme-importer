-- Adds "Import Theme from Ghostty" to Rex's command palette, opening the
-- ghostty-themes picker (next to this file) in a floating pane.
--
-- Clone this repo into ~/.config/rex/rex-theme-importer, then add
--   require("rex-theme-importer")
-- to ~/.config/rex/init.lua.

local here = debug.getinfo(1, "S").source:gsub("^@", ""):match("^(.*)/[^/]*$")
local script = here .. "/ghostty-themes"

rex.action{
  name = "import_ghostty_theme",
  title = "Import Theme from Ghostty",
  description = "Browse Ghostty's themes with a live preview, then import one",
  run = function(ctx)
    rex.call("session.new_layer", {
      session_id = ctx.session_id,
      bounds = { 0.1, 0.08, 0.8, 0.8 },
      focus = true,
      layout = {
        block = { flavor = "com.superlogical.terminal.shell", label = "Ghostty Themes", options = { shell = "none", command = { script } } },
      },
    })
  end,
}

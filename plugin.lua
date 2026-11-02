-- Adds "Import Theme from Ghostty" to Rex's command palette, opening the
-- ghostty-themes picker in a floating pane.
--
-- In ~/.config/rex/init.lua:
--   dofile("/path/to/rex-theme-importer/plugin.lua")("/path/to/rex-theme-importer/ghostty-themes")

return function(script)
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
end

# rex-theme-importer

Adds **Import Theme from Ghostty** to [Rex](https://www.superlogical.com/rex)'s
command palette: a floating fzf picker of Ghostty's themes, with a preview
drawn in the highlighted theme's colors. Enter imports the theme into Rex
and applies it.

Needs a recent [fzf](https://github.com/junegunn/fzf) (built against 0.74)
and [Ghostty](https://ghostty.org) installed, for its themes.

## Install

```sh
git clone https://github.com/alexrlocke/rex-theme-importer.git ~/.config/rex/rex-theme-importer
echo 'require("rex-theme-importer")' >> ~/.config/rex/init.lua
rex config reload
```

Importing goes through `rex do client.theme.import`, so Rex.app must have
**Remote Control** turned on (Settings → Rex Server).

## Use

Open the command palette and run **Import Theme from Ghostty**. Type to
search, move with the arrow keys or mouse wheel, Enter to import, Esc to
cancel.

## Files

- `init.lua` adds the palette command, which opens `ghostty-themes` in a
  floating pane.
- `ghostty-themes` lists the themes (`~/.config/ghostty/themes`, then
  Ghostty.app's), runs fzf, draws each preview (`--preview FILE`), and
  imports the one you pick. `--dry-run` prints the chosen theme's path
  instead of importing it.

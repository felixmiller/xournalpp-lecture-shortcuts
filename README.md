# Xournal++ Lecture Shortcuts

Single-key tool switching for [Xournal++](https://xournalpp.github.io/), made for
writing on slides with a pen during lectures.

## Keys

| Key | Tool |
|---|---|
| P | Pen, freehand. Also switches off ruler, shape recognizer and shape modes |
| E | Eraser |
| R | Ruler (straight lines) |
| S | Shape recognizer |
| B | Box (rectangle) |
| A | Arrow |
| D | Double arrow |
| M | Highlighter (marker) |
| X | Laser pointer, strokes fade out (Xournal++ 1.3 or newer) |
| Z | Undo |
| Y | Redo |

After R, S, B, A, D, M or X, press P to get back to the freehand pen.

The keys are plain letters without Ctrl/Alt, so they also fire while typing
with the Text tool.

H, J, K and L are not available: Xournal++ uses them for vim-style page
navigation, and in presentation mode they switch slides before the plugin sees
them. Digits 1-9 and 0 are taken too, they select the first ten colors of the
toolbar.

## Installation

Xournal++ loads each plugin from its own folder inside the plugin directory:

- Flatpak: `~/.var/app/com.github.xournalpp.xournalpp/config/xournalpp/plugins/`
- Distribution package or AppImage: `~/.config/xournalpp/plugins/`

Link the plugin folder from this repo into it, so changes here are used
directly (Flatpak shown):

```bash
ln -s ~/dev/xournalpp-lecture-shortcuts/lecture-shortcuts \
  ~/.var/app/com.github.xournalpp.xournalpp/config/xournalpp/plugins/lecture-shortcuts
```

Restart Xournal++ afterwards, plugins are only loaded at startup. The plugin is
enabled by default; if the keys do nothing, check the Plugin Manager.

## Compatibility

In use with Xournal++ 1.2.8 and 1.3.8.

The plugin calls `app.uiAction` with the old `ACTION_*` names. That call is
deprecated since 1.3 and works through Xournal++'s backward compatibility
layer. If a later version drops it, port the calls to `app.activateAction` /
`app.changeActionState`.

## Checking changes

To catch syntax errors before restarting Xournal++, compile-check with any Lua
interpreter, for example `texlua` from TeX Live:

```bash
echo 'assert(loadfile(arg[1])) print("OK")' > /tmp/luacheck.lua
texlua /tmp/luacheck.lua lecture-shortcuts/main.lua
```

## License

MIT, see [LICENSE](LICENSE).

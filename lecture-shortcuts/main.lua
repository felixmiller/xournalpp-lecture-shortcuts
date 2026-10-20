-- Lecture Shortcuts for Xournal++
-- Single-key bindings for fast tool switching during lectures.
--
-- WARNING: Plain-key accelerators (without Ctrl/Alt/Shift) will intercept
-- keypresses in the Text tool.
--
-- Do not use H, J, K, L or digits: Xournal++ uses H/J/K/L for page navigation
-- (in presentation mode they switch slides) and 1-9, 0 for the toolbar colors.
--
-- Bindings:
--   P  = Pen (freehand)
--   E  = Eraser
--   R  = Ruler (straight lines) — press P to go back to freehand
--   S  = Shape recognizer — press P to go back to freehand
--   B  = Box (rectangle) — press P to go back to freehand
--   A  = Arrow — press P to go back to freehand
--   D  = Double arrow — press P to go back to freehand
--   M  = Highlighter (marker), press P to go back to the pen
--   X  = Laser pointer (strokes fade out), press P to go back to the pen
--   Z  = Undo
--   Y  = Redo

function initUi()
    app.registerUi({["menu"] = "Pen", ["callback"] = "selectPen", ["accelerator"] = "p"})
    app.registerUi({["menu"] = "Eraser", ["callback"] = "selectEraser", ["accelerator"] = "e"})
    app.registerUi({["menu"] = "Ruler (straight line)", ["callback"] = "selectRuler", ["accelerator"] = "r"})
    app.registerUi({["menu"] = "Shape Recognizer", ["callback"] = "selectRecognizer", ["accelerator"] = "s"})
    app.registerUi({["menu"] = "Box (rectangle)", ["callback"] = "selectBox", ["accelerator"] = "b"})
    app.registerUi({["menu"] = "Arrow", ["callback"] = "selectArrow", ["accelerator"] = "a"})
    app.registerUi({["menu"] = "Double Arrow", ["callback"] = "selectDoubleArrow", ["accelerator"] = "d"})
    app.registerUi({["menu"] = "Highlighter", ["callback"] = "selectHighlighter", ["accelerator"] = "m"})
    app.registerUi({["menu"] = "Laser Pointer", ["callback"] = "selectLaser", ["accelerator"] = "x"})
    app.registerUi({["menu"] = "Undo", ["callback"] = "doUndo", ["accelerator"] = "z"})
    app.registerUi({["menu"] = "Redo", ["callback"] = "doRedo", ["accelerator"] = "y"})
end

function selectPen()
    app.uiAction({["action"] = "ACTION_TOOL_PEN"})
    app.uiAction({["action"] = "ACTION_RULER", ["enabled"] = false})
    app.uiAction({["action"] = "ACTION_SHAPE_RECOGNIZER", ["enabled"] = false})
end

function selectEraser()
    app.uiAction({["action"] = "ACTION_TOOL_ERASER"})
end

function selectRuler()
    app.uiAction({["action"] = "ACTION_TOOL_PEN"})
    app.uiAction({["action"] = "ACTION_RULER", ["enabled"] = true})
end

function selectRecognizer()
    app.uiAction({["action"] = "ACTION_TOOL_PEN"})
    app.uiAction({["action"] = "ACTION_SHAPE_RECOGNIZER", ["enabled"] = true})
end

function selectBox()
    app.uiAction({["action"] = "ACTION_TOOL_PEN"})
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_RECT", ["enabled"] = true})
end

function selectArrow()
    app.uiAction({["action"] = "ACTION_TOOL_PEN"})
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_ARROW", ["enabled"] = true})
end

function selectDoubleArrow()
    app.uiAction({["action"] = "ACTION_TOOL_PEN"})
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_DOUBLE_ARROW", ["enabled"] = true})
end

function selectHighlighter()
    app.uiAction({["action"] = "ACTION_TOOL_HIGHLIGHTER"})
end

function selectLaser()
    app.uiAction({["action"] = "ACTION_TOOL_LASER_POINTER_PEN"})
end

function doUndo()
    app.uiAction({["action"] = "ACTION_UNDO"})
end

function doRedo()
    app.uiAction({["action"] = "ACTION_REDO"})
end

let maplocalleader="\<M-v>"

" definition
" goToDefinition は存在しない
nnoremap gd <Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
nnoremap gD <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
" nnoremap g<C-s> <Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>

" decalaration (don't understand differences from `definition`)
" <Cmd>call VSCodeNotify('editor.action.goToDeclaration')<CR>
" <Cmd>call VSCodeNotify('editor.action.revealDeclaration')<CR>
" <Cmd>call VSCodeNotify('editor.action.previewDeclaration')<CR>
" <Cmd>call VSCodeNotify('editor.action.peekDeclaration')<CR>

" type definition
" <Cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>
" <Cmd>call VSCodeNotify('editor.action.peekTypeDefinition')<CR>

" implementation
nnoremap gi <Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>
nnoremap gI <Cmd>call VSCodeNotify('references-view.findImplementations')<CR>
" nnoremap gi <Cmd>call VSCodeNotify('editor.action.peekImplementation')<CR>

" symbol
" <Cmd>call VSCodeNotify('editor.action.goToSymbol')<CR>

" references
nnoremap gr <Cmd>call VSCodeNotify('references-view.findReferences')<CR>
nnoremap gR <Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>
" <Cmd>call VSCodeNotify('revealReference')<CR>
" <Cmd>call VSCodeNotify('editor.action.showReferences')<CR> " ???
" <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR> " same with `editor.action.referenceSearch.trigger`
" <Cmd>call VSCodeNotify('openReferenceToSide')<CR>          " ???

nnoremap gb <Cmd>call VSCodeNotify('workbench.action.navigateBack')<CR>
nnoremap gf <Cmd>call VSCodeNotify('workbench.action.navigateForward')<CR>
nnoremap <LocalLeader>h <Cmd>call VSCodeNotify('editor.action.showHover')<CR>

" copy & paste
nnoremap <C-S-c> <Cmd>call VSCodeNotify('editor.action.clipboardCopyAction')<CR>
inoremap <C-S-c> <Cmd>call VSCodeNotify('editor.action.clipboardCopyAction')<CR>
vnoremap <C-S-c> <Cmd>call VSCodeNotifyVisual('editor.action.clipboardCopyAction', 0)<CR>
nnoremap <C-S-v> <Cmd>call VSCodeNotify('editor.action.clipboardPasteAction')<CR>
inoremap <C-S-v> <Cmd>call VSCodeNotify('editor.action.clipboardPasteAction')<CR>
xnoremap <C-S-v> <Cmd>call VSCodeNotify('editor.action.clipboardPasteAction')<CR>

nnoremap <LocalLeader>rn <Cmd>call VSCodeNotify('editor.action.rename')<CR>

nnoremap u <Cmd>call VSCodeNotify('undo')<CR>

" { "key": "enter",                 "command": "editor.action.nextMatchFindAction",          when": "editorFocus && findInputFocussed" }
" { "key": "ctrl+f3",               "command": "editor.action.nextSelectionMatchFindAction", when": "editorFocus" }
" { "key": "alt+f8",                "command": "editor.action.marker.next",                  when": "editorFocus" },
" { "key": "f8",                    "command": "editor.action.marker.nextInFiles",           when": "editorFocus" },
" { "key": "shift+alt+f8",          "command": "editor.action.marker.prev",                  when": "editorFocus" },
" { "key": "shift+f8",              "command": "editor.action.marker.prevInFiles",           when": "editorFocus" }
" { "key": "ctrl+.",                "command": "editor.action.quickFix",                     when": "editorHasCodeActionsProvider && editorTextFocus && !editorReadonly" },
" { "key": "f2",                    "command": "editor.action.rename",                       when": "editorHasRenameProvider && editorTextFocus && !editorReadonly" }
" { "key": "ctrl+shift+r",          "command": "editor.action.refactor",                     when": "editorHasCodeActionsProvider && editorTextFocus && !editorReadonly" }
"
let maplocalleader="\\"

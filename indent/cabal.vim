" indentation for cabal
"
" author: raichoo (raichoo@googlemail.com)
"
if exists('b:did_indent')
  finish
endif

let b:did_indent = 1

if !exists('g:cabal_indent_section')
  "executable name
  ">>main-is:           Main.hs
  ">>hs-source-dirs:    src
  let g:cabal_indent_section = 2
elseif exists('g:cabal_indent_section') && g:cabal_indent_section > 4
  let g:cabal_indent_section = 4
endif

setlocal indentexpr=GetCabalIndent()
setlocal indentkeys=!^F,o,O,<CR>

function! GetCabalIndent()
  let l:prevline = getline(v:lnum - 1)

  if l:prevline =~ '^\([eE]xecutable\|[lL]ibrary\|[fF]lag\|[sS]ource-repository\|[tT]est-suite\)'
    return g:cabal_indent_section
  else
    return match(l:prevline, '\S')
  endif
endfunction

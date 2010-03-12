" textobj-django-template - Text objects for django templates
" Version: 0.2.0
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditiontextobj#htmldjango#
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

function! textobj#htmldjango#select_a(type)
    let initpos = getpos(".")

    let e = searchpairpos('{% *'.a:type.' .*%}', '', '{% *end'.a:type.' *%}', 'b')
    if e == [0, 0]
        return 0
    endif

    let e = [bufnr("%")] + e + [0]

    call setpos(".", initpos)

    call searchpair('{% *'.a:type.' .*%}', '', '{% *end'.a:type.' *%}', '')

    normal f}
    let b = getpos(".")

    return ['v', b, e]
endfunction

function! textobj#htmldjango#select_i(type)
    let initpos = getpos(".")
    if searchpair('{% *'.a:type.' .*%}', '', '{% *end'.a:type.' *%}', 'b') == 0
        return 0
    endif

    normal f}
    "move one pesky char
    call search('.')
    let e = getpos('.')

    call setpos(".", initpos)

    call searchpair('{% *'.a:type.' .*%}', '', '{% *end'.a:type.' *%}', '')
"        call search(".", 'b')
    let b = getpos(".")

    "move one pesky char
    call search('.', 'b')
    let b = getpos('.')
    return ['v', b, e]
endfunction

function! textobj#htmldjango#select_block_a()
   return textobj#htmldjango#select_a('block')
endfunction

function! textobj#htmldjango#select_if_a()
   return textobj#htmldjango#select_a('if\(equal\|notequal\|changed\|\)')
endfunction

function! textobj#htmldjango#select_with_a()
   return textobj#htmldjango#select_a('with')
endfunction

function! textobj#htmldjango#select_comment_a()
   return textobj#htmldjango#select_a('comment')
endfunction


function! textobj#htmldjango#select_for_a()
   return textobj#htmldjango#select_a('for')
endfunction

function! textobj#htmldjango#select_block_i()
   return textobj#htmldjango#select_i('block')
endfunction

function! textobj#htmldjango#select_if_i()
   return textobj#htmldjango#select_i('if\(equal\|notequal\|changed\|\)')
endfunction

function! textobj#htmldjango#select_with_i()
   return textobj#htmldjango#select_i('with')
endfunction

function! textobj#htmldjango#select_comment_i()
   return textobj#htmldjango#select_i('comment')
endfunction

function! textobj#htmldjango#select_for_i()
   return textobj#htmldjango#select_i('for')
endfunction

" vim: foldmethod=marker

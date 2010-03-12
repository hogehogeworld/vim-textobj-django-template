" textobj-django-template - Text objects for django templates
" Version: 0.2.0
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
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

if exists("loaded_matchit")
    let b:match_ignorecase = 1
    let b:match_skip = 's:Comment'
    let b:match_words = '<:>,' .
    \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
    \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
    \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>,'  . 
    \ '{% *if .*%}:{% *else *%}:{% *endif *%},' . 
    \ '{% *ifequal .*%}:{% *else *%}:{% *endifequal *%},' . 
    \ '{% *ifnotequal .*%}:{% *else *%}:{% *endifnotequal *%},' . 
    \ '{% *ifchanged .*%}:{% *else *%}:{% *endifchanged *%},' . 
    \ '{% *for .*%}:{% *endfor *%},' . 
    \ '{% *with .*%}:{% *endwith *%},' .
    \ '{% *comment .*%}:{% *endcomment *%},' .
    \ '{% *block .*%}:{% *endblock *%},' .
    \ '{% *filter .*%}:{% *endfilter *%},' .
    \ '{% *spaceless .*%}:{% *endspaceless *%}' 
else
    finish
endif

call textobj#user#plugin('djangotemplate', {
\   'block': {
\       'select-a': '<buffer> adb', '*select-a-function*': 'textobj#htmldjango#select_block_a',
\       'select-i': '<buffer> idb', '*select-i-function*': 'textobj#htmldjango#select_block_i'
\   },
\   'if': {
\       'select-a': '<buffer> adi', '*select-a-function*': 'textobj#htmldjango#select_if_a',
\       'select-i': '<buffer> idi', '*select-i-function*': 'textobj#htmldjango#select_if_i'
\   },
\   'with': {
\       'select-a': '<buffer> adw', '*select-a-function*': 'textobj#htmldjango#select_with_a',
\       'select-i': '<buffer> idw', '*select-i-function*': 'textobj#htmldjango#select_with_i'
\   },
\   'comment': {
\       'select-a': '<buffer> adc', '*select-a-function*': 'textobj#htmldjango#select_comment_a',
\       'select-i': '<buffer> idc', '*select-i-function*': 'textobj#htmldjango#select_comment_i'
\   },
\   'for': {
\       'select-a': '<buffer> adf', '*select-a-function*': 'textobj#htmldjango#select_for_a',
\       'select-i': '<buffer> idf', '*select-i-function*': 'textobj#htmldjango#select_for_i'
\   },
\ })

" vim: foldmethod=marker

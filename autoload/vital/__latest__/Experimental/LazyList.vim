let s:save_cpo = &cpo
set cpo&vim

" let s:V = g:V
" let s:L = s:V.import('Data.List')

function! s:_vital_loaded(V)
  let s:V = a:V
  let s:L = s:V.import('Data.List')
endfunction

function! s:_vital_depends()
  return ['Data.List']
endfunction


function! s:from_list(xs)
  return a:xs
endfunction

function! s:is_empty(xs)
  return !len(a:xs)
endfunction

function! s:unapply(xs)
  return [a:xs[0], a:xs[1 :]]
endfunction

function! s:take(xs, n)
  if s:is_empty(a:xs)
    return []
  else
    let [x, xs] = s:unapply(a:xs)
    return s:L.cons(x, s:take(xs, a:n - 1))
  endif
endfunction

"let xs = s:L.file_readlines('/tmp/a.txt')
"let xs = s:L.map(xs, 'split(v:val, ":")')
"let xs = s:L.filter(xs, 'v:val[1] < 3')
"echo s:L.take(xs, 3)

" echo s:take(s:from_list([3, 1, 4]), 2)

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et ts=2 sts=2 sw=2 tw=0:

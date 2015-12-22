let s:ruby_available = exists(':ruby') == 2

if s:ruby_available
  let s:self_path=expand("<sfile>")
  execute 'rubyfile '.s:self_path.'.rb'

  ruby ServerspecVim.doc_candidates
	let s:doc_candidates = s:ret
	unlet s:ret

else
  let s:doc_candidates = []
endif


function! serverspec#doc(...) abort
  if a:0 >= 1
    let anchor = '#' . a:1
  else
    let anchor = ''
  endif
  let url = 'http://serverspec.org/resource_types.html#' . anchor

  try
    call openbrowser#open(url)
  catch /E117.*/
    echom url
  endtry
endfunction

function! serverspec#doc_candidates(ArgLead, CmdLine, CursorPos) abort
  return s:doc_candidates
endfunction

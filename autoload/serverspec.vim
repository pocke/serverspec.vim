" let s:ruby_available = exists('+ruby')

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

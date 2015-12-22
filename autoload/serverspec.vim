let s:ruby_available = exists('+ruby')

function! serverspec#doc(name) abort
  let url = 'http://serverspec.org/resource_types.html#' . a:name

  try
    call openbrowser#open(url)
  catch /E117.*/
    echom url
  endtry
endfunction

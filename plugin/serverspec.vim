let s:save_cpo = &cpo
set cpo&vim


command! -nargs=? -complete=custom,serverspec#doc_candidates ServerspecDoc call serverspec#doc(<f-args>)


let &cpo = s:save_cpo
unlet s:save_cpo

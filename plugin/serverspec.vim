command! -nargs=? -complete=custom,serverspec#doc_candidates ServerspecDoc call serverspec#doc(<f-args>)

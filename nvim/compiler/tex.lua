vim.cmd[[ 
    " First create a script-local variable `s:latexmk` to store the latexmk command
    let s:latexmk = 'latexmk -pdf -output-directory=%:h %'

    " Then set `makeprg` to the value of `s:latexmk`
    let &l:makeprg = expand(s:latexmk)
]]

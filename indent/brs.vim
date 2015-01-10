" Vim indent file
" Language:	Brightscript
" Maintainer:	Charles Greene <charles.greene@redsapce.com>
" Last Change:	2015 Jan 09
" vim: set sw=2 sts=2;

if exists("b:did_indent")
    finish
endif
"let b:did_indent = 1

setlocal indentexpr=GetBrightscriptIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e
setlocal indentkeys+==end,=elsif,=when,=ensure,=rescue,==begin,==end

if exists("*GetBrightscriptIndent")
    finish
endif


function! s:OpenBrace(lnum)
endfunction

function! GetBrightscriptIndent()

    let SKIP_LINES = "^\\s*\\'"
    let pnum = v:lnum

    while pnum > 0
        let pnum = prevnonblank(pnum-1)
        if getline(pnum) !~? SKIP_LINES
            break
        endif
    endwhile

    if pnum == 0
        return 0
    endif

    let line = getline(v:lnum)
    let pline = getline(pnum)
    let ind = indent(pnum)
    echo pline

    if pline =~ '\({\|\[\|(\|:\)$'
        echo "Brace"
        return ind + &sw
    elseif pline =~ '^\s*\<\(function\|Function\|sub\|Sub\)\>'
        echo "Function/Sub"
        return ind + &sw
    elseif pline =~ '^\s*\<\(if\|If\|else\|Else\)\>'
        echo "If/Else"
        return ind + &sw
    elseif pline =~ '^\s*\<\(for\|For\|while\|While\)\>'
        echo "For/While"
        return ind + &sw
    endif

    " Match } }, }; ] ]: )
    if line =~ '^\s*\(}\|]\|)\)'
        return ind - &sw
    elseif line =~ '^\s*\<\(end\|End\|next\|Next\)\>'
        return ind - &sw
    elseif line =~ '^\s*\<\(else\|Else\)\>'
        return ind - &sw
    endif

    return ind
endfunction

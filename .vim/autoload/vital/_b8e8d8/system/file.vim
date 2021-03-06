" Utilities for file copy/move/mkdir/etc.

let s:save_cpo = &cpo
set cpo&vim

let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_mac = !s:is_windows && (has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin')

" Open a file.
function! s:open(filename) "{{{
  let filename = iconv(fnamemodify(a:filename, ':p'),
        \ &encoding, &termencoding)

  " Detect desktop environment.
  if s:is_windows
    " For URI only.
    silent execute '!start rundll32 url.dll,FileProtocolHandler' l:filename
  elseif s:is_cygwin
    " Cygwin.
    call system(printf('%s ''%s''', 'cygstart', l:filename))
  elseif executable('xdg-open')
    " Linux.
    call system(printf('%s ''%s'' &', 'xdg-open', l:filename))
  elseif exists('$KDE_FULL_SESSION') && $KDE_FULL_SESSION ==# 'true'
    " KDE.
    call system(printf('%s ''%s'' &', 'kioclien exec', l:filename))
  elseif exists('$GNOME_DESKTOP_SESSION_ID')
    " GNOME.
    call system(printf('%s ''%s'' &', 'gnome-open', l:filename))
  elseif executable('exo-open')
    " Xfce.
    call system(printf('%s ''%s'' &', 'exo-open', l:filename))
  elseif s:is_mac && executable('open')
    " Mac OS.
    call system(printf('%s ''%s'' &', 'open', l:filename))
  else
    " Give up.
    throw 'Not supported.'
  endif
endfunction "}}}


" Move a file.
" Dispatch s:move_file_exe() or s:move_file_pure().
function! s:move_file(src, dest) "{{{
    if executable('mv')
        return s:move_file_exe(a:src, a:dest)
    else
        return s:move_file_pure(a:src, a:dest)
    endif
endfunction "}}}

" Move a file.
" Implemented by 'mv' executable.
" TODO: Support non-*nix like system.
function! s:move_file_exe(src, dest)
    if !executable('mv') | return 0 | endif
    silent execute '!mv' shellescape(a:src) shellescape(a:dest)
    if v:shell_error
        return 0
    endif
    return 1
endfunction

" Move a file.
" Implemented by pure vimscript.
function! s:move_file_pure(src, dest) "{{{
    return !rename(a:src, a:dest)
endfunction "}}}

" Copy a file.
" Dispatch s:copy_file_exe() or s:copy_file_pure().
function! s:copy_file(src, dest) "{{{
    if executable('cp')
        return s:copy_file_exe(a:src, a:dest)
    else
        return s:copy_file_pure(a:src, a:dest)
    endif
endfunction "}}}

" Copy a file.
" Implemented by 'cp' executable.
" TODO: Support non-*nix like system.
function! s:copy_file_exe(src, dest)
    if !executable('cp') | return 0 | endif
    silent execute '!cp' shellescape(a:src) shellescape(a:dest)
    if v:shell_error
        return 0
    endif
    return 1
endfunction

" Copy a file.
" Implemented by pure vimscript.
function! s:copy_file_pure(src, dest) "{{{
    let ret = writefile(readfile(a:src, "b"), a:dest, "b")
    if ret == -1
        return 0
    endif
    return 1
endfunction "}}}

" mkdir() but does not throw an exception.
" Returns true if success.
" Returns false if failure.
function! s:mkdir_nothrow(...) "{{{
    try
        call call('mkdir', a:000)
        return 1
    catch
        return 0
    endtry
endfunction "}}}


let &cpo = s:save_cpo

" see `:help new-filetype' for more information about this file

if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
  autocmd BufReadPost * if (getline(1) =~ "^\\w\\{3\\} \\w\\{3\\} \\d\\{2\\} \\d\\{2\\}:\\d\\{2\\}:\\d\\{2\\} \\d\\{4\\}")
  autocmd BufReadPost *  setfiletype error_log
  autocmd BufReadPost * endif
augroup END


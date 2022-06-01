lua require "init"

" *
inoremap * *

" 主题
" syntax enable
" set background=dark
" set background=light
" colorscheme solarized

" 指定复制，粘贴软件位置
let g:clipboard = {
\ 'name': 'win32yank',
\ 'copy': {
\ '+': 'win32yank.exe -i --crlf',
\ '*': 'win32yank.exe -i --crlf',
\ },
\ 'paste': {
\ '+': 'win32yank.exe -o --lf',
\ '*': 'win32yank.exe -o --lf',
\ },
\ 'cache_enabled': 0,
\ }

" cpp语法高亮
    let g:cpp_class_scope_highlight = 1
    let g:cpp_member_variable_highlight = 1
    let g:cpp_class_decl_highlight = 1
    let g:cpp_posix_standard = 1
    let g:cpp_experimental_template_highlight = 1
    let g:cpp_concepts_highlight = 1

" 关闭popupmenu和tabline
" 不然bufferline和coc补全菜单会很丑
    set winaltkeys=no
    if has('nvim')
        try
            call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
            call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
        catch
        endtry
    endif

" 分割线设置
    let g:indentLine_enabled = 1
    let g:indentLine_char = '¦' 
    let g:indentLine_conceallevel = 2
    "let g:indentLine_color_term = 255      "设置显示线为白色
    let g:indentLine_setColors = 128       " 灰色

" 光标保持在上次退出原处
    au BufReadPost * if line("'\"") > 0 | if line("'\"") <= line("$") | exe("norm '\"") | else |exe "norm $"| endif | endif

" rainbow设置
    let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" asynctasks, asyncrun
    " 自动打开 quickfix window ，高度为 6
    let g:asyncrun_open = 6
    " " 任务结束时候响铃提醒
    " let g:asyncrun_bell = 1 
    let g:asynctasks_term_pos = 'external'

" rainbow
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" 代码格式化
    func! FormatSrc()
        if &filetype == 'cpp' || &filetype == 'c'
            exec 'silent !clang-format.exe -i -style="{'
                    \ .'BasedOnStyle: llvm,'
                    \ .'AlignArrayOfStructures: Left,'
                    \ .'AlignConsecutiveMacros: Consecutive,'   
                    \ .'AllowShortBlocksOnASingleLine: Empty,'
                    \ .'AllowShortFunctionsOnASingleLine: Empty,'
                    \ .'AllowShortLambdasOnASingleLine: Empty,'
                    \ .'ColumnLimit: 80,'
                    \ .'IndentWidth: 4'
                    \ .'}" %'
        endif
    endfunc
    nnoremap <leader>f :call FormatSrc()<CR>

    
" vsnip
" Jump forward or backward
    imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    let g:vsnip_snippet_dir = "D:/tools/.vsnip"


" markdown-preview
    " set to 1, nvim will open the preview window after entering the markdown buffer
    let g:mkdp_auto_start = 0

    " set to 1, the nvim will auto close current preview window when change
    " from markdown buffer to another buffer
    let g:mkdp_auto_close = 1

    " set to 1, the vim will refresh markdown when save the buffer or
    " leave from insert mode, default 0 is auto refresh markdown as you edit or
    " move the cursor
    let g:mkdp_refresh_slow = 0

    " set to 1, the MarkdownPreview command can be use for all files,
    let g:mkdp_command_for_global = 0

    " set to 1, preview server available to others in your network
    " by default, the server listens on localhost (127.0.0.1)
    let g:mkdp_open_to_the_world = 0

    " use custom IP to open preview page
    " useful when you work in remote vim and preview on local browser
    " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
    let g:mkdp_open_ip = ''

    " specify browser to open preview page
    let g:mkdp_browser = 'Chrome'

    " set to 1, echo preview page url in command line when open preview page
    let g:mkdp_echo_preview_url = 0

    " a custom vim function name to open preview page
    " this function will receive url as param
    let g:mkdp_browserfunc = ''

    let g:mkdp_preview_options = {
        \ 'mkit': {},
        \ 'katex': {},
        \ 'uml': {},
        \ 'maid': {},
        \ 'disable_sync_scroll': 0,
        \ 'sync_scroll_type': 'middle',
        \ 'hide_yaml_meta': 1,
        \ 'sequence_diagrams': {},
        \ 'flowchart_diagrams': {},
        \ 'content_editable': v:false,
        \ 'disable_filename': 0
        \ }

    " preview page title
    " ${name} will be replace with the file name
    let g:mkdp_page_title = '「${name}」'
    " recognized filetypes
    " these filetypes will have MarkdownPreview... commands
    let g:mkdp_filetypes = ['markdown']

    nnoremap <leader>m :MarkdownPreviewToggle<CR>
    
" vista.vim
    let g:vista_default_executive = 'ctags'
    let g:vista_executive_for = {
    \ 'cpp': 'nvim_lsp',
    \'python': 'nvim_lsp',
    \ }
    let g:vista#extensions = ['markdown']
    let g:vista#renderer#enable_icon = 1
    let g:vista_blink = [2, 100]
    let g:vista_close_on_jump = 0
    let g:vista_cursor_delay = 100
    let g:vista_disable_statusline = 0
    let g:vista_echo_cursor = 1
    let g:vista_find_absolute_nearest_method_or_function = 0
    let g:vista_find_nearest_method_or_function_delay = 100
    let g:vista_fold_toggle_icons = ['▼', '▶']
    let g:vista_icon_indent = ['└ ', '│ ']
    let g:vista_no_mappings = 0
    let g:vista_sidebar_position = 'vertical botright'
    let g:vista_sidebar_width = 30
    let g:vista_stay_on_open = 0
    let g:vista_top_level_blink = [2, 100]
    let g:vista_update_on_text_changed = 1
    let g:vista#renderer#icons = {'subroutine': '羚', 'method': '', 'func': '', 'variables': '', 'namespace': '', 'field': '', 'interface': '', 'type': '', 'packages': '', 'property': '襁', 'implementation': '', 'default': '', 'augroup': 'פּ', 'macro': '', 'enumerator': '', 'const': '', 'macros': '', 'map': 'פּ', 'fields': '', 'functions': '', 'enum': '', 'function': '', 'target': '', 'typedef': '', 'variable': '', 'modules': '', 'constant': '', 'struct': '', 'types': '', 'module': '', 'typeParameter': '', 'package': '', 'class': '', 'member': '', 'var': '', 'union': '鬒', 'constructor': ''}


" vim-floaterm
    let g:floaterm_wintype='split'
    let g:floaterm_width = 1.0
    let g:floaterm_height = 0.3

" vim-emmet
    let g:user_emmet_mode='n'    "enable n mode.
    let g:user_emmet_install_global = 0
    autocmd FileType markdown,html,css EmmetInstall
    let g:user_emmet_leader_key='<leader>'    "<leader>,不全

" nvim-tree默认快捷键
"
" y 复制文件名称
" Y 复制文件相对路径
" gy 复制文件绝对路径
" o或者<CR>会打开，关闭目录，或者打开文件
" <BS>会递归关闭目录直至根目录
" <C-]>会切换到光标目录且以其作为根目录
" a会创建文件，如果在最后添加 '/' 则会生成目录
" r重命名文件
" C-r重命名文件
" x切剪文件
" c拷贝文件
" p复制文件
" d删除文件，会提示
" D删除文件，可以在回收站找到，但是只支持Unix系统
" s会使用当前系统默认工具打开文件，如果是文件，则用nvim打开文件；如果是文件夹，用资源管理器打开文件目录所在
" C-k会显示文件或文件夹提示，如绝对路径，大小，创建/访问/修改时间
" f会过滤文件，相当于在windows中在资源管理器输入文件名，然后过滤文件
" q关闭

" vim-surround默认快捷键
"
" ysiw + ", ([{带空格, )]}不带空格
" ysiwb, 不带空格的()
" ysiwB, 不带空格的{}
" 整行前后加<div>, yss<div>
" v模式下选中区域前后加", <div>： v选中，大S，", <div>。
" cs"', 作用于整行, 双引号改成单引号
" ds", 作用于整行，删除双引号

" vim-repeat
" .重复上一次的操作
"

" 中英文切换, 没有效果
" let g:XkbSwitchLib = "D:\tools\xkb-switch-win-libxkbswitch64.dll"
" let g:XkbSwitchEnabled = 1
" let g:XkbSwitchIMappings   = ['cn']
"



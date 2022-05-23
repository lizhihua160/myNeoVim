-- <leader> = ' '
vim.g.mapleader = ' '

local opts = {noremap = true, silent = true}

-- 辅助函数
local function mapkey(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end
local function mapcmd(key, cmd)
    vim.api.nvim_set_keymap('n', key, ':'..cmd..'<cr>', opts)
end
local function maplua(key, txt)
    vim.api.nvim_set_keymap('n', key, ':lua '..txt..'<cr>', opts)
end

-- keymaps

-- j, 上，k下
mapkey('n', 'j', 'k')
mapkey('n', 'k', 'j')
mapkey('v', 'j', 'k')
mapkey('v', 'k', 'j')


-- H第一个非空个字符，L最后一个非空字符
mapkey('n', 'H', '^')
mapkey('n', 'L', '$')
mapkey('v', 'H', '^')
mapkey('v', 'L', '$')


vim.api.nvim_set_keymap('s', 'j', 'i<ESC>cwj', opts)
vim.api.nvim_set_keymap('s', 'k', 'i<ESC>cwk', opts)
vim.api.nvim_set_keymap('s', 'h', 'i<ESC>cwh', opts)
vim.api.nvim_set_keymap('s', 'l', 'i<ESC>cwl', opts)
vim.api.nvim_set_keymap('s', 'H', 'i<ESC>cwH', opts)
vim.api.nvim_set_keymap('s', 'L', 'i<ESC>cwL', opts)


-- C-c, 复制, C-v粘贴, C-x剪切, C-z撤销, C-a全选
mapkey('n', '<C-c>', '"+y')
mapkey('n', '<C-v>', '"+p')
mapkey('v', '<C-c>', '"+y')
mapkey('v', '<C-v>', '"+p')
mapkey('v', '<BS>', 'd')           -- v模式下，backspace就是删除一行
mapkey('v', '<C-x>', '"+x')
mapkey('n', '<C-z>', 'u')
vim.api.nvim_set_keymap('i', '<C-z>', '<ESC>u<ESC>i', opts)
vim.api.nvim_set_keymap('i', '<C-v>', '<ESC>"+p<ESC>a', opts)
vim.api.nvim_set_keymap('n', 'xa', ':xa<CR>', opts)   -- xa保存所有文件并退出
vim.api.nvim_set_keymap('i', '<C-s>', '<ESC>:w<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', opts)
vim.api.nvim_set_keymap('s', '<C-s>', '<ESC>:w<CR>', opts)

-- C-a，开头，C-e结尾
vim.api.nvim_set_keymap('i', '<C-a>', '<ESC>^i', opts)
vim.api.nvim_set_keymap('i', '<C-e>', '<ESC>A', opts)
vim.api.nvim_set_keymap('n', '<C-a>', '<ESC>^', opts)
vim.api.nvim_set_keymap('n', '<C-e>', '<ESC>$', opts)

        -- hello
-- tab, shift-tab回退
mapkey('n', '<tab>', 'v>')
mapkey('n', '<s-tab>', 'v<')
mapkey('v', '<tab>', '>gv')
mapkey('v', '<s-tab>', '<gv')

-- <Enter>空出一行
mapkey('n', '<CR>', 'o<ESC>')

-- NvimTree
mapcmd('<leader>nt', 'NvimTreeToggle')
mapcmd('<leader>nf', 'NvimTreeFocus')

-- Telescope
-- 寻找文件
-- C-c关闭, C-n下一项，C-p上一项
mapcmd('<leader>o', "Telescope find_files")
mapcmd('<leader>lt', "Telescope live_grep")     -- 众多文件中查找单词
-- 切换文件
mapcmd('<leader>b', "Telescope buffers")

-- 切换窗口
mapkey('n', '<C-h>', '<C-w>h')
mapkey('n', '<C-j>', '<C-w>j')
mapkey('n', '<C-k>', '<C-w>k')
mapkey('n', '<C-l>', '<C-w>l')

-- 切换标签
mapcmd('<C-RIGHT>', 'bn')
mapcmd('<C-LEFT>', 'bp')
-- 关闭标签页
mapcmd('<C-w>', 'Bdelete')
vim.api.nvim_set_keymap('i', '<C-RIGHT>', '<ESC>:w<ESC>:bn<cr>', opts)
vim.api.nvim_set_keymap('i', '<C-LEFT>', '<ESC>:w<ESC>:bp<cr>', opts)


-- 插件管理
mapcmd('<leader>pi', 'PackerInstall')
mapcmd('<leader>pc', 'PackerClean')
mapcmd('<leader>ps', 'PackerSync')

-- 搜索
mapkey('n', '<leader>s', '/')
-- mapkey('n', '<leader>sw', '/\\<lt>\\><left><left>')
mapkey('n', '<leader>c', ':')

-- 浮动终端
mapcmd('<C-t>', 'FloatermToggle')
vim.api.nvim_set_keymap('t', '<C-t>', ':FloatermToggle<CR>', opts)

-- 退出
vim.api.nvim_set_keymap('t', '<C-q>', ':q!<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-q>', ':q!<CR>', opts)

-- 注释
mapcmd('<C-/>', 'CommentToggle')
vim.api.nvim_set_keymap('v', '<C-/>', ':CommentToggle<CR>', opts)
vim.api.nvim_set_keymap('i', '<C-/>', '<ESC>:CommentToggle<CR><ESC>i', opts)

-- lsp快捷键
vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

-- gi就是定义(实现)的地方，gd就是声明的地方
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', '<2-LeftMouse>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('i', '<2-LeftMouse>', '<cmd>lua vim.lsp.bu.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

-- vista.vim
mapcmd('<F4>', 'Vista!!')

-- asynctasks, asyncrun
mapcmd('<F5>', 'AsyncTask file-run')
mapcmd('<F9>', 'AsyncTask file-build')


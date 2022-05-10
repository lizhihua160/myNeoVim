-- https://github.com/akinsho/bufferline.nvim#configuration
require 'bufferline'.setup {
    options = {
    -- 关闭 Tab 的命令
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        -- 侧边栏配置
        -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
        },
    },
}

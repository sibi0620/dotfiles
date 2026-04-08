vim.pack.add {
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/y9san9/y9nika.nvim',
    --'https://github.com/wakatime/vim-wakatime',
    'https://github.com/brenoprata10/nvim-highlight-colors',
    'https://github.com/folke/tokyonight.nvim',    -- Tokyonight (Neovim)
    'https://github.com/EdenEast/nightfox.nvim',   -- Nightfox (Neovim)
    'https://github.com/joshdick/onedark.vim',     -- OneDark for Vim
    'https://github.com/dracula/vim',              -- Dracula
    'https://github.com/arcticicestudio/nord-vim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/ej-shafran/compile-mode.nvim',
}

vim.cmd.packadd('cfilter')
vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')


vim.g.mapleader = ' '
vim.opt.clipboard = "unnamedplus"
vim.opt.autochdir = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
--vim.opt.colorcolumn = '80'
--vim.opt.textwidth = 80
vim.opt.completeopt = 'menu,menuone,fuzzy,noinsert'
vim.opt.swapfile = false
vim.opt.confirm = true
vim.opt.linebreak = true
vim.opt.termguicolors = true
vim.opt.wildoptions:append { 'fuzzy' }
vim.opt.path:append { '**' }
vim.opt.smoothscroll = true
vim.opt.grepprg = 'rg --vimgrep --no-messages --smart-case'
vim.opt.statusline = '[%n] %<%f %h%w%m%r%=%-14.(%l,%c%V%) %P'

---@module "compile-mode"
---@type CompileModeOpts
vim.g.compile_mode = {
    -- The string to show in the compile prompt as a default.
    -- For an empty prompt, you can use:
    -- default_command = "",
    -- To use different defaults based on filetype, you can use a table:
     default_command = {
       python = "python3 %",
       lua = "lua %",
       javascript = "bun %",
       typescript = "bun %",
       c = "cc -Wall -Wextra -o %:r % && ./%:r",
       cpp = "cc -std=c++23 -o %:r % && ./%:r",
       java = "javac % && java %:r",
       go = "go run %",
     },
    -- A function which returns the default command string is also supported:
    -- default_command = function()
    --   local filetype = vim.bo.filetype
    --   if filetype == "python" then
    --     return "python %"
    --   else
    --     return "make -k "
    --   end
    -- end,
    -- :h compile_mode.default_command
    --default_command = "make -k ",
    -- Use `baleia` for parsing ANSI escape codes in the output.
    -- :h compile_mode.baleia_setup
    baleia_setup = false,
    -- Expand commands, like `:!` (e.g. `:Compile echo %`)
    -- :h compile_mode.bang_expansion
    --bang_expansion = false,
    -- Configure additional entering/leaving directory regexes.
    -- :h compile-mode.directory_change_matchers
    directory_change_matchers = {},
    -- Configure additional error regexes.
    -- :h compile-mode-errors
    --error_regexp_table = {},
    -- List of filename regexes to ignore errors from.
    -- :h compile-mode.error_ignore_file_list
    --error_ignore_file_list = {},
    -- The minimum error level to jump to.
    -- :h compile-mode.error_threshold
    error_threshold = require("compile-mode").level.WARNING,
    -- Automatically jump to the first error.
    -- :h compile-mode.auto_jump_to_first_error
    auto_jump_to_first_error = true,
    -- How long to highlight an error's location when jumping to it.
    -- :h compile-mode.error_locus_highlight
    error_locus_highlight = 500,
    -- Use Neovim diagnostics instead of opening the compilation buffer.
    -- :h compile-mode.use_diagnostics
    use_diagnostics = false,
    -- Default to calling `:Compile` for `:Recompile`
    -- when there's no previous command.
    -- :h compile-mode.recompile_no_fail
    recompile_no_fail = true,
    -- Ask to save unsaved buffers before compiling.
    -- :h compile-mode.ask_about_save
    ask_about_save = true,
    -- Ask to interrupt already running commands.
    -- :h compile-mode.ask_to_interrupt
    ask_to_interrupt = false,
    -- The name for the compilation buffer.
    -- :h compile-mode.buffer_name
    buffer_name = "*compilation*",
    -- The format for the time information
    -- at the top of the compilation buffer
    -- :h compile-mode.time_format
    time_format = "%a %b %e %H:%M:%S",
    -- List of regexes to hide from the output.
    -- :h compile-mode.hidden_output
    --hidden_output = {},
    -- A table of environment variables to pass to commands.
    -- :h compile-mode.environment
    environment = nil,
    -- Clear all environment variables for each command.
    -- :h compile-mode.clear_environment
    clear_environment = false,
    -- Fix compilation for plugins like `nvim-cmp`.
    -- :h compile-mode.input_word_completion
    input_word_completion = true,
    -- Hide the compliation buffer.
    -- :h compile-mode.hidden_buffer
    hidden_buffer = false,
    -- Automatically focus the compilation buffer.
    -- :h compile-mode.focus_compilation_buffer
    focus_compilation_buffer = false,
    -- Automatically move the cursor to the end of the compilation buffer.
    -- :h compile-mode.auto_scroll
    auto_scroll = false,
    -- Jump back past the end/beginning of the errors
    -- with `:NextError`/`:PrevError`
    -- :h compile-mode.use_circular_error_navigation
    use_circular_error_navigation = false,
    -- Print debug information.
    -- :h compile-mode.debug
    debug = false,
    -- Use a pseudo terminal for command execution.
    -- :h compile-mode.use_pseudo_terminal
    use_pseudo_terminal = false,
}


map = vim.keymap.set 

map("n", "<leader>w", ":write<CR>")
map("n", "<leader>q", ":quit<CR>")
map("n", "<leader>Q", ":quit!<CR>")
--map("n", "<leader>e", ":Oil<CR>")
map("n", "<C-z>", ":buffers<CR>")
map("n", "<C-x>", ":buffer")
map("i", "<A-,>", "<ESC>")
map({"n", "i"}, "<A-h>", ":below term<CR>i")
map("n", "<leader>v", ":edit $MYVIMRC<CR>")
map("n", "<leader>ff", ":find ")
map("n", "<leader>fg", ":Grep ")
map("n", "<leader>r", ":make!<CR>")
map("n", "<leader>R", ":set makeprg=")
map("n", "<leader>x", ":copen<CR>")
map("n", "<leader>c", ":!ctags -R .<CR>")
map({"n", "i"}, "<A-a>", ":below Compile<CR>" )
vim.cmd.colorscheme('nightfox')

-- disable mouse popup yet keep mouse enabled
vim.cmd [[
  aunmenu PopUp
  autocmd! nvim.popupmenu
]]

-- Only highlight with treesitter
vim.cmd('syntax on')

require("nvim-highlight-colors").setup {
    render = 'virtual',
    virtual_symbol = '⚫︎',
    virtual_symbol_suffix = '',
}
require('oil').setup {
    keymaps = { ['<C-h>'] = false },
    columns = { 'size', 'mtime' },
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
}

-- Keymaps

vim.keymap.set('n', '<leader><leader>', ':Oil<CR>', { silent = true })

vim.keymap.set('n', '<leader>a', function()
    vim.cmd('$argadd %')
    vim.cmd('argdedup')
end)
vim.keymap.set('n', '<C-h>', function() vim.cmd('silent! 1argument') end)
vim.keymap.set('n', '<C-j>', function() vim.cmd('silent! 2argument') end)
vim.keymap.set('n', '<C-k>', function() vim.cmd('silent! 3argument') end)
vim.keymap.set('n', '<C-n>', function() vim.cmd('silent! 4argument') end)
vim.keymap.set('n', '<C-m>', function() vim.cmd('silent! 5argument') end)

-- Autocommands

vim.api.nvim_create_autocmd('FileType', {
    callback = function() pcall(vim.treesitter.start) end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.o.signcolumn = 'yes:1'
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.o.complete = 'o,.,w,b,u'
            vim.o.completeopt = 'menu,menuone,popup,noinsert'
            vim.lsp.completion.enable(true, client.id, args.buf)
        end
    end
})

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
})

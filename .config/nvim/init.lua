-- Set <space> as the leader key
vim.g.mapleader = ' '

-- Disable unused providers to silence checkhealth warnings
vim.g.loaded_node_provider    = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider    = 0
vim.g.loaded_ruby_provider    = 0

-- OPTIONS
vim.o.number         = true
vim.o.relativenumber = true
vim.o.ignorecase     = true
vim.o.smartcase      = true
vim.o.cursorline     = true
vim.o.scrolloff      = 10
vim.o.list           = true
vim.o.confirm        = true
vim.o.termguicolors  = true
vim.cmd.colorscheme('arcoiris')

-- Sync clipboard after UI loads to avoid startup slowdown
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- KEYMAPS

-- Exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Navigate between windows from any mode with Alt+hjkl
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

-- AUTOCOMMANDS

-- Flash yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  callback = function() vim.hl.on_yank() end,
})

-- USER COMMANDS

-- Print git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.')
  local filename    = vim.api.nvim_buf_get_name(0)
  print(vim.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }):wait().stdout)
end, { desc = 'Print the git blame for the current line' })

-- Use GNU find instead of macOS BSD find
vim.env.PATH = '/opt/homebrew/opt/findutils/libexec/gnubin:' .. vim.env.PATH

-- PLUGINS

vim.cmd('packadd! nohlsearch')

vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/nvim-mini/mini.completion',
  'https://github.com/stevearc/quicker.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/stevearc/conform.nvim',
})

-- Helper: safely call plugin.setup(), silently skip if not yet installed
local function setup(mod, opts)
  local ok, plugin = pcall(require, mod)
  if ok then plugin.setup(opts or {}) end
end

-- ── fzf-lua ────────────────────────────────────────────────────────
setup('fzf-lua', { fzf_colors = true })
vim.keymap.set('n', '<leader>ff', function() require('fzf-lua').files()                 end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', function() require('fzf-lua').live_grep()             end, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', function() require('fzf-lua').buffers()               end, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', function() require('fzf-lua').helptags()              end, { desc = 'Help tags' })
vim.keymap.set('n', '<leader>fd', function() require('fzf-lua').diagnostics_workspace() end, { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>fs', function() require('fzf-lua').lsp_document_symbols()  end, { desc = 'LSP symbols' })
vim.keymap.set('n', '<leader>fr', function() require('fzf-lua').lsp_references()        end, { desc = 'LSP references' })

-- ── other plugins ──────────────────────────────────────────────────
setup('mini.completion')
setup('quicker')
setup('gitsigns')

-- ── treesitter ─────────────────────────────────────────────────────
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})

-- ── conform (formatting) ───────────────────────────────────────────
setup('conform', {
  formatters_by_ft = {
    rust   = { 'rustfmt' },
    python = { 'ruff_fix', 'ruff_organize_imports', 'ruff_format' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
})

-- ── LSP ────────────────────────────────────────────────────────────
-- rust_analyzer: rustup component add rust-analyzer
-- pyright:       npm install -g pyright
vim.lsp.enable({ 'rust_analyzer', 'pyright' })

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Set LSP keymaps',
  callback = function(ev)
    local map = function(key, fn, desc)
      vim.keymap.set('n', key, fn, { buffer = ev.buf, desc = desc })
    end
    map('gd',         vim.lsp.buf.definition,     'Go to definition')
    map('gD',         vim.lsp.buf.declaration,    'Go to declaration')
    map('gr',         vim.lsp.buf.references,     'Go to references')
    map('gi',         vim.lsp.buf.implementation, 'Go to implementation')
    map('K',          vim.lsp.buf.hover,          'Hover docs')
    map('<leader>rn', vim.lsp.buf.rename,         'Rename symbol')
    map('<leader>ca', vim.lsp.buf.code_action,    'Code action')
    map('[d',         vim.diagnostic.goto_prev,   'Prev diagnostic')
    map(']d',         vim.diagnostic.goto_next,   'Next diagnostic')
    map('<leader>e',  vim.diagnostic.open_float,  'Show diagnostic')
  end,
})

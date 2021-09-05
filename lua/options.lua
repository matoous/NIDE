local cmd = vim.cmd
local opt = vim.opt
local has = vim.fn.has

cmd('filetype plugin indent on')
cmd('syntax enable')

-- systematic
opt.autoread = true
opt.backup = false -- no .bak
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.fileencodings = { 'utf-8' }
opt.fileformat = 'unix'
opt.lazyredraw = true -- redraw only when needed
opt.swapfile = false -- no .swap
opt.ttyfast = true
opt.undofile = true -- use undo file
opt.updatetime = 300 -- time (in ms) to write to swap file

-- buffer
opt.autoindent = true -- auto indent for new line
opt.expandtab = true -- expand tab
opt.shiftwidth = 4 -- auto indent shift width
opt.softtabstop = 4 -- soft tab stop
opt.tabstop = 4 -- tab stop

-- window
opt.number = true -- show line numbers in gutter
opt.relativenumber = true -- show them relative to cursor

-- editing
opt.backspace = { 'indent', 'eol', 'start' } -- backspace behaviors
opt.clipboard = 'unnamedplus' -- system clipboard by default
opt.colorcolumn = { 120 } -- display a color column when line is longer than 120 chars
opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
opt.grepprg = 'rg --vimgrep --smart-case --follow' -- user rigrep for search
opt.hidden = true
opt.hlsearch = true -- highlight search
opt.ignorecase = true -- ignore case when searching
opt.inccommand = 'nosplit' -- live substitute preview
opt.incsearch = true -- search as you type
opt.mouse = 'nv' -- enable mouse under normal and visual mode
opt.ruler = true -- show ruler line
opt.shortmess:append('c') -- status line e.g. CTRL+G
opt.showcmd = true -- show command in bottom bar
opt.showmatch = true -- show bracket match
opt.signcolumn = 'yes' -- show sign column (column of the line number)
opt.smartcase = true -- search case-sensitive only if search query contains uppercase
opt.splitbelow = true -- split to below
opt.splitright = true -- split to right
opt.visualbell = true -- visual bell instead of sound
opt.whichwrap = 'b,s,<,>,[,]' -- cursor is able to move from end of line to next line
opt.wildmenu = true -- wildmenu, auto complete for commands
opt.wildmode = { 'longest', 'full' }

-- history
opt.history = 10000
opt.undolevels = 1000

-- folding
opt.foldenable = true
opt.foldlevelstart = 10
opt.foldnestmax = 10
opt.scrolloff = 10
opt.softtabstop = 4

-- color scheme
if has('termguicolors') then
    cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
    cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
    opt.termguicolors = true
end


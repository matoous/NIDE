local cmd = vim.cmd
local opt = vim.opt
local has = vim.fn.has

cmd('filetype plugin indent on')
cmd('syntax enable')

-- systematic
opt.fileformat = 'unix'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.fileencodings = { 'utf-8' }
opt.backup = false -- no .bak
opt.swapfile = false -- no .swap
opt.undofile = true -- use undo file
opt.updatetime = 300 -- time (in ms) to write to swap file
opt.lazyredraw = true -- redraw only when needed
opt.ttyfast = true

-- buffer
opt.expandtab = true -- expand tab
opt.tabstop = 4 -- tab stop
opt.softtabstop = 4 -- soft tab stop
opt.autoindent = true -- auto indent for new line
opt.shiftwidth = 4 -- auto indent shift width

-- window
opt.number = true
opt.relativenumber = true

-- editing
opt.whichwrap = 'b,s,<,>,[,]' -- cursor is able to move from end of line to next line
opt.backspace = { 'indent', 'eol', 'start' } -- backspace behaviors
opt.ignorecase = false -- search with no ignore case
opt.hlsearch = true -- highlight search
opt.incsearch = true
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true
opt.inccommand = 'nosplit' -- live substitute preview
opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
opt.hidden = true
opt.ruler = true -- show ruler line
opt.colorcolumn = { 120 } -- display a color column when line is longer than 120 chars
opt.signcolumn = 'yes' -- show sign column (column of the line number)
opt.mouse = 'nv' -- enable mouse under normal and visual mode
opt.showmatch = true -- show bracket match
opt.showcmd = true -- show command in bottom bar
opt.cmdheight = 2 -- height of :command line
opt.wildmenu = true -- wildmenu, auto complete for commands
opt.wildmode = { 'longest', 'full' }
opt.splitright = true -- split to right
opt.splitbelow = true -- split to below
opt.shortmess:append('c') -- status line e.g. CTRL+G
opt.visualbell = true -- visual bell instead of sound
opt.clipboard = 'unnamedplus' -- system clipboard by default
opt.grepprg = 'rg --vimgrep --smart-case --follow' -- user rigrep for search

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


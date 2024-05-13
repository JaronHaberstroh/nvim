local options = {
  wrap = false,

  -- relative numbers
  relativenumber = true,
  number = true,
  
  -- tabs and indentation
  tabstop = 2, -- 2 spaces for tabs
  shiftwidth = 2, -- 2 spaces for indent width
  expandtab = true, -- expands tab to spaces
  autoindent = true, --copy indent from current line when starting new one

  -- search settings
  ignorecase = true, -- ignore case when searching
  smartcase = true, -- including mixed case, assumes you want case-sensitive

  -- backspace
  backspace = "indent,eol,start", -- allow backspace on indent, end of line, or insert mode start position

  -- split windows
  splitright = true, -- split vertical window to the right
  splitbelow = true, -- split horizontal window to the bottow

  -- other stuff
  termguicolors = true, -- enables 24bit RGB colors 
  cursorline = true, -- highlight cursor lign to make cursor easier to find
  background = "dark", -- tells vim that backround is dark 
  signcolumn = "yes", -- inserts sign column so text doesn't shift 
  wrap = false, -- stop text from wrapping onto new line
  swapfile = off, -- turn off swapfile
}

-- clipboard 
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

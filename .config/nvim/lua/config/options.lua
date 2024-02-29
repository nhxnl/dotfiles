local opt = vim.opt

opt.showmode = true
opt.nu = true
opt.rnu = true
opt.conceallevel = 0 -- show the ``
opt.cursorline = true
opt.winblend = 0
opt.wildmenu = true
opt.wildoptions = "pum"
opt.wildmode = "longest:full,full"
opt.pumheight = 10
opt.pumblend = 0
opt.incsearch = true
opt.showmatch = false
opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }
opt.autoindent = true
opt.smartindent = true
opt.wrap = false
opt.showcmd = true
opt.cmdheight = 1
opt.scrolloff = 10
opt.laststatus = 3
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.hlsearch = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.updatetime = 200
opt.timeoutlen = 300
opt.completeopt = "menuone,noselect,noinsert"
opt.termguicolors = true
opt.splitright = true
opt.splitbelow = true
opt.spelllang = "en_us"
opt.spell = false
opt.spelloptions = "camel"
opt.statuscolumn = [[%!v:lua.require'util.statuscol'.statuscolumn()]]
opt.foldlevel = 99
opt.foldmethod = "expr" -- treesiter
--opt.foldexpr = "nvim_treesitter#foldexpr()" -- treesiter
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = "v:lua.require'util.statuscol'.foldtext()"
opt.fillchars = require("config.icons").folds
opt.list = true
opt.listchars = { trail = "⋅", tab = "  ↦", nbsp = "␣", eol = "↲" }
opt.showbreak = "↳"
opt.path:append({ "**" }) -- search in subfolders
opt.wildignore:append({
	".git",
	"node_modules",
	"vendor",
	"build",
	"dist",
	"target",
	"tmp",
	".*.swp",
	"*.pyc",
	"*.class",
	"*.DS_Store",
	"*.gitignore",
	"*.gitmodules",
	"*.gitkeep",
	"*.hgignore",
	"*.hgsub",
	"*.hgsubstate",
	"*.hgtags",
	"*.svn",
	"*.svnignore",
	"*.cvsignore",
	"*.cvswrappers",
	"*.bzrignore",
})
opt.inccommand = "split"

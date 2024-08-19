local config = function()
  require("telescope").setup {
    defaults = {
      mappings = {
        i = {
          ["<C-u>"] = false,
          ["<C-d>"] = false,
        },
      },
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown(),
      },
    },
  }

  pcall(require("telescope").load_extension, "fzf")
  pcall(require("telescope").load_extension, "ui-select")
  pcall(require("telescope").load_extension, "yank_history")

  local function find_git_root()
    local current_file = vim.api.nvim_buf_get_name(0)
    local current_dir
    local cwd = vim.fn.getcwd()
    if current_file == "" then
      current_dir = cwd
    else
      current_dir = vim.fn.fnamemodify(current_file, ":h")
    end

    local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
    if vim.v.shell_error ~= 0 then
      print "Not a git repository. Searching on current working directory"
      return cwd
    end
    return git_root
  end

  local builtin = require "telescope.builtin"

  local function live_grep_git_root()
    local git_root = find_git_root()
    if git_root then
      builtin.live_grep {
        search_dirs = { git_root },
      }
    end
  end

  local map = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { desc = desc })
  end

  vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

  map("<leader>?", builtin.oldfiles, "[?] Find recently opened files")
  map("<leader><space>", builtin.buffers, "[ ] Find existing buffers")
  map("<leader>/", function()
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, "[/] Fuzzily search in current buffer")

  local function telescope_live_grep_open_files()
    builtin.live_grep {
      grep_open_files = true,
      prompt_title = "Live Grep in Open Files",
    }
  end

  map("<leader>s/", telescope_live_grep_open_files, "[S]earch [/] in Open Files")
  map("<leader>ss", builtin.builtin, "[S]earch [S]elect Telescope")
  map("<leader>gf", builtin.git_files, "Search [G]it [F]iles")
  map("<leader>sf", builtin.find_files, "[S]earch [F]iles")
  map("<leader>st", builtin.help_tags, "[S]earch [H]elp")
  map("<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
  map("<leader>sg", builtin.live_grep, "[S]earch by [G]rep")
  map("<leader>sG", ":LiveGrepGitRoot<cr>", "[S]earch by [G]rep on Git Root")
  map("<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
  map("<leader>sr", builtin.resume, "[S]earch [R]esume")

  map("<leader>sn", function()
    builtin.find_files { cwd = vim.fn.stdpath "config" }
  end, "[S]earch [N]eovim files")
end

return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  config = config,
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
}

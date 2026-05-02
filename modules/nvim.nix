{pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    colorschemes.catppuccin.enable = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      clipboard = "unnamedplus";
      updatetime = 500;
      colorcolumn = "120";
    };
    plugins = {
      # list of plugins
      lualine.enable = true;
      fzf-lua.enable = true;
      web-devicons.enable = true;
      friendly-snippets.enable = true;
      toggleterm.enable = true;
      bufferline.enable = true;
      nvim-autopairs.enable = true;

      # which-key
      which-key = {
        enable = true;

        settings = {
          preset = "helix";

          spec = [
            {
              mode = ["n" "x"];
              __unkeyed-1 = "<leader>f";
              group = "file/find";
            }
            {
              mode = ["n" "x"];
              __unkeyed-1 = "<leader><tab>";
              group = "tabs/buffers";
            }
          ];
        };
      };

      # completion
      blink-cmp = {
        enable = true;
        settings = {
          appearance = {
            nerd_font_variant = "normal";
          };
          keymap = {
            preset = "super-tab";
          };
          sources = {
            default = ["lsp" "path" "snippets" "buffer"];
          };
          completion = {
            list = {
              selection = {
                preselect = true;
                auto_insert = true;
              };
            };
          };
        };
      };

      # enable lsp
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true; # Nix
        };
      };

      # formatter
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            # set formatters
            nix = ["alejandra"];
          };
          format_on_save = {
            timeout_ms = 500;
            lsp_format = "fallback";
          };
        };
      };
    };

    autoCmd = [
      {
        event = ["CursorHold"];
        pattern = ["*"];
        callback = {
          __raw = ''
            function()
              vim.diagnostic.open_float(nil, {
                focusable = false,
                close_events = { "CursorMoved", "CursorMovedI", "BufLeave" },
                border = "rounded",
                source = "always",
                prefix = " ",
                scope = "cursor",
              })
            end
          '';
        };
      }
    ];

    keymaps = [
      # file picker
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd> FzfLua files <cr>";
        options = {
          silent = true;
          desc = "Find files";
        };
      }

      # buffer picker
      {
        mode = "n";
        key = "<leader>fd";
        action = "<cmd> FzfLua buffers <cr>";
        options = {
          silent = true;
          desc = "Find buffers";
        };
      }

      # live grep
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd> FzfLua live_grep <cr>";
        options = {
          silent = true;
          desc = "Find text (live grep)";
        };
      }

      # next buffer
      {
        mode = "n";
        key = "<leader><tab><tab>";
        action = "<cmd> bnext <cr>";
        options = {
          silent = true;
          desc = "Next buffer";
        };
      }

      # previous buffer
      {
        mode = "n";
        key = "<leader><tab>e";
        action = "<cmd> bprevious <cr>";
        options = {
          silent = true;
          desc = "Previous buffer";
        };
      }

      # next buffer
      {
        mode = "n";
        key = "<leader><tab>r";
        action = "<cmd> bnext <cr>";
        options = {
          silent = true;
          desc = "Next buffer";
        };
      }

      # toggle terminal
      {
        mode = "n";
        key = "<C-/>";
        action = "<cmd> ToggleTerm <cr>";
        options = {
          silent = true;
          desc = "Terminal";
        };
      }
      {
        mode = "t";
        key = "<C-/>";
        action = "<C-\\><C-n><cmd> ToggleTerm <cr>";
        options = {
          silent = true;
          desc = "Terminal";
        };
      }

      # press esc twice to exit terminal mode
      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
        options = {
          silent = true;
          desc = "Switch to normal mode with double-Esc in Terminal mode.";
        };
      }
    ];
  };
}

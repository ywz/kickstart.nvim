return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    vim.opt.laststatus = 3
    -- Custom Lualine component to show attached language server
    local clients_lsp = function()
      -- local bufnr = vim.api.nvim_get_current_buf()

      local clients = vim.lsp.get_clients()
      if next(clients) == nil then
        return ''
      end

      local c = {}
      local copilot_name = ' '
      for _, client in pairs(clients) do
        if string.find(client.name, 'Copilot') then
          table.insert(c, copilot_name)
        else
          table.insert(c, client.name)
        end
      end
      -- sort c putting Copilot at the end
      table.sort(c, function(a, b)
        if a == copilot_name then
          return false
        elseif b == copilot_name then
          return true
        end
        return a < b
      end)
      return '  ' .. table.concat(c, ' ⋮ ')
    end

    -- local custom_catppuccin = require 'lualine.themes.catppuccin'

    -- Custom colours
    -- custom_catppuccin.normal.b.fg = '#cad3f5'
    -- custom_catppuccin.insert.b.fg = '#cad3f5'
    -- custom_catppuccin.visual.b.fg = '#cad3f5'
    -- custom_catppuccin.replace.b.fg = '#cad3f5'
    -- custom_catppuccin.command.b.fg = '#cad3f5'
    -- custom_catppuccin.inactive.b.fg = '#cad3f5'
    --
    -- custom_catppuccin.normal.c.fg = '#6e738d'
    -- custom_catppuccin.normal.c.bg = '#1e2030'

    require('lualine').setup {
      options = {
        -- theme = custom_catppuccin,
        component_separators = '',
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'Outline', 'NVimTree' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = ' ', right = '' }, icon = '' },
        },
        lualine_b = {
          {
            'branch',
            icon = '',
          },
          {
            'diff',
            symbols = { added = ' ', modified = ' ', removed = ' ' },
            colored = false,
          },
        },
        lualine_c = {
          -- {
          --   'filetype',
          --   colored = false,
          --   icon_only = true,
          --   padding = { left = 1, right = 0 },
          -- },
          {
            'filename',
            path = 4,
          },
        },
        lualine_x = {
          'encoding',
          -- {
          --   'fileformat',
          --   symbols = {
          --     unix = '',
          --     dos = '',
          --     mac = '',
          --   },
          -- },
        },
        lualine_y = {
          {
            'diagnostics',
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            update_in_insert = true,
          },
          clients_lsp,
        },
        lualine_z = {
          { 'location', separator = { left = '', right = ' ' }, icon = '' },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      extensions = { 'toggleterm', 'trouble' },
    }
  end,
}

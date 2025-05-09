return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function()
    return {
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode', icon = '', separator = { left = '' }, right_padding = 2 } },
        lualine_b = {
          'branch',
        },
        lualine_c = {
          {
            'filename',
            icon = '',
          },
          '%=' --[[ add your center components here in place of this comment ]],
        },
        lualine_x = {
          -- 'encoding',
          {
            'location',
            left_padding = 0,
          },
        },
        lualine_y = {
          -- {
          --   'filetype',
          --   colored = false, -- Displays filetype icon in color if set to true
          --   icon_only = false, -- Display only an icon for filetype
          --   icon = { align = 'left' }, -- Display filetype icon on the right hand side
          --   -- icon = { 'X', align = 'right' },
          --   -- Icon string ^ in table is ignored in filetype component
          -- },
          -- { 'progress' },
          {
            'fileformat',
            symbols = {
              unix = '', -- e712
              dos = '', -- e70f
              mac = '', -- e711
            },
            -- separator = { right = '', left = '' },
            left_padding = 20,
          },
        },
        lualine_z = {
          {
            -- 'location',
            'encoding',
            separator = { right = '' },
            left_padding = 2,
          },
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
      tabline = {},
      extensions = {},
    }
  end,
}

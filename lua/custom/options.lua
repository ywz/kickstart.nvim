-- clipboard
-- vim.opt.clipboard:append 'unnamedplus'

-- cursor blink
vim.opt.guicursor = {
  'n-v-c:block',
  'i-ci-ve:ver25',
  'r-cr:hor20',
  'o:hor50',
  'a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor',
  'sm:block-blinkwait175-blinkoff150-blinkon175',
}

-- Lazy
vim.api.nvim_set_keymap('n', '<leader>l', ':Lazy<CR>', { noremap = true, silent = true })

-- format json
function FormatJson(inline)
  local inline_arg = ''
  if inline then
    inline_arg = '-c'
  end
  local command = '%!jq ' .. inline_arg
  vim.api.nvim_command(command)
  vim.api.nvim_command 'set syntax=JSON'
end
vim.api.nvim_set_keymap('n', '<leader>jf', ':lua FormatJson(false)<CR>', { noremap = true, silent = true, desc = 'Format JSON (Indented)' })
vim.api.nvim_set_keymap('n', '<leader>jc', ':lua FormatJson(true)<CR>', { noremap = true, silent = true, desc = 'Format JSON (Compact)' })

-- tab options
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- run python
function run_python()
  vim.cmd '!python3 %'
end
vim.api.nvim_set_keymap('n', '<leader>jy', ':lua run_python()<CR>', { noremap = true, silent = true, desc = 'Run Python File' })

-- render-markdown
-- require('render-markdown').setup {
--   completions = { blink = { enabled = true } },
-- }

--leap
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')

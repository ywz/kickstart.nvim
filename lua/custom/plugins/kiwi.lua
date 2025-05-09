return {
  'serenevoid/kiwi.nvim',
  opts = {
    {
      name = 'work',
      path = '/Users/wz/Documents/kiwi/work/',
    },
    {
      name = 'personal',
      path = '/Users/wz/Documents/kiwi/personal/',
    },
  },
  keys = {
    { '<leader>ww', ':lua require("kiwi").open_wiki_index("work")<cr>', desc = 'Open Wiki index' },
    { '<leader>wp', ':lua require("kiwi").open_wiki_index("personal")<cr>', desc = 'Open index of personal wiki' },
    { 'T', ':lua require("kiwi").todo.toggle()<cr>', desc = 'Toggle Markdown Task' },
  },
  lazy = true,
}

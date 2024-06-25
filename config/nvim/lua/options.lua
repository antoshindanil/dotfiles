local langmap_keys     = {
  'ёЁ;`~', '№;#',
  'йЙ;qQ', 'цЦ;wW', 'уУ;eE', 'кК;rR', 'еЕ;tT', 'нН;yY', 'гГ;uU', 'шШ;iI', 'щЩ;oO', 'зЗ;pP', 'хХ;[{', 'ъЪ;]}',
  'фФ;aA', 'ыЫ;sS', 'вВ;dD', 'аА;fF', 'пП;gG', 'рР;hH', 'оО;jJ', 'лЛ;kK', 'дД;lL', [[жЖ;\;:]], [[эЭ;'\"]],
  'яЯ;zZ', 'чЧ;xX', 'сС;cC', 'мМ;vV', 'иИ;bB', 'тТ;nN', 'ьЬ;mM', [[бБ;\,<]], 'юЮ;.>',
}

vim.o.langmap          = table.concat(langmap_keys, ',')
vim.g.mapleader        = " "
vim.g.undofile         = true
vim.g.maplocalleader   = "\\"
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.expandtab      = true
vim.opt.smarttab       = true
vim.opt.smartindent    = true
vim.opt.softtabstop    = 2
vim.opt.tabstop        = 2
vim.opt.shiftwidth     = 2
vim.opt.colorcolumn    = { 120 }
vim.opt.cmdheight      = 0

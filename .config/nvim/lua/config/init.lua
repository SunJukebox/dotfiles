local cfg = {}

for _, v in ipairs {
  "autocmd",
  "commands",
  "treesitter",
} do cfg[v] = require("config." .. v) end

return cfg

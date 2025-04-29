return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = true,
  init = function()
    local Rule = require("nvim-autopairs.rule")
    local npairs = require("nvim-autopairs")

    local cond = require("nvim-autopairs.conds")

    npairs.add_rules({
        Rule("$", "$", { "tex", "latex" })
            :with_pair(cond.not_after_regex("%%"))
            :with_pair(cond.not_before_regex("xxx", 3))
            :with_move(cond.after_text("$") and cond.not_before_char("$"))
            :with_del(cond.not_after_regex("xx"))
            :with_cr(cond.none())
      },
      Rule("a", "a", "-vim")
    )
  end
}

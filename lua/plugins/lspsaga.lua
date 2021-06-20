local saga = require 'lspsaga'

saga.init_lsp_saga {
    use_saga_diagnostic_sign = true,
    code_action_icon = '💡',
    code_action_prompt = {
      enable = true,
      sign = true,
      sign_priority = 20,
      virtual_text = true,
    },
    border_style = "round",
}


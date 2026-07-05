local config = require('lspconfig')

config.rust_analyzer.setup {
    settings = {
        ['rust_analyzer'] = {
            diagnostics = {
                enable = true
            }
        }
    }
}

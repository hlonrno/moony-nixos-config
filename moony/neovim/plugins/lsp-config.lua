require('lspconfig').rust_analyzer.setup {
    settings = {
        ['rust_analyzer'] = {
            diagnostics = {
                enable = true
            }
        }
    }
}

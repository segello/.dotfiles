-- Set the border style for all floating windows
local border_style = "rounded"  -- Options: "single", "double", "rounded", etc.

-- Apply the rounded border globally for LSP floating windows
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = border_style,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = border_style,
})

vim.diagnostic.config({
    float = {
        border = border_style,
    },
})


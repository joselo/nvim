function LspDiagnostics()
    local error_count = #vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR })
    local warn_count = #vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.WARN })
    local hint_count = #vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.HINT })
    local info_count = #vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.INFO })

    return string.format("E:%d W:%d H:%d I:%d", error_count, warn_count, hint_count, info_count)
end

vim.o.statusline = "%f %h%m%r%=%{v:lua.LspDiagnostics()} %l,%c"

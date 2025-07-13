return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            "pyright",
            "mypy",
            "black",
            "debugpy",
            "clangd",
            "clang-format",
            "codelldb",
            "zls",
        },
    },
}

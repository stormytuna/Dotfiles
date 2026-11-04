local icon_hl = {
    File = "Normal",
    Module = "Include",
    Namespace = "Include",
    Package = "Include",
    Class = "Type",
    Method = "Function",
    Property = "Identifier",
    Field = "Identifier",
    Constructor = "Function",
    Enum = "Type",
    Interface = "Type",
    Function = "Function",
    Variable = "Identifier",
    Constant = "Constant",
    String = "String",
    Number = "Number",
    Boolean = "Boolean",
    Array = "Type",
    Object = "Type",
    Key = "Identifier",
    Null = "Constant",
    EnumMember = "Identifier",
    Struct = "Type",
    Event = "Special",
    Operator = "Operator",
    TypeParameter = "Type",
}

return {
    "SmiteshP/nvim-navic",
    opts = {
        separator = " > ",
        highlight = true,
        depth_limit = 5,
        lsp = {
            auto_attach = true,
            preference = { "ts_ls", "angularls" },
        },
    },
    config = function(_, opts)
        require("nvim-navic").setup(opts)

        for kind, link in pairs(icon_hl) do
            vim.api.nvim_set_hl(0, "NavicIcons" .. kind, { link = link, default = true })
        end
        vim.api.nvim_set_hl(0, "NavicText", { link = "Normal", default = true })
        vim.api.nvim_set_hl(0, "NavicSeparator", { link = "NonText", default = true })
    end,
}

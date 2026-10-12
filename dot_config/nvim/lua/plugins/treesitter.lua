return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'angular', 'bash', 'c_sharp', 'css', 'csv', 'diff', 'editorconfig', 'go', 'gotmpl', 'hjson', 'html', 'java', 'javascript', 'json', 'lua', 'markdown', 'nix', 'nu', 'python', 'regex', 'rust', 'scss', 'toml', 'typescript', 'typespec', 'vue', 'xml', 'yaml', 'zig',
    },
  }
}

local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.code_actions.eslint,
  b.code_actions.eslint_d,
  b.code_actions.gitrebase,
  b.code_actions.gitsigns,
  b.code_actions.shellcheck,
  b.completion.luasnip,
  b.completion.tags,
  b.completion.vsnip,
  b.diagnostics.alex,
  b.diagnostics.cfn_lint,
  b.diagnostics.checkmake,
  b.diagnostics.clang_check,
  b.diagnostics.cmake_lint,
  b.diagnostics.commitlint,
  b.diagnostics.cppcheck,
  b.diagnostics.cpplint,
  b.diagnostics.dotenv_linter,
  b.diagnostics.eslint,
  b.diagnostics.gccdiag,
  b.diagnostics.gitlint,
  b.diagnostics.jsonlint,
  b.diagnostics.luacheck,
  b.diagnostics.markdownlint_cli2,
  b.diagnostics.pycodestyle,
  b.diagnostics.pydocstyle,
  b.diagnostics.pylama,
  b.diagnostics.pylint,
  b.diagnostics.shellcheck,
  b.diagnostics.solhint,
  b.diagnostics.sqlfluff,
  b.diagnostics.stylelint,
  b.diagnostics.tidy,
  b.diagnostics.tsc,
  b.diagnostics.yamllint,
  b.diagnostics.zsh,
  b.formatting.astyle,
  b.formatting.cmake_format,
  b.formatting.clang_format,
  b.formatting.eslint,
  b.formatting.json_tool,
  b.formatting.jq,
  b.formatting.lua_format,
  b.formatting.markdownlint,
  b.formatting.packer,
  b.formatting.prettier,
  b.formatting.rustfmt,
  b.formatting.scalafmt,
  b.formatting.stylua,
  b.formatting.shfmt,
  b.formatting.sqlformat,
  b.formatting.trim_newlines,
  b.formatting.trim_whitespace,
  b.formatting.yamlfmt,
  b.hover.dictionary
}

null_ls.setup {
  debug = true,
  sources = sources,
}

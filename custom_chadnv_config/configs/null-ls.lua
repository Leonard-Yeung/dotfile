local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
  b.code_actions.cspell,
  b.code_actions.eslint,
  b.code_actions.shellcheck,
  b.completion.luasnip,
  -- b.diagnostics.cpplint,
  -- b.diagnostics.eslint,
  -- b.diagnostics.jsonlint,
  -- b.diagnostics.luacheck,
  -- b.diagnostics.markdownlint,
  -- b.diagnostics.php,
  -- b.diagnostics.pylint,
  -- b.diagnostics.shellcheck,
  -- b.diagnostics.solhint,
  -- b.diagnostics.terraform_validate,
  -- b.diagnostics.todo_comments,
  -- b.diagnostics.trail_space,
  -- b.diagnostics.yamllint,
  b.formatting.asmfmt,
  b.formatting.clang_format,
  b.formatting.cmake_format,
  b.formatting.eslint,
  b.formatting.json_tool,
  b.formatting.lua_format,
  b.formatting.markdownlint,
  b.formatting.scalafmt,
  b.formatting.shfmt,
  b.formatting.terrafmt,
  b.formatting.yamlfmt,
}

null_ls.setup {
  debug = true,
  sources = sources,
}

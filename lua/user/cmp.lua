local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },

  formatting = {
    format = function(entry, vim_item)
       -- load lspkind icons
       vim_item.kind = string.format(
          "%s %s",
          require("user.lspkind_icons").icons[vim_item.kind],
          vim_item.kind
       )

       vim_item.menu = ({
          nvim_lsp = "[LSP]",
          nvim_lua = "[api]",
          buffer = "[buf]",
          luasnip = "[LuaSnip]",
          cmp_tabnine = "[TabNine]",
       })[entry.source.name]

       return vim_item
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-l>'] = cmp.mapping.confirm({ select = false }),
    ["<C-j>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      fallback()
    end
    end, { "i", "s" }),
    ["<C-k>"] = cmp.mapping(function()
    if cmp.visible() then
            cmp.select_prev_item()
    end
    end, { "i", "s" }),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_lenght = 3 },
    { name = 'nvim_lua' },
    { name = 'cmp_tabnine' },
    { name = 'path' },
  }),

  experimental = {
    native_menu = false,
    ghost_text = true
  },
})


return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- Configuração obrigatória
    harpoon:setup()

    -- Atalhos de Teclado (Keymaps)

    -- Adicionar arquivo atual à lista do Harpoon
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Harpoon: Adicionar Arquivo" })

    -- Abrir o menu rápido (Quick Menu)
    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon: Menu" })

    -- Navegação rápida entre arquivos da lista (anterior e próximo)
    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end)
  end,
}

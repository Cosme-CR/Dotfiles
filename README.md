
# Neovim

Configuração simples de **Neovim** feita para estudo e uso diário.
Os plugins são gerenciados automaticamente usando **lazy.nvim**.

<details>
  <summary>Detalhes</summary>



---

## Dependências

### Arch Linux

```bash
sudo pacman -S neovim git ripgrep
```

### Debian / Ubuntu

```bash
sudo apt install neovim git ripgrep
```

### Fedora

```bash
sudo dnf install neovim git ripgrep
```

Também é recomendado instalar uma **Nerd Font** para que os ícones funcionem corretamente no editor.

---

## Plugins

Esta configuração utiliza os seguintes plugins:

- catppuccin — tema
    
- lualine.nvim — barra de status
    
- neo-tree.nvim — explorador de arquivos
    
- toggleterm.nvim — terminal integrado
    
- nvim-autopairs — fechamento automático de parênteses
    
- nvim-treesitter — highlight de sintaxe
    
- nvim-cmp — autocomplete
    
- LuaSnip — snippets
    
- telescope.nvim — busca de arquivos e texto
    

Todos os plugins são instalados automaticamente pelo **lazy.nvim**.

---

## Atalhos principais

|Atalho|Função|
|---|---|
|Ctrl + n|Abrir / fechar explorador de arquivos|
|Ctrl + t|Abrir / fechar terminal|
|Space + ff|Buscar arquivos|
|Space + fg|Buscar texto no projeto|

Leader key: `Space`

---

## Instalação

Crie a pasta de configuração:

```bash
mkdir -p ~/.config/nvim
```

Coloque o arquivo `init.lua` dentro da pasta:

```
~/.config/nvim/init.lua
```

Abra o Neovim:

```bash
nvim
```

Na primeira execução o **lazy.nvim** irá instalar todos os plugins automaticamente.


---



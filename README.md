# Hyprland Config

Configuração personalizada para **Hyprland** (Wayland compositor) com foco em produtividade, aparência moderna e animações suaves.

<details>
  <summary>Detalhes</summary>

Inclui:

* Layout **dwindle** com pseudotile
* Workspaces inteligentes
* Configuração de keybindings completa
* Suporte a touchpad, gestos e múltiplos monitores
* Barra de status com **Waybar**
* Integração com clipboard (`wl-paste`/`cliphist`)
* Suporte a NVIDIA / drivers gráficos
* Tema visual com bordas arredondadas, sombras e blur

---

## Dependências

Para usar esta configuração corretamente, você precisa instalar alguns programas e bibliotecas essenciais.

### Arch Linux 

```bash
sudo pacman -S hyprland kitty thunar rofi waybar blueman wl-clipboard hyprpaper polkit-gnome playerctl brightnessctl
```

Opcional (recomendado):

```bash
sudo pacman -S firefox nerd-fonts-complete xorg-xhost
```



> 💡 **Observação:** Também é recomendado instalar uma **Nerd Font** para que os ícones apareçam corretamente no Waybar e no Rofi.

---

# Programas padrão configurados

* Terminal: `kitty`
* Gerenciador de arquivos: `thunar`
* Menu / launcher: `rofi -show drun -show-icons`
* Navegador: `firefox`

---

# Autostart

Processos iniciados automaticamente:

* Polkit agent (GNOME)
* Waybar (barra de status)
* Blueman-applet (gerenciador Bluetooth)
* `wl-paste` para histórico do clipboard
* Hyprpaper (papel de parede)

---

# Keybindings principais

| Atalho               | Função                                           |
| -------------------- | ------------------------------------------------ |
| Super + Return       | Abrir terminal                                   |
| Super + F            | Abrir navegador                                  |
| Super + E            | Abrir gerenciador de arquivos                    |
| Super + Space        | Abrir menu (rofi)                                |
| Super + C            | Fechar janela ativa                              |
| Super + M            | Sair do Hyprland                                 |
| Super + V            | Alternar janela flutuante                        |
| Super + P            | Alternar pseudo layout                           |
| Super + J / L        | Alternar split / mover janelas                   |
| Super + H            | Histórico clipboard via rofi                     |
| Super + Q/A/S        | Screenshot (região/janela/monitor)               |
| Super + Escape       | Reinicia Waybar                                  |
| Super + setas        | Mover foco da janela                             |
| Super + 1..0         | Trocar workspace                                 |
| Super + Shift + 1..0 | Mover janela ativa para workspace correspondente |

### Multimídia / Volume / Brilho

* XF86AudioRaiseVolume / Lower / Mute
* XF86AudioMicMute
* XF86MonBrightnessUp / Down
* Controle de música via **playerctl**

---

# Monitores

Exemplo de configuração multi-monitor:

```text
monitor = eDP-1,1920x1080@60,0x0,1.0
monitor = HDMI-A-1,1920x1080@75,1920x0,1.0
```

---

# Aparência

* Layout: **dwindle** com pseudotile
* Borda ativa: laranja → amarelo (Gruvbox)
* Borda inativa: cinza (Gruvbox)
* Shadow e blur ativados
* Opacidade: janelas ativas 1.0, inativas 0.99
* Arredondamento de bordas configurável

---

# Animações

* Suavização via curvas Bezier
* Fade, popin, border, layers, workspace transitions


---


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



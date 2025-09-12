
# 🚀 Dotfiles - Configuração Pessoal do Hyprland + Wayland

Este repositório contém minha configuração completa do Arch Linux com foco em desempenho, estética minimalista e produtividade no ambiente **Hyprland + Wayland**.

---

## 📦 Inclui

🧠 **Ambiente gráfico:**

- [Hyprland](https://github.com/hyprwm/Hyprland)
- Waybar com tema translúcido azul
- Rofi
- Cursor, ícones e GTK theme

🖥️ **Aplicativos e utilitários:**

- Kitty (terminal)
- Btop (monitor do sistema)
- Pavucontrol (controle de som)
- Blueman (gerenciador Bluetooth)
- NetworkManager UI

🛠️ **Configurações:**

- `~/.config/hypr/hyprland.conf`
- `~/.config/waybar/config` + `style.css`
- `~/.config/nvim/` com LSP + plugins
- `~/.bashrc` / `~/.zshrc`

## Pacotes
### 🖥️ Hyprland e ecossistema

- **hyprland** – Gerenciador de janelas baseado em Wayland
- **hypridle** – Gerenciador de ociosidade para bloquear tela, suspender, etc.  
- **hyprcursor** – Ferramenta para configurar o cursor no ambiente Hyprland    
- **hyprpaper** – Aplicativo leve para definir wallpapers no Hyprland
- **hyprpicker** – Ferramenta de seleção de cores (color picker) nativa do Wayland
- **hyprshot** – Ferramenta para captura de tela no Hyprland

---

### ⌨️ Utilitários de terminal e produtividade

- **kitty** – Terminal  com suporte a GPU
- **rofi-wayland** – Lançador de aplicativos para Wayland (fork do rofi adaptado)
- **fastfetch** – Ferramenta rápida para mostrar informações do sistema no terminal
- **btop** – Monitor de recursos do sistema em terminal
- **ufw** – Firewall simples e fácil de usar 
- **brightnessctl** – Controla o brilho da tela via terminal
- **gsimplecal** – Calendário leve em GTK, ideal para integrar à Waybar
- **proton-vpn-gtk-app** – Aplicativo oficial do ProtonVPN com interface GTK

---

### 👨‍💻 Desenvolvimento e compiladores

- **nvim** – Editor de texto/codigo
- **nodejs** – Ambiente de execução JavaScript no lado do servidor
- **npm** – Gerenciador de pacotes do Node.js
- **clang** – Compilador C/C++ da família LLVM
- **fuse2** – Sistema de arquivos em espaço de usuário (usado por AppImage, por ex.)
- **sdcc** – Compilador C para microcontroladores como PIC, Z80, 8051, entre outros

---

### 🎮 Jogos

- **steam** – Plataforma de jogos da Valve para Linux

---

### 🖼️ Interface gráfica e integração

- **waybar** – Barra de status altamente configurável
- **dunst** – Daemon leve para exibição de notificações 
- **cliphist** – Gerenciador de histórico da área de transferência
- **pavucontrol** – Interface gráfica para controle de áudio 
- **nwg-look** – Ferramenta gráfica para configurar temas GTK (útil com ambientes não-GTK)

---

### 🛠️ KDE Utilities (mesmo fora do KDE)

- **dolphin** – Gerenciador de arquivos do KDE, moderno e 
- **dolphin-plugins** – Plugins adicionais para o Dolphin
- **ark** – Aplicativo gráfico para compressão e extração de arquivos (ZIP, RAR, etc.)
- **kio-admin** – Permite abrir arquivos como root no Dolphin 
- **polkit-kde-agent** – Agente de autenticação para permissões administrativas no KDE/Wayland
- **kde-cli-tools** – Ferramentas de linha de comando do KDE (como kcmshell)
- **kdeconnect** – Integração entre dispositivos móveis e KDE (mensagens, arquivos, etc.)
- **network-manager-applet** – Applet para gerenciamento de redes (Wi-Fi, Ethernet) via NetworkManager
- **bluez** – Pilha oficial Bluetooth para Linux
- **bluez-utils** – Utilitários para gerenciamento Bluetooth (bluetoothctl, etc.)
- **blueman** – Interface gráfica para gerenciamento Bluetooth usando BlueZ
- **archlinux-xdg-menu** – Gera menu de aplicativos para ambientes não suportados nativamente

---

 ### 🔄 Integração Wayland e portais

- **qt5-wayland** – Suporte Wayland para aplicações baseadas em Qt5
- **qt6-wayland** – Suporte Wayland para aplicações baseadas em Qt6
- **xdg-desktop-portal-hyprland** – Portal de integração para Hyprland (clipboard, screenshot, etc.)
- **xdg-desktop-portal-gtk** – Backend GTK para o xdg-desktop-portal (necessário para apps GTK) 

---

### 🔤 Fontes e ícones

- **ttf-jetbrains-mono-nerd** – Fonte monoespaçada JetBrains com ícones Nerd (ótima para terminal)
- **noto-fonts-emoji** – Conjunto de emojis compatível com Unicode
- **ttf-dejavu** – Fonte DejaVu com boa cobertura de idiomas
- **ttf-droid** – Fonte legível usada em Android
- **noto-fonts** – Fonte padrão Noto (excelente cobertura de idiomas)
- **noto-fonts-cjk** – Fontes para chinês, japonês e coreano (CJK)
- **ttf-font-awesome** – Ícones Font Awesome (usados por muitos apps e barras)

---

### 🎨 Temas e ícones

- **breeze** – Tema visual padrão do KDE Plasma
- **breeze5** – Versão atualizada do tema Breeze para KDE Plasma 5
- **breeze-gtk** – Tema Breeze adaptado para aplicações GTK
- **papirus-icon-theme** – Tema de ícones moderno, popular e bem completo
- **xdg-user-dirs-gtk** – Configuração gráfica para diretórios padrão do usuário (Documentos, Downloads, etc.)

---

### 🎵 Áudio e multimídia com PipeWire

- **pipewire** – Servidor de áudio e vídeo moderno (substituto do PulseAudio e JACK)
- **pipewire-alsa** – Suporte a ALSA via PipeWire
- **pipewire-jack** – Suporte a JACK via PipeWire (áudio profissional)
- **pipewire-pulse** – Emula servidor PulseAudio com PipeWire
- **wireplumber** – Gerenciador de sessão para PipeWire
- **gstreamer** – Framework multimídia (usado por players e apps)
- **gst-libav** – Plugin GStreamer com suporte a codecs FFmpeg
- **gst-plugins-base** – Plugins essenciais do GStreamer
- **gst-plugins-good** – Plugins do GStreamer (qualidade e estabilidade)
- **gst-plugins-bad** – Plugins experimentais do GStreamer
- **ffmpeg** – Ferramenta  para manipulação de áudio e vídeo

---

  












# Changelog

Todas as mudanças notáveis neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto adere ao [Semantic Versioning](https://semver.org/lang/pt-BR/).

## [Unreleased]

### Planejado
- Script de backup automatizado
- Suporte para múltiplos temas
- Integração com Rofi

---

## [1.0.0] - 2025-12-02

### 🎉 Release Inicial

Primeira versão estável do dotfiles para Arch Linux com Hyprland.

### ✨ Adicionado

#### Configurações
- Hyprland (Wayland compositor) com keybindings personalizados
- Waybar com módulos customizados (bateria, CPU, RAM, rede)
- Kitty terminal com tema pywal16
- Fish shell com starship prompt
- Neovim configuração básica
- Wofi/Rofi para aplicação launcher

#### Scripts de Automação
- **wallpaper.sh** - Gerenciamento de wallpapers com pywal16
- **brightness.sh** - Controle de brilho com brightnessctl
- **volume.sh** - Controle de volume com pamixer
- **power.sh** - Menu de energia (logout, reboot, shutdown)
- **power-manager.sh** - Perfis de energia (performance, balanced, power-saver)
- **autostart.sh** - Inicialização automática de aplicações
- **colorpicker.sh** - Seletor de cores (Waybar)
- **select.sh** - Screenshot com seleção (Waybar)
- **refresh.sh** - Reload de serviços (Waybar/SwayNC)

#### GitHub Actions
- **ShellCheck** - Validação de sintaxe de scripts shell
- **Validate Package Lists** - Verificação de duplicatas e ordenação
- **Update Package Lists** - Atualização automática agendada (cron)
- **Symlink Test** - Teste de instalação
- **Update Repository Statistics** - Estatísticas automáticas
- **Automated Tests** - Suite completa de testes (7 jobs)

#### Gerenciamento de Pacotes
- `pkglist.txt` - 210 pacotes oficiais do Arch Linux
- `aur_pkglist.txt` - 46 pacotes do AUR
- Total: **256 pacotes** gerenciados

#### Documentação
- README.md completo com instruções de instalação
- Documentação inline em todos os scripts
- Templates de Issues e Pull Requests
- ShellCheck configuration (`.shellcheckrc`)

### 🔧 Tecnologias

- **WM**: Hyprland (Wayland)
- **Bar**: Waybar
- **Terminal**: Kitty
- **Shell**: Fish + Starship
- **Editor**: Neovim
- **Launcher**: Wofi/Rofi
- **Notifications**: SwayNC
- **Themes**: Pywal16
- **Screenshot**: Hyprshot/Grim

### 📊 Estatísticas

- 🐚 Scripts Shell: 10+
- 📦 Pacotes: 256 (210 oficiais + 46 AUR)
- 🔧 Workflows: 6
- 📄 Linhas de código: 2000+

### 🔒 Segurança

- Todos os scripts validados com ShellCheck
- Nenhuma credencial hardcoded
- Permissões adequadas em scripts executáveis

### 🧪 Testes

- Validação de sintaxe (Fish, Lua, JSON, YAML)
- Verificação de estrutura de diretórios
- Teste de dependências
- Validação de links
- Análise de segurança
- Métricas de qualidade de código

---

## Links

- [Unreleased]: https://github.com/ticogafa/dotfiles/compare/v1.0.0...HEAD
- [1.0.0]: https://github.com/ticogafa/dotfiles/releases/tag/v1.0.0

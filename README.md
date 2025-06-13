# 🚀 Dotfiles

A collection of personal configuration files to customize and enhance the terminal experience.

## ✨ Features

### Starship Prompt Configuration
- **Custom format**: Clean and informative prompt with directory, git status, and language indicators
- **Language support**: Icons and styling for 40+ programming languages and tools
- **Git integration**: Branch name, status indicators, and ahead/behind counters
- **Right-aligned modules**: System info, language versions, and tools on the right side
- **Time display**: Current time in HH:MM format
- **Memory usage**: RAM and swap usage monitoring

### Supported Languages & Tools
- **Web**: Node.js, Deno, PHP
- **Systems**: Rust, Go, C/C++, Zig
- **Scripting**: Python, Ruby, Lua, Perl
- **JVM**: Java, Kotlin, Scala
- **Functional**: Haskell, Elixir, Erlang, OCaml
- **Cloud**: AWS, Google Cloud, Azure, Terraform
- **Containers**: Kubernetes, Singularity
- **Package Managers**: Conda, Pixi, Spack
- **And many more!**

## 📋 Prerequisites

- [Starship](https://starship.rs/) - Cross-shell prompt
- A [Nerd Font](https://www.nerdfonts.com/) for proper icon display
- Git (for version control integration)

## 🛠️ Installation

### 1. Install Starship
```bash
# Using curl
curl -sS https://starship.rs/install.sh | sh

# Or using package manager
# Ubuntu/Debian
sudo apt install starship

# Arch Linux
sudo pacman -S starship

# macOS
brew install starship
```

### 2. Clone the repository
```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Create symbolic links
```bash
# Starship configuration
ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml
```

### 4. Initialize Starship in your shell

**Bash** (~/.bashrc):
```bash
eval "$(starship init bash)"
```

**Zsh** (~/.zshrc):
```bash
eval "$(starship init zsh)"
```

**Fish** (~/.config/fish/config.fish):
```fish
starship init fish | source
```

**PowerShell** (Microsoft.PowerShell_profile.ps1):
```powershell
Invoke-Expression (&starship init powershell)
```

## 🎨 Customization

### Color Scheme
The configuration uses a carefully selected color palette:
- **Directory**: Bright cyan (`#8be9fd`)
- **Git branch**: Muted gray (`#9198a1`)
- **Git status**: Blue (`#769ff0`) with dark background
- **Time**: Light blue (`#a0a9cb`)
- **Languages**: Color-coded by type (blue for system langs, yellow for scripting, etc.)

### Adding New Languages
To add support for a new language, add a new section to the `starship.toml`:

```toml
[your_language]
format = " [lang](italic) [$symbol]($style)"
style = "bold bright-color"
symbol = "🔧 "
```

### Modifying Icons
All symbols can be customized by changing the `symbol` field in each module. Ensure you're using a Nerd Font for proper display.

## 📁 Structure

```
dotfiles/
├── .config/
│   └── starship.toml    # Starship prompt configuration
└── README.md           # This file
```

## 🔧 Troubleshooting

### Icons not displaying correctly
- Install a [Nerd Font](https://www.nerdfonts.com/)
- Set your terminal to use the Nerd Font
- Restart your terminal

### Prompt not updating
- Ensure Starship is properly initialized in your shell configuration
- Restart your shell or run `source ~/.bashrc` (or equivalent)

### Git information not showing
- Ensure you're in a Git repository
- Check that Git is installed and accessible in your PATH

## 🤝 Contributing

Feel free to fork this repository and customize it for your needs. If you have improvements or new features, pull requests are welcome!

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- [Starship](https://starship.rs/) - The amazing cross-shell prompt
- [Nerd Fonts](https://www.nerdfonts.com/) - For the beautiful icons
- The open-source community for inspiration and tools
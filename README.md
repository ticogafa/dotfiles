# dotfiles

Personal dotfiles for Linux, focused on a streamlined, productive, and highly customizable environment. These configs are designed for easy adaptation and forking—feel free to use as a base for your own setup!

## Key Features

- **Modular and easy to extend**
- **User-centric**: Minimal, but powerful defaults
- **No bootstrap scripts**: Manual installation for transparency and control

## Main Tools & Configurations

![Desktop Screenshot](screenshots/desktop.png)

### Fish Shell

A modern command-line shell, configured for productivity and aesthetics. Includes custom prompts, aliases, and completions.

![Fish Shell Screenshot](screenshots/fish.png)
![Fish Shell Screenshot](screenshots/fish-1.png)

### Hyprpanel

Powerful and minimal status bar/panel for Wayland compositors, themed for clarity and integration with the overall desktop setup.

![Hyprpanel Screenshot](screenshots/hyprpanel.png)
![Hyprpanel Screenshot](screenshots/hyprpanel-1.png)

### Neovim

Highly tweaked Neovim configuration for coding, writing, and everything in between. Features fast startup, intuitive keybindings, and essential plugins.

![Neovim Screenshot](screenshots/nvim.png)
![Neovim Screenshot](screenshots/nvim-1.png)

### Additional Highlights

- **Shell utilities**: Useful aliases and functions for daily work
- **Editor settings**: Consistent editing experience across terminals and GUIs
- **Theming**: Unified color schemes for shell, editor, and desktop

## Getting Started

1. **Fork this repo** or clone it:
    ```bash
    git clone https://github.com/ticogafa/dotfiles.git
    ```
2. **Review configurations** and copy what you need into your `$HOME` directory.
3. **Install dependencies** for each tool (fish, hyprpanel, neovim, etc.) using your distro’s package manager.
4. **Symlink or copy configs** as desired. For example:
    ```bash
    ln -s $(pwd)/fish ~/.config/fish
    ln -s $(pwd)/hyprpanel ~/.config/hyprpanel
    ```
5. Restart your shell or session to see the changes.

## Contributing

Feel free to fork, open issues or pull requests, or share ideas for improvement!

## License

[MIT](LICENSE)

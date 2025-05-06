# My NVIM config


    git clone git@github.com:joselo/nvim.git ~/.config/nvim


**Create symbolic links to fonts and kitty**

    ln -s ~/.config/nvim/fonts  ~/.local/share
    ln -s ~/.config/nvim/kitty  ~/.config


# Dependencies


- [zf](https://github.com/natecraddock/zf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)

# Install dependencies in Debian


- Install `ripgrep`

        sudo apt install ripgrep

- Install `zf`

        $ mkdir -p ~/.local/bin


Add the `~/.local/bin` path directory to the `~/.zshrc` file.

        export PATH="$PATH:$HOME/.local/bin"


## Light/Dark themes in kitty


Add this function to the .zhrc

```
light_theme() {
  # Set an environment variable
  export THEME="light"
  # Apply the kitty color scheme
  kitty @ set-colors -a "$HOME/.config/nvim/kitty/themes/light_theme.conf" 
}

dark_theme() {
  # Set an environment variable
  export THEME="dark"
  # Apply the kitty color scheme
  kitty @ set-colors -a "$HOME/.config/nvim/kitty/themes/dark_theme.conf" 
}

```

Then in your terminal:


        $ light_theme
        $ dark_theme

# Dependencies

sudo apt install ripgrep

## Add this function to the .zhrc


```
dark() {
    # Set an environment variable
    export THEME="dark"
    # Apply the kitty color scheme
    kitty @ set-colors -a "$HOME/.local/share/nvim/lazy/zenbones.nvim/extras/kitty/neobones_dark.conf"
}
```



# Dependencies

sudo apt install ripgrep

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

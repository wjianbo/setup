# install scoop
set-executionpolicy remotesigned -scope currentuser
irm get.scoop.sh | iex

# install neovim
scoop install neovim
cp nvim ~/AppData/Local/

# install wezterm
scoop install wezterm
cp .wezterm.lua ~/

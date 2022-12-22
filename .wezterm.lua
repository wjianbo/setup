local wezterm = require 'wezterm';

return {
  font = wezterm.font_with_fallback({"JetBrains Mono", "Noto Color Emoji", "Hiragino Mincho ProN", "Source Han Serif SC"}),
  font_size = 10.0,
  color_scheme = "OneHalfDark", -- 自分の好きなテーマ探す https://wezfurlong.org/wezterm/colorschemes/index.html
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
}

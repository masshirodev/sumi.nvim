# sumi.nvim

Ink, washi paper and hinoki wood: the editor half of ranma's `sumi` theme.
Same palette, and the same ground as ranma's focused pane (`#17161a`), so
nvim sits inside a sumi ranma without a seam.

## Install

lazy.nvim:

```lua
{ "masshirodev/sumi.nvim", lazy = false, priority = 1000,
  config = function()
    require("sumi").setup({ transparent = false, dim_inactive = true })
    vim.cmd.colorscheme("sumi")
  end },
```

Or copy `colors/` and `lua/` into `~/.config/nvim/`.

Working on it locally: clone into `~/projects/sumi.nvim` and give lazy
`dev = { path = "~/projects", fallback = true }`, then mark the spec `dev = true`.
lazy loads the checkout when it exists and clones from GitHub when it does not.

lualine: `require("lualine").setup { options = { theme = "sumi" } }`.

## Options

| Option | Default | |
| --- | --- | --- |
| `transparent` | `false` | leave the ground to the terminal (and ranma's `panes.active_bg`) |
| `dim_inactive` | `true` | inactive windows take `#121114`, like ranma's unfocused panes |
| `italic_comments` | `true` | |

## Palette

| | | |
| --- | --- | --- |
| washi `#e8e1d3` text | hinoki `#d9a55b` functions | sakura `#c98aa8` keywords |
| aonori `#7fb8b0` types | matcha `#9db37a` numbers, constants | kincha `#c4b28a` strings |
| ai `#7b93c9` macros, floats | shu `#e0533d` errors | kasumi `#6e665c` comments |

`require("sumi").palette` hands the colours to anything else.

## License

MIT, see `LICENSE`.

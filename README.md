# Neovim Configuration - Data Science & Quarto Focus

## 🪐 Overview

This Neovim configuration is designed as **focused, minimal, and productive environment** for:

* **Data Science ( Python, Pandas, Jupyter-like workflows )**
* **Literate programming with Quarto / Markdown**
* **Long coding sessions with low cognitive load**

It avoids bloated abstractions, favors explicit keymaps, and keeps responsibilities clearly separated.

---

## 🧠 Philosophy

**Principles behind this setup:**

* **Keyboard-first**: everything important is reachable through intentional keybindings
* **Explicit > implicit**: no magic, no hidden behaviors
* **Modular structure**: options, keymaps, autocmds, plugins and ftplugins are isolated
* **Low noise**: no visual clutter, no unnecessary prompts
* **Real workflows**: designed for daily use, not for screenshots

This is not a Neovim distro - it is a **PERSONAL WORKBENCH**.

---

## ❔ Who is this for?

This setup is ideal if you:

* Work with **Python and Data Science**
* Use **Quarto / Markdown notebooks**
* Like **Jupyter-style cells** but want Neovim speed
* Prefer **Clean keymaps** over plugin-driven UX
* Want full control over your editor behavior

Probably **not** ideal if you:

* Want VSCode-like UI
* Prefer mouse-driven workflows
* Expect everything to work without understanding Neovim

---

## 📁 Structure

```text
 .config/nvim
├──  ftplugin
│   ├──  markdown.lua
│   └──  python.lua
├──  init.lua
├──  lazy-lock.json
├──  lua
│   └──  jonatas
│       ├──  config
│       │   ├──  autocmds.lua
│       │   ├──  keymaps.lua
│       │   ├──  lazy.lua
│       │   ├──  options.lua
│       │   └──  small-settings.lua
│       └──  plugins
│           ├──  blink-cmp.lua
│           ├──  colorizer.lua
│           ├──  colorschemes.lua
│           ├──  conform.lua
│           ├──  flash.lua
│           ├──  gitsigns.lua
│           ├──  image-nvim.lua
│           ├──  jupytext.lua
│           ├──  lualine.lua
│           ├──  luasnip.lua
│           ├──  mason.lua
│           ├──  mini-plugins.lua
│           ├──  molten.lua
│           ├──  noice.lua
│           ├──  nvim-treesitter.lua
│           ├──  oil.lua
│           ├──  persistence.lua
│           ├──  quarto-nvim.lua
│           ├──  snacks.lua
│           ├──  todo-comments.lua
│           ├──  trouble.lua
│           └──  which-key.lua
└──  snippets
    ├──  python.lua
    └──  toml.lua
```

Each file has **one clear responsibility**.                 

---

## 🔑 Leader Key

* **Leader:** `<Space>`

Semantic prefixes are used:

* `<leader>a`  tabs
* `<leader>s`  splits
* `<leader>q`  sessions / quarto
* `<leader>m`  molten
* `<leader>t`  exit actions

---

## 🪟 Window Navigation

> **Important:** window navigation uses **ALT + SHIFT + hjkl**

| Key               | Action               |
| ----------------- | -------------------- |
| `Alt + Shift + H` | Move to left window  |
| `Alt + Shift + J` | Move to lower window |
| `Alt + Shift + K` | Move to upper window |
| `Alt + Shift + L` | Move to right window |

Works in **Normal and Insert Mode**.

---

## 📜 Cheat Sheet

### Insert Mode

| Key              | Action                     |
| ---------------- | -------------------------- |
| `Ctrl + h/j/k/l` | Move cursor in insert mode |
| `jk`             | Exit insert mode           |

---

### Movement & Editing

| Key              | Action                           |
| ---------------- | -------------------------------- |
| `J / K` (visual) | Move selection down / up         |
| `J` (normal)     | Join lines without moving cursor |
| `Ctrl + d / u`   | Half page down / up (centered)   |
| `n / N`          | Search next / prev (centered)    |

---

### Text Operations

| Key          | Action                             |
| ------------ | ---------------------------------- |
| `<leader>d`  | Delete without yanking             |
| `x`          | Delete char without yanking        |
| `<leader>rw` | Replace word under cursor (global) |
| `<leader>h`  | Clear search highlight             |

---

### Files & Buffers

| Key         | Action               |
| ----------- | -------------------- |
| `<leader>x` | Make file executable |
| `Ctrl + a`  | Select all           |

---

### Tabs (`<leader>a*`)

| Key          | Action                       |
| ------------ | ---------------------------- |
| `<leader>ao` | New tab                      |
| `<leader>ax` | Close tab                    |
| `<leader>an` | Next tab                     |
| `<leader>ap` | Previous tab                 |
| `<leader>ac` | Open current file in new tab |

---

### Splits (`<leader>s*`)

| Key          | Action           |
| ------------ | ---------------- |
| `<leader>sv` | Vertical split   |
| `<leader>sh` | Horizontal split |
| `<leader>se` | Equalize splits  |

### Sessions ( Persistence )

| Key          | Action              |
| ------------ | ------------------- |
| `<leader>qs` | Load session (cwd)  |
| `<leader>qS` | Select session      |
| `<leader>ql` | Load last session   |
| `<leader>qd` | Stop saving session |

---

### Development

| Key          | Action                     |
| ------------ | -------------------------- |
| `<leader>pr` | Run current Python file    |
| `<leader>fr` | Format buffer (LSP / Ruff) |

---

### File Explorers ( Oil & MiniFiles )

| Key         | Action                 |
| ----------- | ---------------------- |
| `-`         | Oil (parent directory) |
| `<leader>-` | Oil (floating)         |
| `<leader>=` | MiniFiles              |

---

### Quarto

| Key                   | Action             |
| --------------------- | ------------------ |
| `<leader>qp`          | Preview document   |
| `<leader>qc`          | Run cell           |
| `<leader>qa`          | Run cell and above |
| `<leader>ql`          | Run line           |
| `<leader>qs` (visual) | Run selection      |
| `<leader>qA`          | Run all cells      |

---

### Molten ( Jupyter Kernel )

| Key          | Action             |
| ------------ | ------------------ |
| `<leader>mi` | Initialize kernel  |
| `<leader>mc` | Evaluate cell      |
| `<leader>mv` | Evaluate selection |
| `<leader>mo` | Open output window |
| `<leader>mh` | Hide output        |
| `<leader>md` | Delete cell        |

---

## ☝️🤓 Final Notes

This configuration evolves through real, everyday usage.

It is a personal setup, shaped by how I like to work — not an attempt to build the “best” Neovim configuration, nor the most productive one by any universal standard.

There is no absolute goal here.
It changes as my habits change.

If you are reading this and it feels *intentional*, *quiet*, and *fast* —
then it is working exactly as intended.

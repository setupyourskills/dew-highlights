# Dew Highlights

🌿 **Dew Smartlink** is a minimal, focused [Neorg](https://github.com/nvim-neorg/neorg) extension designed to provide custom Tree-sitter highlight definitions for `.norg` files.

This module is part of the [Neorg Dew](https://github.com/setupyourskills/neorg-dew) ecosystem.

## Features

- Provides visually enhanced syntax highlighting for Neorg notes.
- Works seamlessly with any colorscheme and styles.
- Automatically applied when editing `.norg` files.

## Installation

### Prerequisites

- A functional installation of [Neorg](https://github.com/nvim-neorg/neorg) is required for this module to work.
- The core module [Neorg Dew](https://github.com/setupyourskills/neorg-dew) must be installed, as it provides essential base libraries.

### Using Lazy.nvim

```lua
{
  "setupyourskills/dew-highlights",
  ft = "norg",
  dependencies = {
    "setupyourskills/neorg-dew",
  },
}
```

## Configuration

Make sure all of them are loaded through Neorg’s module system in your config:

```lua
["external.neorg-dew"] = {},
["external.dew-highlights"] = {
  config = {
    highlights_table = {
      ["@neorg.markup.verbatim"] = { fg = "#ffab00", italic = true }, -- Customize highlight groups here
      -- Add other groups as needed
    },
  },
},
```

### Colorize embedded notes with `Dew Transclude`

When paired with the [Dew Transclude](https://github.com/setupyourskills/dew-transclude) submodule, you can colorify your embedded notes.

Add the following highlight group to the `highlights_table`:

```lua
["dewTransclude"] = { fg = "#D2DAD7", bg = "#2A3230" },
```

See the [Dew Transclude](https://github.com/setupyourskills/dew-transclude) submodule for enabling instructions.

## Usage

You don’t need to do anything else — simply open a `.norg` file and enjoy the improved hightlight experience.

## Collaboration and Compatibility

This project embraces collaboration and may build on external modules created by other Neorg members, which will be tested regularly to ensure they remain **functional** and **compatible** with the latest versions of Neorg and Neovim.  

## Why **dew**?

Like morning dew, it’s **subtle**, **natural**, and brief, yet vital and effective for any workflow.

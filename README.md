# shiny

```bash
$ echo "A tool for the crystal programming language for aesthetic and functional TUIs"
A tool for the crystal programming language for aesthetic and functional TUIs

$ echo "sounds cool"
sounds cool

```

# Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     shiny:
       github: NitosMaster/shiny
   ```

2. Run `shards install`

# Usage

```crystal
require "shiny"

hex = "#FF00C5" # ANSI color

titlecard = Shiny::FigletText.new("shiny", "Big Money-nw", "/usr/share/figlet/fonts/") # .flf Fonts for titles
text = Shiny::Text.new(["shiny", "is", "AWESOME"], "#C500FF") # Text, for paragraphs add new str to array
panel = Shiny::Panel.new(height: 10, title: "test", color: hex, border: "round") # Panel, kinda like Rich for python, Note that width is not specified, meaning it will default to max terminal width (requires ncurses)

panel.render(text) # Render simple text
panel.render(titlecard) # Render .flf

panel.put(19, 4, "(•✓•)", "#C500FF") # Adds str to buffer                                                       panel.put(3, 4, "cute lil guy -> ", "#C500FF") # x, y, str, color

panel.renderBuffer # Renders buffer
```

```bash
# Example output
crystal run test.cr
╭──────────────────────── test ────────────────────────╮│shiny                                                 ││is                                                    │
│AWESOME                                               │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
╰──────────────────────────────────────────────────────╯
╭──────────────────────── test ────────────────────────╮
│          $$\       $$\                              │
│          $$ |      \__|                              │
│ $$$$$$$\ $$$$$$$\  $$\ $$$$$$$\  $$\   $$\           │
│$$  _____|$$  __$$\ $$ |$$  __$$\ $$ |  $$ |          │
│\$$$$$$\  $$ |  $$ |$$ |$$ |  $$ |$$ |  $$ |          │
│ \____$$\ $$ |  $$ |$$ |$$ |  $$ |$$ |  $$ |          │
│$$$$$$$  |$$ |  $$ |$$ |$$ |  $$ |\$$$$$$$ |          │
│\_______/ \__|  \__|\__|\__|  \__| \____$$ |          │
╰──────────────────────────────────────────────────────╯
╭──────────────────────── test ────────────────────────╮
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│   cute lil guy -> (•✓•)                              │
│                                                      │
│                                                      │
│                                                      │
╰──────────────────────────────────────────────────────╯
```
TODO: Docs

# Features and Future

## Features
* Beautiful rich python inspired panels;
* ANSI rgb;
* Figlet support to leave your users flabbergasted;
* And simple!

## Future
* Refreshable panels to run games, menus, inputs and more;
* Image to ASCII;
* Progress bars;
* And whatever you suggest!

# Contributing

1. Fork it (<https://github.com/NitosMaster/shiny/fork>)
2. Create your feature branch (`git checkout -b my-new-mart`)
3. Commit your changes (`git commit -am 'mart'`)
4. Push to the branch (`git push origin my-new-mart`)
5. Create a new Pull Request

# Contributors

- [NitosMaster](https://github.com/NitosMaster) - creator and maintainer

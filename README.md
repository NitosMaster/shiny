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

panel.put(19, 4, "(•✓•)", "#C500FF") # Adds str to buffer
panel.put(3, 4, "cute lil guy -> ", "#C500FF") # x, y, str, color

panel.renderBuffer # Renders buffer
```

```bash
# Example output
$ crystal run example.cr
╭──────────────────────── test ────────────────────────╮
│shiny                                                 │
│is                                                    │
│AWESOME                                               │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
╰──────────────────────────────────────────────────────╯
╭──────────────────────── test ────────────────────────╮
│          $$\       $$\                               │
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
* Refreshable panels to run full games, animations and everything you desire in a panel;
* And simple!

## Future
* Refining of refreshable panels;
* Progress bars;
* Image to ASCII;
* File trees;
* And whatever you suggest!

# Contributing

1. Fork it (<https://github.com/NitosMaster/shiny/fork>)
2. Create your feature branch (`git checkout -b my-new-branch`)
3. Commit your changes (`git commit -am 'First commit <3'`)
4. Push to the branch (`git push origin my-new-branch`)
5. Create a new Pull Request

## Star History

<a href="https://www.star-history.com/#willmcgugan/rich&type=date&legend=top-left">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=willmcgugan/rich&type=date&theme=dark&legend=top-left" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=willmcgugan/rich&type=date&legend=top-left" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=willmcgugan/rich&type=date&legend=top-left" />
 </picture>
</a>

# Contributors

- [NitosMaster](https://github.com/NitosMaster) - creator and maintainer, all alone :(

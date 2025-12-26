# shiny

A tool for the crystal programming language for aesthetic and functional TUIs

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

rgb = gets.to_s.chomp # ANSI Color through input

titlecard = Shiny::FigletText.new("MART", "Big Money-nw", "/usr/share/figlet/fonts/") # .flf Fonts for app titles
text = Shiny::Text.new(["mart", "test"]) # Text, for paragraphs add new str to array
panel = Shiny::Panel.new(height: 30, title: "test", color: rgb, border: "round") # Panel, kinda like Rich

panel.render(text)
panel.render(titlecard)
```

```bash
# Example output
crystal run test.cr
FFFFFF
╭──────────────────────── test ────────────────────────╮
│mart                                                  │
│test                                                  │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
╰──────────────────────────────────────────────────────╯
╭──────────────────────── test ────────────────────────╮
│$$\      $$\  $$$$$$\  $$$$$$$\ $$$$$$$$\             │
│$$$\    $$$ |$$  __$$\ $$  __$$\\__$$  __|            │
│$$$$\  $$$$ |$$ /  $$ |$$ |  $$ |  $$ |               │
│$$\$$\$$ $$ |$$$$$$$$ |$$$$$$$  |  $$ |               │
│$$ \$$$  $$ |$$  __$$ |$$  __$$<   $$ |               │
│$$ |\$  /$$ |$$ |  $$ |$$ |  $$ |  $$ |               │
│$$ | \_/ $$ |$$ |  $$ |$$ |  $$ |  $$ |               │
│\__|     \__|\__|  \__|\__|  \__|  \__|               │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
│                                                      │
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

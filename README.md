# shiny

A tool for the crystal programming language for aesthetic and functional TUIs

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     shiny:
       github: NitosMaster/shiny
   ```

2. Run `shards install`

## Usage

```crystal
require "shiny"

# To use panels
mart = Shiny::Panel.new(height: 10, width: 20, color: "#b00b69", title: "Example Panel")
mart.render()
```

TODO: Write more usage instructions here

## Contributing

1. Fork it (<https://github.com/NitosMaster/shiny/fork>)
2. Create your feature branch (`git checkout -b my-new-mart`)
3. Commit your changes (`git commit -am 'mart'`)
4. Push to the branch (`git push origin my-new-mart`)
5. Create a new Pull Request

## Contributors

- [NitosMaster](https://github.com/NitosMaster) - creator and maintainer

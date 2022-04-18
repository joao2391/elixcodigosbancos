[![ElixCodigosBancos version](https://img.shields.io/hexpm/v/elixcodigosbancos.svg)](https://hex.pm/packages/elixcodigosbancos)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/elixcodigosbancos/)
[![Hex.pm](https://img.shields.io/hexpm/dt/elixcodigosbancos.svg)](https://hex.pm/packages/)

# ElixCodigosBancos

This lib helps you to get brazilian's offset codes

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixcodigosbancos` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixcodigosbancos, "~> 0.1.0"}
  ]
end
```

## Features

```elixir
get_banco_by_codigo("123")

get_bancos()

get_banco_by_nome("nome_banco")
```


## Documentation
Documentation can be found at [https://hexdocs.pm/elixcodigosbancos](https://hexdocs.pm/elixcodigosbancos).

## License
[MIT](https://choosealicense.com/licenses/mit/)
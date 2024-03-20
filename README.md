# typed_headers

[![Package Version](https://img.shields.io/hexpm/v/typed_headers)](https://hex.pm/packages/typed_headers)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/typed_headers/)

```sh
gleam add typed_headers
```
```gleam
import gleam/list
import typed_headers/header
import typed_headers/content_type
import typed_headers/content_type/application

pub fn main() {
  let headers =
  [header.ContentType(content_type.Application(application.JSON))]
  |> list.map(typed_headers.to_string)
}
```

Further documentation can be found at <https://hexdocs.pm/typed_headers>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```

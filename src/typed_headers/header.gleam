import typed_headers/content_type.{type ContentType}

pub type Header {
  ContentType(ContentType)
  Custom(name: String, value: String)
  Raw(String)
}

fn h(name: String, value: String) -> String {
  name <> ": " <> value
}

pub fn to_string(header: Header) -> String {
  case header {
    ContentType(c) -> h(content_type.header_name, content_type.to_string(c))
    Custom(name, value) -> h(name, value)
    Raw(s) -> s
  }
}

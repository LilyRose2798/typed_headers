import content_type.{type ContentType}

pub type Header {
  ContentTypeHeader(ContentType)
  CustomHeader(name: String, value: String)
  CustomRawHeader(String)
}

fn h(name: String, value: String) -> String {
  name <> ": " <> value
}

pub fn to_string(header: Header) -> String {
  case header {
    ContentTypeHeader(c) ->
      h(content_type.header_name, content_type.to_string(c))
    CustomHeader(name, value) -> h(name, value)
    CustomRawHeader(s) -> s
  }
}

import method.{type Method}
import content_type.{type ContentType}

pub type Header {
  MethodHeader(Method)
  ContentTypeHeader(ContentType)
  CustomHeader(name: String, value: String)
  CustomRawHeader(String)
}

fn h(name: String, value: String) -> String {
  name <> ": " <> value
}

pub fn to_string(header: Header) -> String {
  case header {
    MethodHeader(m) -> h(method.header_name, method.to_string(m))
    ContentTypeHeader(c) ->
      h(content_type.header_name, content_type.to_string(c))
    CustomHeader(name, value) -> h(name, value)
    CustomRawHeader(s) -> s
  }
}

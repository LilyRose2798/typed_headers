import gleam/string

pub fn codecs_to_string(codecs: List(String)) -> String {
  "; codecs=\"" <> string.join(codecs, ", ") <> "\""
}

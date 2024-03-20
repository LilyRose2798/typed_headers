import typed_headers/utils

pub type Application {
  JSON
  XML
  OGG
  OGGWithCodecs(codecs: List(String))
  Custom(String)
}

pub const type_name = "application"

pub fn to_string(application: Application) -> String {
  case application {
    JSON -> "json"
    XML -> "xml"
    OGG -> "ogg"
    OGGWithCodecs(c) -> "ogg" <> utils.codecs_to_string(c)
    Custom(s) -> s
  }
}

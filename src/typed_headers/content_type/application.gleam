pub type Application {
  JSON
  XML
  OGG
  Custom(String)
}

pub const type_name = "application"

pub fn to_string(application: Application) -> String {
  case application {
    JSON -> "json"
    XML -> "xml"
    OGG -> "ogg"
    Custom(s) -> s
  }
}

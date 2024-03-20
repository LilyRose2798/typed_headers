pub type Text {
  Plain
  HTML
  Javascript
  CSS
  Custom(String)
}

pub const type_name = "text"

pub fn to_string(text: Text) -> String {
  case text {
    Plain -> "plain"
    HTML -> "html"
    Javascript -> "javascript"
    CSS -> "css"
    Custom(s) -> s
  }
}

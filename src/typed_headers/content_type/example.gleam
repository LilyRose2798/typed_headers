pub type Example {
  Custom(String)
}

pub const type_name = "example"

pub fn to_string(ct: Example) -> String {
  case ct {
    Custom(s) -> s
  }
}

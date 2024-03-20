pub type Example {
  Custom(String)
}

pub const type_name = "example"

pub fn to_string(example: Example) -> String {
  case example {
    Custom(s) -> s
  }
}

pub type Multipart {
  FormData
  Mixed
  Custom(String)
}

pub const type_name = "multipart"

pub fn to_string(multipart: Multipart) -> String {
  case multipart {
    FormData -> "form-data"
    Mixed -> "mixed"
    Custom(s) -> s
  }
}

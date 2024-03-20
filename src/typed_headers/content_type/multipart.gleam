pub type Multipart {
  FormData
  Mixed
  Custom(String)
}

pub const type_name = "multipart"

pub fn to_string(ct: Multipart) -> String {
  case ct {
    FormData -> "form-data"
    Mixed -> "mixed"
    Custom(s) -> s
  }
}

pub type Image {
  JPEG
  PNG
  Custom(String)
}

pub const type_name = "image"

pub fn to_string(ct: Image) -> String {
  case ct {
    JPEG -> "jpeg"
    PNG -> "png"
    Custom(s) -> s
  }
}

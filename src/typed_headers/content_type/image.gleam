pub type Image {
  JPEG
  PNG
  Custom(String)
}

pub const type_name = "image"

pub fn to_string(image: Image) -> String {
  case image {
    JPEG -> "jpeg"
    PNG -> "png"
    Custom(s) -> s
  }
}

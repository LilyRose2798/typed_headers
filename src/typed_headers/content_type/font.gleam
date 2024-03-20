pub type Font {
  Collection
  OTF
  SFNT
  TTF
  WOFF
  WOFF2
  Custom(String)
}

pub const type_name = "font"

pub fn to_string(ct: Font) -> String {
  case ct {
    Collection -> "collection"
    OTF -> "otf"
    SFNT -> "sfnt"
    TTF -> "ttf"
    WOFF -> "woff"
    WOFF2 -> "woff2"
    Custom(s) -> s
  }
}

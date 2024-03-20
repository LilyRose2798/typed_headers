pub type Video {
  RAW
  MP4
  MPV
  WEBM
  Custom(String)
}

pub const type_name = "video"

pub fn to_string(video: Video) -> String {
  case video {
    RAW -> "raw"
    MP4 -> "mp4"
    MPV -> "MPV"
    WEBM -> "webm"
    Custom(s) -> s
  }
}

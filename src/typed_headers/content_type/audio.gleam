pub type Audio {
  AAC
  FLAC
  MPEG
  MP3
  WEBM
  Custom(String)
}

pub const type_name = "audio"

pub fn to_string(audio: Audio) -> String {
  case audio {
    AAC -> "aac"
    FLAC -> "flac"
    MPEG -> "mpeg"
    MP3 -> "mp3"
    WEBM -> "webm"
    Custom(s) -> s
  }
}

import gleam/list
import typed_headers/utils

pub type WEBMCodec {
  VP8
  VP80
}

fn webm_codec_to_string(c: WEBMCodec) {
  case c {
    VP8 -> "vp8"
    VP80 -> "vp8.0"
  }
}

pub type Video {
  RAW
  MP4
  MPV
  WEBM
  WEBMWithCodecs(List(WEBMCodec))
  Custom(String)
}

pub const type_name = "video"

pub fn to_string(video: Video) -> String {
  case video {
    RAW -> "raw"
    MP4 -> "mp4"
    MPV -> "MPV"
    WEBM -> "webm"
    WEBMWithCodecs(c) ->
      "webm" <> utils.codecs_to_string(list.map(c, webm_codec_to_string))
    Custom(s) -> s
  }
}

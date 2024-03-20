import gleam/list
import typed_headers/utils

pub type WEBMCodec {
  VorbisCodec
  OPUSCodec
}

fn webm_codec_to_string(c: WEBMCodec) {
  case c {
    VorbisCodec -> "vorbis"
    OPUSCodec -> "opus"
  }
}

pub type Audio {
  AAC
  FLAC
  MPEG
  MP3
  WEBM
  WEBMWithCodecs(codecs: List(WEBMCodec))
  Custom(String)
}

pub const type_name = "audio"

pub fn to_string(ct: Audio) -> String {
  case ct {
    AAC -> "aac"
    FLAC -> "flac"
    MPEG -> "mpeg"
    MP3 -> "mp3"
    WEBM -> "webm"
    WEBMWithCodecs(c) ->
      "webm" <> utils.codecs_to_string(list.map(c, webm_codec_to_string))
    Custom(s) -> s
  }
}

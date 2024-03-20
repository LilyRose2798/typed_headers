import gleam/string
import gleam/list

fn codecs_to_string(codecs: List(String)) -> String {
  "; codecs=\"" <> string.join(codecs, ", ") <> "\""
}

pub type ApplicationContentType {
  JSONApplicationContentType
  XMLApplicationContentType
  OGGApplicationContentType
  OGGWithCodecsApplicationContentType(codecs: List(String))
  CustomApplicationContentType(String)
}

fn application_to_string(ct: ApplicationContentType) -> String {
  case ct {
    JSONApplicationContentType -> "json"
    XMLApplicationContentType -> "xml"
    OGGApplicationContentType -> "ogg"
    OGGWithCodecsApplicationContentType(c) -> "ogg" <> codecs_to_string(c)
    CustomApplicationContentType(s) -> s
  }
}

pub type WEBMAudioCodec {
  VorbisWEBMAudioCodec
  OPUSWEBMAudioCodec
}

fn webm_audio_codec_to_string(c: WEBMAudioCodec) {
  case c {
    VorbisWEBMAudioCodec -> "vorbis"
    OPUSWEBMAudioCodec -> "opus"
  }
}

pub type AudioContentType {
  AACAudioContentType
  FLACAudioContentType
  MPEGAudioContentType
  MP3AudioContentType
  WEBMAudioContentType
  WEBMWithCodecsAudioContentType(codecs: List(WEBMAudioCodec))
  CustomAudioContentType(String)
}

fn audio_to_string(ct: AudioContentType) -> String {
  case ct {
    AACAudioContentType -> "aac"
    FLACAudioContentType -> "flac"
    MPEGAudioContentType -> "mpeg"
    MP3AudioContentType -> "mp3"
    WEBMAudioContentType -> "webm"
    WEBMWithCodecsAudioContentType(c) ->
      "webm" <> codecs_to_string(list.map(c, webm_audio_codec_to_string))
    CustomAudioContentType(s) -> s
  }
}

pub type FontContentType {
  CollectionFontContentType
  OTFFontContentType
  SFNTFontContentType
  TTFFontContentType
  WOFFFontContentType
  WOFF2FontContentType
  CustomFontContentType(String)
}

fn font_to_string(ct: FontContentType) -> String {
  case ct {
    CollectionFontContentType -> "collection"
    OTFFontContentType -> "otf"
    SFNTFontContentType -> "sfnt"
    TTFFontContentType -> "ttf"
    WOFFFontContentType -> "woff"
    WOFF2FontContentType -> "woff2"
    CustomFontContentType(s) -> s
  }
}

pub type ExampleContentType {
  CustomExampleContentType(String)
}

fn example_to_string(ct: ExampleContentType) -> String {
  case ct {
    CustomExampleContentType(s) -> s
  }
}

pub type ImageContentType {
  JPEGImageContentType
  PNGImageContentType
  CustomImageContentType(String)
}

fn image_to_string(ct: ImageContentType) -> String {
  case ct {
    JPEGImageContentType -> "jpeg"
    PNGImageContentType -> "png"
    CustomImageContentType(s) -> s
  }
}

pub type MessageContentType {
  HTTPMessageContentType
  SIPMessageContentType
  CustomMessageContentType(String)
}

fn message_to_string(ct: MessageContentType) -> String {
  case ct {
    HTTPMessageContentType -> "http"
    SIPMessageContentType -> "sip"
    CustomMessageContentType(s) -> s
  }
}

pub type ModelContentType {
  STEPModelContentType
  OBJModelContentType
  CustomModelContentType(String)
}

fn model_to_string(ct: ModelContentType) -> String {
  case ct {
    STEPModelContentType -> "step"
    OBJModelContentType -> "obj"
    CustomModelContentType(s) -> s
  }
}

pub type MultipartContentType {
  FormDataMultipartContentType
  MixedMultipartContentType
  CustomMultipartContentType(String)
}

fn multipart_to_string(ct: MultipartContentType) -> String {
  case ct {
    FormDataMultipartContentType -> "form-data"
    MixedMultipartContentType -> "mixed"
    CustomMultipartContentType(s) -> s
  }
}

pub type TextContentType {
  PlainTextContentType
  HTMLTextContentType
  JavascriptTextContentType
  CSSTextContentType
  CustomTextContentType(String)
}

fn text_to_string(ct: TextContentType) -> String {
  case ct {
    PlainTextContentType -> "plain"
    HTMLTextContentType -> "html"
    JavascriptTextContentType -> "javascript"
    CSSTextContentType -> "css"
    CustomTextContentType(s) -> s
  }
}

pub type WEBMVideoCodec {
  VP8WEBMVideoCodec
  VP80WEBMVideoCodec
}

fn webm_video_codec_to_string(c: WEBMVideoCodec) {
  case c {
    VP8WEBMVideoCodec -> "vp8"
    VP80WEBMVideoCodec -> "vp8.0"
  }
}

pub type VideoContentType {
  RAWVideoContentType
  MP4VideoContentType
  MPVVideoContentType
  WEBMVideoContentType
  WEBMWithCodecsVideoContentType(List(WEBMVideoCodec))
  CustomVideoContentType(String)
}

fn video_to_string(ct: VideoContentType) -> String {
  case ct {
    RAWVideoContentType -> "raw"
    MP4VideoContentType -> "mp4"
    MPVVideoContentType -> "MPV"
    WEBMVideoContentType -> "webm"
    WEBMWithCodecsVideoContentType(c) ->
      "webm" <> codecs_to_string(list.map(c, webm_video_codec_to_string))
    CustomVideoContentType(s) -> s
  }
}

pub type ContentType {
  ApplicationContentType(ApplicationContentType)
  ApplicationWithCodecsContentType(ApplicationContentType, codecs: List(String))
  AudioContentType(AudioContentType)
  AudioWithCodecsContentType(AudioContentType, codecs: List(String))
  FontContentType(FontContentType)
  ExampleContentType(ExampleContentType)
  ImageContentType(ImageContentType)
  MessageContentType(MessageContentType)
  ModelContentType(ModelContentType)
  MultipartContentType(MultipartContentType)
  TextContentType(TextContentType)
  VideoContentType(VideoContentType)
  VideoWithCodecsContentType(VideoContentType, codecs: List(String))
  CustomContentType(media_type: String, sub_type: String)
  CustomRawContentType(String)
}

pub const header_name = "Content-Type"

fn mime(media_type: String, sub_type: String) {
  media_type <> "/" <> sub_type
}

pub fn to_string(content_type: ContentType) -> String {
  case content_type {
    ApplicationContentType(ct) -> mime("application", application_to_string(ct))
    ApplicationWithCodecsContentType(ct, cd) ->
      mime("application", application_to_string(ct)) <> codecs_to_string(cd)
    AudioContentType(ct) -> mime("audio", audio_to_string(ct))
    AudioWithCodecsContentType(ct, cd) ->
      mime("audio", audio_to_string(ct)) <> codecs_to_string(cd)
    FontContentType(ct) -> mime("font", font_to_string(ct))
    ExampleContentType(ct) -> mime("example", example_to_string(ct))
    ImageContentType(ct) -> mime("image", image_to_string(ct))
    MessageContentType(ct) -> mime("message", message_to_string(ct))
    ModelContentType(ct) -> mime("model", model_to_string(ct))
    MultipartContentType(ct) -> mime("multipart", multipart_to_string(ct))
    TextContentType(ct) -> mime("text", text_to_string(ct))
    VideoContentType(ct) -> mime("video", video_to_string(ct))
    VideoWithCodecsContentType(ct, cd) ->
      mime("video", video_to_string(ct)) <> codecs_to_string(cd)
    CustomContentType(mt, st) -> mime(mt, st)
    CustomRawContentType(s) -> s
  }
}

import gleam/string
import typed_headers/content_type/application
import typed_headers/content_type/audio
import typed_headers/content_type/font
import typed_headers/content_type/example
import typed_headers/content_type/image
import typed_headers/content_type/message
import typed_headers/content_type/model
import typed_headers/content_type/multipart
import typed_headers/content_type/text
import typed_headers/content_type/video

pub type ContentType {
  Application(application.Application)
  ApplicationWithCodecs(application.Application, codecs: List(String))
  Audio(audio.Audio)
  AudioWithCodecs(audio.Audio, codecs: List(String))
  Font(font.Font)
  Example(example.Example)
  Image(image.Image)
  Message(message.Message)
  Model(model.Model)
  Multipart(multipart.Multipart)
  Text(text.Text)
  Video(video.Video)
  VideoWithCodecs(video.Video, codecs: List(String))
  Custom(media_type: String, sub_type: String)
  Raw(String)
}

pub const header_name = "Content-Type"

fn mime(media_type: String, sub_type: String) {
  media_type <> "/" <> sub_type
}

fn codecs_to_string(codecs: List(String)) -> String {
  "; codecs=\"" <> string.join(codecs, ", ") <> "\""
}

pub fn to_string(content_type: ContentType) -> String {
  case content_type {
    Application(st) -> mime(application.type_name, application.to_string(st))
    ApplicationWithCodecs(st, cd) ->
      mime(application.type_name, application.to_string(st))
      <> codecs_to_string(cd)
    Audio(st) -> mime(audio.type_name, audio.to_string(st))
    AudioWithCodecs(st, cd) ->
      mime(audio.type_name, audio.to_string(st)) <> codecs_to_string(cd)
    Font(st) -> mime(font.type_name, font.to_string(st))
    Example(st) -> mime(example.type_name, example.to_string(st))
    Image(st) -> mime(image.type_name, image.to_string(st))
    Message(st) -> mime(message.type_name, message.to_string(st))
    Model(st) -> mime(model.type_name, model.to_string(st))
    Multipart(st) -> mime(multipart.type_name, multipart.to_string(st))
    Text(st) -> mime(text.type_name, text.to_string(st))
    Video(st) -> mime(video.type_name, video.to_string(st))
    VideoWithCodecs(st, cd) ->
      mime(video.type_name, video.to_string(st)) <> codecs_to_string(cd)
    Custom(mt, st) -> mime(mt, st)
    Raw(s) -> s
  }
}

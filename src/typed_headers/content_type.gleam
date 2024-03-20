import typed_headers/utils
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
  CustomContentType(media_type: String, sub_type: String)
  CustomRawContentType(String)
}

pub const header_name = "Content-Type"

fn mime(media_type: String, sub_type: String) {
  media_type <> "/" <> sub_type
}

pub fn to_string(content_type: ContentType) -> String {
  case content_type {
    Application(ct) -> mime(application.type_name, application.to_string(ct))
    ApplicationWithCodecs(ct, cd) ->
      mime(application.type_name, application.to_string(ct))
      <> utils.codecs_to_string(cd)
    Audio(ct) -> mime(audio.type_name, audio.to_string(ct))
    AudioWithCodecs(ct, cd) ->
      mime(audio.type_name, audio.to_string(ct)) <> utils.codecs_to_string(cd)
    Font(ct) -> mime(font.type_name, font.to_string(ct))
    Example(ct) -> mime(example.type_name, example.to_string(ct))
    Image(ct) -> mime(image.type_name, image.to_string(ct))
    Message(ct) -> mime(message.type_name, message.to_string(ct))
    Model(ct) -> mime(model.type_name, model.to_string(ct))
    Multipart(ct) -> mime(multipart.type_name, multipart.to_string(ct))
    Text(ct) -> mime(text.type_name, text.to_string(ct))
    Video(ct) -> mime(video.type_name, video.to_string(ct))
    VideoWithCodecs(ct, cd) ->
      mime(video.type_name, video.to_string(ct)) <> utils.codecs_to_string(cd)
    CustomContentType(mt, st) -> mime(mt, st)
    CustomRawContentType(s) -> s
  }
}

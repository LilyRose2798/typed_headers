pub type Message {
  HTTP
  SIP
  Custom(String)
}

pub const type_name = "message"

pub fn to_string(message: Message) -> String {
  case message {
    HTTP -> "http"
    SIP -> "sip"
    Custom(s) -> s
  }
}

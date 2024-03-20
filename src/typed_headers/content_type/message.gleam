pub type Message {
  HTTP
  SIP
  Custom(String)
}

pub const type_name = "message"

pub fn to_string(ct: Message) -> String {
  case ct {
    HTTP -> "http"
    SIP -> "sip"
    Custom(s) -> s
  }
}

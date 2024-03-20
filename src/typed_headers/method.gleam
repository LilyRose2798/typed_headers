pub type Method {
  GET
  POST
  PUT
  PATCH
  DELETE
  HEAD
  OPTIONS
  TRACE
  CONNECT
  Custom(String)
}

pub fn to_string(method: Method) -> String {
  case method {
    GET -> "GET"
    POST -> "POST"
    PUT -> "PUT"
    PATCH -> "PATCH"
    DELETE -> "DELETE"
    HEAD -> "HEAD"
    OPTIONS -> "OPTIONS"
    TRACE -> "TRACE"
    CONNECT -> "CONNECT"
    Custom(s) -> s
  }
}

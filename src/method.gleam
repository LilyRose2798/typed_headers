pub type Method {
  GETMethod
  POSTMethod
  PUTMethod
  PATCHMethod
  DELETEMethod
  HEADMethod
  OPTIONSMethod
  TRACEMethod
  CONNECTMethod
  CustomMethod(String)
}

pub fn to_string(method: Method) -> String {
  case method {
    GETMethod -> "GET"
    POSTMethod -> "POST"
    PUTMethod -> "PUT"
    PATCHMethod -> "PATCH"
    DELETEMethod -> "DELETE"
    HEADMethod -> "HEAD"
    OPTIONSMethod -> "OPTIONS"
    TRACEMethod -> "TRACE"
    CONNECTMethod -> "CONNECT"
    CustomMethod(s) -> s
  }
}

import gleeunit
import gleeunit/should
import gleam/list
import typed_headers
import content_type

pub fn main() {
  gleeunit.main()
}

pub fn single_header_test() {
  typed_headers.ContentTypeHeader(content_type.ApplicationContentType(
    content_type.JSONApplicationContentType,
  ))
  |> typed_headers.to_string()
  |> should.equal("Content-Type: application/json")
}

pub fn multiple_header_test() {
  [
    typed_headers.ContentTypeHeader(content_type.ApplicationContentType(
      content_type.JSONApplicationContentType,
    )),
  ]
  |> list.map(typed_headers.to_string)
  |> should.equal(["Content-Type: application/json"])
}

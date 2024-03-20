import gleam/list
import gleeunit
import gleeunit/should
import typed_headers/header
import typed_headers/content_type
import typed_headers/content_type/application

pub fn main() {
  gleeunit.main()
}

pub fn single_header_test() {
  header.ContentType(content_type.Application(application.JSON))
  |> header.to_string()
  |> should.equal("Content-Type: application/json")
}

pub fn multiple_header_test() {
  [header.ContentType(content_type.Application(application.JSON))]
  |> list.map(header.to_string)
  |> should.equal(["Content-Type: application/json"])
}

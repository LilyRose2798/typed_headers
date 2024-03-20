pub type Model {
  STEP
  OBJ
  Custom(String)
}

pub const type_name = "model"

pub fn to_string(model: Model) -> String {
  case model {
    STEP -> "step"
    OBJ -> "obj"
    Custom(s) -> s
  }
}

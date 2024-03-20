pub type Model {
  STEP
  OBJ
  Custom(String)
}

pub const type_name = "model"

pub fn to_string(ct: Model) -> String {
  case ct {
    STEP -> "step"
    OBJ -> "obj"
    Custom(s) -> s
  }
}

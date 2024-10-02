enum TypeRequest {
  ADD,
  EDIT,
  DELETE,
  NONE,
}

TypeRequest TypeRequestFromString(String value) {
  return TypeRequest.values.firstWhere((e) => e.toString().split('.')[1] == value);
}

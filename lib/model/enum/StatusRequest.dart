enum StatusRequest {
  PENDING,
  ERROR,
  SUCCESS,
  PENDING_AGAIN,
}

/*
StatusRequest statusRequestFromString(String value) {
  return StatusRequest.values.firstWhere((e) => e.toString().split('.')[1] == value);
}

 */
StatusRequest? statusRequestFromString(String? value) {
  if (value == null) return null;
  StatusRequest? statusRequest;
  for (StatusRequest status in StatusRequest.values) {
    if (status.toString().split('.')[1].toUpperCase() == value.toUpperCase()) {
      statusRequest = status;
      return statusRequest;
    }
  }
  throw ArgumentError('Invalid status request value: $value');
}

String statusRequestToString(StatusRequest status) {
  return status.toString().split('.')[1];
}
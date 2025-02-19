class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  dynamic responseBody;
  String errorMessage;
  String successMessage;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.responseBody,
    this.errorMessage = 'Something went wrong',
    this.successMessage = 'success',
  });
}

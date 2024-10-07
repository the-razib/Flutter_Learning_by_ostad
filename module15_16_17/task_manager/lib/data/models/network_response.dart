class NetworkResponse {
  final bool isSucess;
  final int statusCode;
  dynamic responseData;
  String errorMessage;

  NetworkResponse({
    required this.isSucess,
    required this.statusCode,
    this.responseData,
    this.errorMessage = 'Something went wrong',
  });
}

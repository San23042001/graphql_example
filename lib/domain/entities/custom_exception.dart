class CustomException implements Exception {
  final int? errorCode;
  final String? errorMessage;

  CustomException({this.errorCode, this.errorMessage});

  @override
  String toString() {
    return 'CustomException{errorCode: $errorCode, errorMessage: $errorMessage}';
  }
}

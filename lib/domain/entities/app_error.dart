class AppError {
  final AppErrorType type;
  late String errorMessage;
  final String? errorDescription;
  final int? errorCode;

  AppError({
    required this.type,
    this.errorCode,
    String? errorMessage,
    this.errorDescription,
  }) {
    switch (type) {
      case AppErrorType.network:
        this.errorMessage =
            errorMessage ?? 'It seems you are not connected to the internet';
        break;
      case AppErrorType.api:
        this.errorMessage = errorMessage ?? 'Oops! something went wrong';
        break;
      case AppErrorType.unknown:
        this.errorMessage = errorMessage ?? 'Something went wrong';
        break;
      case AppErrorType.timeout:
        this.errorMessage = errorMessage ?? 'Request timed out';
        break;
      case AppErrorType.database:
        this.errorMessage = errorMessage ?? 'Database error';
        break;
    }
  }

  @override
  String toString() {
    return 'AppError{type: $type, message: $errorMessage, code: $errorCode}';
  }
}

enum AppErrorType {
  api,
  network,
  timeout,
  database,
  unknown,
}

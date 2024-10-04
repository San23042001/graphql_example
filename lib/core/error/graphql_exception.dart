class GraphQLException implements Exception {
  final String message;
  final String details;

  GraphQLException(this.message, {this.details = ''});

  @override
  String toString() => 'GraphQLException: $message\nDetails: $details';
}

class SocketException extends GraphQLException {
  SocketException(super.message, {super.details});
}

class ServerException extends GraphQLException {
  ServerException(super.message, {super.details});
}

class TimeoutException extends GraphQLException {
  TimeoutException(super.message, {super.details});
}

class UnknownException extends GraphQLException {
  UnknownException(super.message, {super.details});
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:io';
import 'dart:async';

class ExceptionHandlers {
  String getExceptionString(error) {
    if (error is SocketException) {
      _showInternetConnectionToast();
      return 'No internet connection.';
    } else if (error is HttpException) {
      return 'HTTP error occurred.';
    } else if (error is FormatException) {
      return 'Invalid data format.';
    } else if (error is TimeoutException) {
      return 'Request timed out.';
    } else if (error is OperationException) {
      return _handleGraphQLOperationException(error);
    } else {
      return 'Unknown error occurred.';
    }
  }

  // Handle OperationException from GraphQL
  String _handleGraphQLOperationException(OperationException error) {
    if (error.linkException is ServerException) {
      _showInternetConnectionToast();
      return 'Server error occurred.';
    } else if (error.graphqlErrors.isNotEmpty) {
      return error.graphqlErrors.map((e) => e.message).join(', ');
    } else {
      return 'Unknown GraphQL error occurred.';
    }
  }

  void _showInternetConnectionToast() {
    Fluttertoast.showToast(
      msg: "Please check your internet connection.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

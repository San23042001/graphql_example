import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:graphql_example/domain/entities/app_error.dart';
import 'package:graphql_example/domain/entities/custom_exception.dart';

class ApiCallWithError {
  const ApiCallWithError._();

  static Future<Either<AppError, T>> call<T>(Future<T> Function() f) async {
    try {
      final res = await f();
      return Right(res);
    } on SocketException {
      Fluttertoast.showToast(msg: 'No Internet Connection!');
      return Left(
        AppError(
          type: AppErrorType.network,
        ),
      );
    } on OperationException catch (e) {
      if (e.linkException is ServerException) {
        Fluttertoast.showToast(msg: 'Server Error!');
        return Left(
          AppError(
            type: AppErrorType.api,
            errorMessage: 'Failed to communicate with the server.',
          ),
        );
      } else if (e.linkException is SocketException) {
        Fluttertoast.showToast(msg: 'No Internet Connection!');
        return Left(
          AppError(
            type: AppErrorType.network,
          ),
        );
      } else {
        Fluttertoast.showToast(msg: 'Internet Unstable!');
        return Left(
          AppError(
            type: AppErrorType.network,
          ),
        );
      }
    } on TimeoutException {
      return Left(
        AppError(
          type: AppErrorType.timeout,
          errorMessage: 'Request timed out',
        ),
      );
    } on CustomException catch (e) {
      return Left(
        AppError(type: AppErrorType.api, errorMessage: e.errorMessage),
      );
    } on Exception catch (e) {
      return Left(
        AppError(
          type: AppErrorType.unknown,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}

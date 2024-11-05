import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../exceptions/exceptions.dart';
import '../exceptions/failure.dart';

mixin errorHandler {
  Future<Either<Failure, T>> eitherHandler<T>(
      Future<T> Function() callback) async {
    try {
      final result = await callback();
      return right(result);
    } on DioException catch (e) {
      return left(
        Failure(
          message:
              e.response?.data['title'] ?? e.message ?? 'something went wrong',
        ),
      );
    } on ServerException catch (e) {
      return left(
        ServerFailure(
            message: e.message,
            messageArray: e.errors,
            statusCode: e.statusCode),
      );
    } on Exception catch (e) {
      return left(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }

  Stream<T> streamHandler<T>(Stream<T> Function() body) {
    try {
      return body().handleError((e) {
        throw Failure(
          message: e.toString(),
        );
      });
    } on Exception catch (e) {
      return Stream.error(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }
}

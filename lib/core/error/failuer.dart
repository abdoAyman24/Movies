import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class Failuer {
  final String message;
  final IconData icon;

  Failuer({
    required this.message,
    required this.icon,
  });
}

class ServerFailuer extends Failuer {
  ServerFailuer({
    required super.message,
    required super.icon,
  });

  factory ServerFailuer.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuer(
          message: 'Connection to Api Was Timeout',
          icon: Icons.timer_off,
        );

      case DioExceptionType.sendTimeout:
        return ServerFailuer(
          message: 'Send to Api Was Timeout',
          icon: Icons.send,
        );

      case DioExceptionType.receiveTimeout:
        return ServerFailuer(
          message: 'Receive to Api Was Timeout',
          icon: Icons.download,
        );

      case DioExceptionType.badCertificate:
        return ServerFailuer(
          message: 'Bad Api Certificate',
          icon: Icons.security,
        );

      case DioExceptionType.badResponse:
        return ServerFailuer.fromResponse(
          dioError.response!.statusCode,
          dioError.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailuer(
          message: 'Request Was Cancelled',
          icon: Icons.cancel,
        );

      case DioExceptionType.connectionError:
        return ServerFailuer(
          message: 'Connection Error',
          icon: Icons.wifi_off,
        );

      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          return ServerFailuer(
            message: 'No Internet Connection',
            icon: Icons.signal_wifi_off,
          );
        }
        return ServerFailuer(
          message: 'Oops, something went wrong',
          icon: Icons.error,
        );
    }
  }

  factory ServerFailuer.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailuer(
        message: response['error']['message'],
        icon: Icons.warning,
      );
    } else if (statusCode == 404) {
      return ServerFailuer(
        message: 'Request not found',
        icon: Icons.search_off,
      );
    } else if (statusCode == 500) {
      return ServerFailuer(
        message: 'Internal server error',
        icon: Icons.dns,
      );
    } else {
      return ServerFailuer(
        message: 'Unexpected error',
        icon: Icons.error_outline,
      );
    }
  }
}

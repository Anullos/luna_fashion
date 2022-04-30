import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../presentation/utils/const.dart';

final baseOptions = BaseOptions(
  baseUrl: baseUrl,
  headers: {
    'Content-Type': 'application/json; charset=utf-8',
  },
);

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final userToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    log('AUTH TOKEN: $userToken');

    if (userToken != null) {
      final authorizationHeader = {
        'Content-Type': 'application/json',
        'Authorization': 'key=$messageKey',
      };
      options.headers.addAll(authorizationHeader);
    }

    return super.onRequest(options, handler);
  }
}

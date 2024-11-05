import 'package:dio/dio.dart';

import '../helpers/env_reader.dart';

class HeaderInterceptor extends Interceptor {
  HeaderInterceptor();

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = EnvReader().baseurl;
    options.headers.addAll({
      'Content-Type': 'application/json',
      // "Authorization": "Bearer ${loggedInUser.accessToken}"
    });

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final message = err.response?.data['title'] ?? err.message;
    super.onError(err.copyWith(message: message), handler);
  }
}

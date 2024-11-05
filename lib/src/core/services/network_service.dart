import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkService {
  Future<Response> get(
      {required String url, Map<String, dynamic>? queryParameters});

  Future<Response> post({required String url, dynamic data, dynamic params});

  Future<Response> put({required String url, dynamic data, dynamic params});

  Future<Response> delete({required String url});
}

@Injectable(as: NetworkService)
class DioService extends NetworkService {
  final Dio _dio;

  DioService(
    @Named("DioWithInterceptors") this._dio,
  );

  @override
  Future<Response> delete({required String url}) async {
    final response = await _dio.delete(url);
    return response;
  }

  @override
  Future<Response> get(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.get(url, queryParameters: queryParameters);
    return response;
  }

  @override
  Future<Response> post({required String url, data, params}) async {
    final response = await _dio.post(url, data: data, queryParameters: params);
    return response;
  }

  @override
  Future<Response> put({required String url, data, params}) {
    final response = _dio.put(
      url,
      data: data,
      queryParameters: params,
    );
    return response;
  }
}

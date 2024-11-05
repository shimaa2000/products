import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../interceptors/header_interceptor.dart';
import 'dependency_injector.config.dart';

final sl = GetIt.instance;
@InjectableInit()
Future<void> init() async {
  await dotenv.load();
  sl.init();
}


@module
abstract class DioModule {
  @Named("DioWithInterceptors")
  Dio get dio => Dio()
    ..interceptors.addAll([
      HeaderInterceptor(),
    ]);

  @Named("DioWithoutInterceptors")
  Dio get dioWithoutInterceptors => Dio();
}

import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

extension DioInterceptors on Dio {
  void addInterceptors() async {
    final loggerInterceptor = PrettyDioLogger(responseBody: false);

    interceptors.addAll([loggerInterceptor]);
  }
}

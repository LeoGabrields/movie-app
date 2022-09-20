import 'package:dio/dio.dart';
import 'package:movieapp/core/domain/services/http_service.dart';

class DioHttpServiceImp implements IHttpService {
  late Dio _dio;
  DioHttpServiceImp() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMjdmOTBlOWY2YzQwMTBmOGZhMjJkMGNmNzA0NGY2YiIsInN1YiI6IjYyZmFiN2I5ZmZjOWRlMDA3ZmVhMTFhZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vV31W4SWxGQFs_x3kS34DkLHrkWBXRywt7ZdLmxqc54'
        },
      ),
    );
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get<T>(path, queryParameters: queryParameters,);
  }
}

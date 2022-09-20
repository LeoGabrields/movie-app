import 'package:get_it/get_it.dart';
import 'package:movieapp/core/data/services/dio_http_service_imp.dart';
import 'package:movieapp/core/domain/services/http_service.dart';
import 'package:movieapp/features/movie/data/datasources/get_movies_datasource.dart';
import 'package:movieapp/features/movie/data/datasources/local/get_movies_local_datasource_decorator_imp.dart';
import 'package:movieapp/features/movie/data/datasources/remote/get_movies_remote_datasource.dart';
import 'package:movieapp/features/movie/data/repositories/get_movies_repository_imp.dart';
import 'package:movieapp/features/movie/domain/repositories/get_movies_repository.dart';
import 'package:movieapp/features/movie/domain/usecases/get_movies_usecase.dart';
import 'package:movieapp/features/movie/domain/usecases/get_movies_usecase_imp.dart';
import 'package:movieapp/features/movie/presentation/controllers/movie_controller.dart';

class Inject {
  static init() {
    GetIt getIt = GetIt.instance;

    // core
    getIt.registerLazySingleton<IHttpService>(() => DioHttpServiceImp());

    // datasource
    getIt.registerLazySingleton<IGetMoviesDataSouce>(
        () => GetMoviesLocalDataSourceImp(
              GetMoviesRemoteDataSourceImp(getIt()),
            ));

    // repositories
    getIt.registerLazySingleton<IGetMoviesRepository>(
        () => GetMoviesRepositoryImp(getIt()));

    // usecase
    getIt.registerLazySingleton<IGetMoviesUsecase>(
        () => GetMoviesUsecaseImp(getIt()));

    // controller
    getIt.registerLazySingleton<MovieController>(
        () => MovieController(getIt()));
  }
}

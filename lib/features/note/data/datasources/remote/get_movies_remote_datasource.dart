import 'package:dartz/dartz.dart';
import 'package:movieapp/core/domain/services/http_service.dart';
import 'package:movieapp/core/utils/apis.utils.dart';
import 'package:movieapp/features/note/data/datasources/get_movies_datasource.dart';
import 'package:movieapp/features/note/data/dtos/movie_dto.dart';
import 'package:movieapp/features/note/domain/entities/movie_entity.dart';

class GetMoviesRemoteDataSourceImp implements IGetMoviesDataSouce {
  final IHttpService _iHttpService;
  GetMoviesRemoteDataSourceImp(this._iHttpService);

  @override
  Future<Either<Exception, MovieEntity>> getMovies() async {
    try {
      var result = await _iHttpService.get(API.REQUEST_MOVIE_LIST);
      return Right(MovieDto.fromJson(result.data));
    } catch (e) {
      return Left(Exception('Falha no DataSource'));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:movieapp/features/note/data/datasources/get_movies_datasource.dart';
import 'package:movieapp/features/note/domain/entities/movie_entity.dart';
import 'package:movieapp/features/note/domain/repositories/get_movies_repository.dart';

class GetMoviesRepositoryImp implements IGetMoviesRepository {
  final IGetMoviesDataSouce _getMoviesDataSouce;
  GetMoviesRepositoryImp(this._getMoviesDataSouce);

  @override
  Future<Either<Exception, MovieEntity>> getMovies() async {
    return await _getMoviesDataSouce.getMovies();
  }
}

import 'package:dartz/dartz.dart';
import 'package:movieapp/features/note/data/datasources/get_movies_datasource.dart';
import 'package:movieapp/features/note/domain/entities/movie_entity.dart';

class GetMoviesDataSouceDecorator implements IGetMoviesDataSouce {
  final IGetMoviesDataSouce _iGetMoviesDataSouce;
  GetMoviesDataSouceDecorator(this._iGetMoviesDataSouce);

  @override
  Future<Either<Exception, MovieEntity>> getMovies() => _iGetMoviesDataSouce.getMovies();
 
}

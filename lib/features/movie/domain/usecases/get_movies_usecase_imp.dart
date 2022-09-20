import 'package:dartz/dartz.dart';
import 'package:movieapp/features/movie/domain/entities/movie_entity.dart';
import 'package:movieapp/features/movie/domain/repositories/get_movies_repository.dart';
import 'package:movieapp/features/movie/domain/usecases/get_movies_usecase.dart';

class GetMoviesUsecaseImp implements IGetMoviesUsecase {
  final IGetMoviesRepository _iGetMoviesRepository;
  GetMoviesUsecaseImp(this._iGetMoviesRepository);

  @override
  Future<Either<Exception, MovieEntity>> call() {
    return _iGetMoviesRepository.getMovies();
  }
}

import 'package:dartz/dartz.dart';
import 'package:movieapp/features/note/domain/entities/movie_entity.dart';

abstract class IGetMoviesUsecase {
  Future<Either<Exception, MovieEntity>> call();
}

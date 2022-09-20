import 'package:flutter/cupertino.dart';
import 'package:movieapp/features/movie/domain/entities/movie_details_entity.dart';
import 'package:movieapp/features/movie/domain/entities/movie_entity.dart';
import 'package:movieapp/features/movie/domain/usecases/get_movies_usecase.dart';
import 'package:movieapp/features/movie/presentation/dtos/movie_dtos.dart';

class MovieController {
  final IGetMoviesUsecase _getMoviesUseCase;
  MovieController(this._getMoviesUseCase) {
    fetch();
  }

  ValueNotifier<MovieEntity?> movies = ValueNotifier<MovieEntity?>(null);
  MovieEntity? _cachedMovies;

  onChanged(String value) {
    List<MovieDetailsEntity> list = _cachedMovies!.listMovies
        .where(
          (e) => e.title.toString().toLowerCase().contains((value.toLowerCase())),
        )
        .toList();
    movies.value = movies.value!.copyWith(listMovies: list);
  }

  fetch() async {
    var result = await _getMoviesUseCase();

    result.fold(
      (error) => debugPrint(error.toString()),
      (success) => movies.value = success,
    );

    _cachedMovies = movies.value;
  }
}

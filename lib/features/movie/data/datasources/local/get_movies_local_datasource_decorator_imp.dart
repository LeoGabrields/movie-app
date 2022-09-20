import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:movieapp/features/movie/data/datasources/get_movies_datasource.dart';
import 'package:movieapp/features/movie/data/datasources/local/get_movies_datasource_decorator.dart';
import 'package:movieapp/features/movie/data/dtos/movie_dto.dart';
import 'package:movieapp/features/movie/domain/entities/movie_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetMoviesLocalDataSourceImp extends GetMoviesDataSouceDecorator {
  GetMoviesLocalDataSourceImp(IGetMoviesDataSouce getMoviesDataSouce)
      : super(getMoviesDataSouce);

  @override
  Future<Either<Exception, MovieEntity>> getMovies() async {
    return (await super.getMovies()).fold(
      (error) async => Right(await _getInCache()),
      (result) {
        _saveInCache(result);
        return Right(result);
      },
    );
  }

  Future<MovieEntity> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var jsonStringMovies = prefs.getString('movies_cache')!;
    var json = jsonDecode(jsonStringMovies);
    var movies = MovieDto.fromJson(json);
    return movies;
  }

  void _saveInCache(MovieEntity movie) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movie.toJson());
    prefs.setString('movies_cache', jsonMovies);
  }
}

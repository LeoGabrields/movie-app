import 'package:movieapp/features/note/domain/entities/movie_details_entity.dart';
import 'package:movieapp/features/note/domain/entities/movie_entity.dart';

extension MovieDto on MovieEntity {
  MovieEntity copyWith({
    List<MovieDetailsEntity>? listMovies,
  }) {
    return MovieEntity(
      averageRating: averageRating,
      backdropPath: backdropPath,
      description: description,
      id: id,
      iso_3166_1: iso_3166_1,
      iso_639_1: iso_639_1,
      listMovies: listMovies ?? this.listMovies,
      name: name,
      page: page,
      posterPath: posterPath,
      public: public,
      revenue: revenue,
      runtime: runtime,
      sortBy: sortBy,
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}

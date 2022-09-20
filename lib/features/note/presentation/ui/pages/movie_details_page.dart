import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/core/utils/apis.utils.dart';
import 'package:movieapp/features/note/domain/entities/movie_details_entity.dart';


class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieDetailsEntity movie = ModalRoute.of(context)?.settings.arguments as MovieDetailsEntity;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Hero(
                tag: movie.id,
                child: CachedNetworkImage(
                  imageUrl: API.REQUEST_IMG(movie.posterPath),
                  placeholder: (context, url) => SizedBox(
                    width: 130,
                    child: Lottie.asset('assets/image.json'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Sinopse',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 10),
            Text(movie.overview)
          ],
        ),
      ),
    );
  }
}

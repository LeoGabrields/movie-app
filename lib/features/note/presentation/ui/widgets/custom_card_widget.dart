import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/core/utils/apis.utils.dart';
import 'package:movieapp/features/note/domain/entities/movie_details_entity.dart';



class CustomCardWidget extends StatelessWidget {
  final MovieDetailsEntity movie;
  const CustomCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/movieDetails', arguments: movie);
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const Spacer(),
                      Text('Popularidade: ${movie.popularity}'),
                      const SizedBox(height: 5),
                      Text('Nota: ${movie.voteAverage}'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

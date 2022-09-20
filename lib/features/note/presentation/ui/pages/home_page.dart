import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/features/note/domain/entities/movie_entity.dart';
import 'package:movieapp/features/note/presentation/controllers/movie_controller.dart';
import '../widgets/custom_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final MovieController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = GetIt.I.get<MovieController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 28, left: 20, right: 20, bottom: 3),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              ValueListenableBuilder<MovieEntity?>(
                  valueListenable: _controller.movies,
                  builder: (__, movies, _) {
                    return Visibility(
                      visible: movies != null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Filmes',
                              style: Theme.of(context).textTheme.headline4),
                          const SizedBox(height: 10),
                          Container(
                            color: Colors.grey[800],
                            height: 50,
                            child: TextField(
                              onChanged: _controller.onChanged,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
              const SizedBox(height: 10),
              ValueListenableBuilder<MovieEntity?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 10),
                          shrinkWrap: true,
                          itemCount: movies.listMovies.length,
                          itemBuilder: (_, index) =>
                              CustomCardWidget(movie: movies.listMovies[index]),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child:
                              Center(child: Lottie.asset('assets/lottie.json')),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CustomSearchDelegate extends SearchDelegate {
//   final List<String> movies;
//   CustomSearchDelegate({
//     required this.movies,
//   });

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: const Icon(Icons.clear),
//       )
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: const Icon(Icons.arrow_back),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List matchQuery = [];
//     for (var movie in movies) {
//       if (movie.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(movie);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List matchQuery = [];
//     for (var movie in movies) {
//       if (movie.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(movie);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }
// }

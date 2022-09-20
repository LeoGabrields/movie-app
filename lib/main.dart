import 'package:flutter/material.dart';
import 'package:movieapp/core/inject/inject.dart';
import 'package:movieapp/features/movie/presentation/ui/pages/home_page.dart';
import 'package:movieapp/features/movie/presentation/ui/pages/movie_details_page.dart';

main() {
  Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/movieDetails': (context) => const MovieDetailsPage(),
      },
    );
  }
}

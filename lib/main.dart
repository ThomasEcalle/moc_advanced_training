import 'package:flutter/material.dart';
import 'package:moc_2023_training/article.dart';

import 'article_page.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Home(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ArticlePage.routeName) {
          final parameters = settings.arguments;
          if (parameters is Article) {
            return MaterialPageRoute(
              builder: (context) => ArticlePage(article: parameters),
            );
          }
          return null;
        }
        return null;
      },
    );
  }
}

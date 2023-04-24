import 'package:flutter/material.dart';
import 'package:moc_2023_training/article.dart';
import 'package:moc_2023_training/favorite_icon.dart';

class ArticlePage extends StatelessWidget {
  static const routeName = '/article';

  static void navigateTo(BuildContext context, Article article) {
    Navigator.of(context).pushNamed(
      routeName,
      arguments: article,
    );
  }

  const ArticlePage({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        actions: const [
          FavoriteIcon(),
        ],
      ),
      body: Column(
        children: [
          Text(article.title),
          Text(article.description),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moc_2023_training/article.dart';
import 'package:moc_2023_training/article_item.dart';
import 'package:moc_2023_training/article_page.dart';

class ArticlesTab extends StatelessWidget {
  const ArticlesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getAllArticles(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }

        if (snapshot.hasData) {
          final articles = snapshot.data as List<Article>;

          if (articles.isEmpty) {
            return const Center(
              child: Text('No articles found'),
            );
          }

          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return ArticleItem(
                article: article,
                onTap: () => _onArticleTap(context, article),
              );
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void _onArticleTap(BuildContext context, Article article) {
    ArticlePage.navigateTo(context, article);
  }

  Future<List<Article>> _getAllArticles() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(
      100,
      (index) => Article(
        title: 'Title $index',
        description: 'Description $index',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moc_2023_training/article.dart';

import 'favorite_icon.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    Key? key,
    required this.article,
    this.onTap,
  }) : super(key: key);

  final Article article;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title),
      subtitle: Text(article.description),
      trailing: const FavoriteIcon(),
      onTap: onTap,
    );
  }
}

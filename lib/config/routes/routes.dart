import 'package:flutter/material.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/presentation/pages/article_detail/article_detail_page.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/news_page.dart';
import 'package:news_app/features/daily_news/presentation/pages/saved_article/liked_articles_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const NewsPage());

      case '/ArticleDetails':
        return _materialRoute(ArticleDetailsPage(article: settings.arguments as ArticleEntity));

      case '/LikedArticles':
        return _materialRoute(const LikedArticlesPage());
        
      default:
        return _materialRoute(const NewsPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
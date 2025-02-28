import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';


abstract class ArticleRepository {
  // API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Database methods
  Future <List< ArticleEntity >> getLikedArticles();

  Future <void> saveArticle(ArticleEntity article);

  Future <void> removeArticle(ArticleEntity article);
}
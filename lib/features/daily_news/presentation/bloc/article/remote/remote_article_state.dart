import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../domain/entities/article.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity> ? articles;
  final DioError ? error;
  
  const RemoteArticlesState({this.articles,this.error});
  
  @override
  List<Object> get props => [articles!, error!];
}

class RemoteArticlesLoadingState extends RemoteArticlesState {
  const RemoteArticlesLoadingState();
}

class RemoteArticlesDoneState extends RemoteArticlesState {
  const RemoteArticlesDoneState(List<ArticleEntity> article) : super(articles: article);
}

class RemoteArticlesErrorState extends RemoteArticlesState {
  const RemoteArticlesErrorState(DioError error) : super(error: error);
}
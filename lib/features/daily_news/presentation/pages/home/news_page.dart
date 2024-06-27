import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news_app/features/daily_news/presentation/widgets/article_tile.dart';


class NewsPage extends StatelessWidget {
  const NewsPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }
  
  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
          'Daily News',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => _onShowLikedArticlesViewTapped(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Icons.bookmark, color: Colors.black),
            ),
          ),
        ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc,RemoteArticlesState> (
      builder: (_,state) {
        if (state is RemoteArticlesLoadingState) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticlesErrorState) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticlesDoneState) {
          return ListView.builder(
           itemBuilder: (context,index){
            return ArticleWidget(
              article: state.articles![index],
              onArticlePressed: (article) => _onArticlePressed(context,article),
            );
           },
           itemCount: state.articles!.length,
         );
        }
        return const SizedBox();
      },
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void _onShowLikedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/LikedArticles');
  }
}
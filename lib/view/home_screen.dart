import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_new/controller/top_news_controller.dart';
import 'package:hacker_new/widgets/home_article_list.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(TopNewsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Top News"), centerTitle: true),
        body: GetX<TopNewsController>(
          builder: (ctr) {
            if (!ctr.loading) return Center(child: CircularProgressIndicator());
            if (ctr.articles.length == 0)
              return Center(child: Text("No top article"));
            return ListView.builder(
              itemCount: ctr.articles.length,
              itemBuilder: (ctx, index) {
                return HomeArticleList(hackerNews: ctr.articles[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

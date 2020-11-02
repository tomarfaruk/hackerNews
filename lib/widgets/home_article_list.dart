import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_new/model/story_model.dart';
import 'package:jiffy/jiffy.dart';

class HomeArticleList extends StatelessWidget {
  final StoryModel hackerNews;

  const HomeArticleList({Key key, this.hackerNews}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed('detailsScreen',
          arguments: {'url': hackerNews.url, 'comments': hackerNews.children}),
      isThreeLine: true,
      leading: Text("ponts:\n+${hackerNews.points}"),
      trailing: Column(
        children: [
          Icon(Icons.comment),
          Text("${hackerNews?.children?.length}" ?? '0')
        ],
      ),
      title: Text(hackerNews.title),
      subtitle: Text(
          "author: ${hackerNews?.author}, ${Jiffy(hackerNews?.createdAt).fromNow()}"),
    );
  }
}

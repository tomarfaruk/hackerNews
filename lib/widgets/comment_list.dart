import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:hacker_new/model/story_model.dart';

class CommentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Children> comments = Get.arguments['comments'];
    return ListView.builder(
      itemBuilder: (context, index) {
        Children comment = comments[index];
        return Column(
          children: [
            ListTile(
              title: Text(
                comment?.author ?? "",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Html(data: comment?.text ?? ""),
            ),
            if (comment?.children != null) ...[
              ...comment.children.map(
                (e) => Container(
                  padding: EdgeInsets.only(left: 24),
                  child: ListTile(
                    title: Text(
                      e?.author ?? "",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Html(data: e?.text ?? ""),
                  ),
                ),
              )
            ]
          ],
        );
      },
      itemCount: comments.length,
    );
  }
}

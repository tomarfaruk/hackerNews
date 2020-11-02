import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hacker_new/widgets/comment_list.dart';
import 'package:hacker_new/widgets/details_webview.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  int currentTab = 0;

  List<Widget> tabList = [DetailsWebView(), CommentList()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              title: Text(currentTab == 0 ? 'Details View' : 'Comment View'),
              centerTitle: true),
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black38,
              onTap: (value) {
                setState(() {
                  currentTab = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  title: Text('Details',
                      style: TextStyle(
                          color: currentTab == 0 ? Colors.blue : Colors.grey)),
                  icon: Icon(Icons.details,
                      color: currentTab == 0 ? Colors.blue : Colors.grey),
                ),
                BottomNavigationBarItem(
                  title: Text(
                    'Comment',
                    style: TextStyle(
                        color: currentTab == 1 ? Colors.blue : Colors.grey),
                  ),
                  icon: Icon(
                    Icons.comment,
                    color: currentTab == 1 ? Colors.blue : Colors.grey,
                  ),
                ),
              ]),
          body: tabList[currentTab]),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flutterWebViewPlugin?.dispose();
  }
}

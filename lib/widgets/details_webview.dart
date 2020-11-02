import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';

class DetailsWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      key: UniqueKey(),
      withJavascript: true,
      url: Get.arguments['url'],
      withLocalStorage: true,
      hidden: true,
      withZoom: true,
      initialChild: const Center(child: CircularProgressIndicator()),
    );
  }
}

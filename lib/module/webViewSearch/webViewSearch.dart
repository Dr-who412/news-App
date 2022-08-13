import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewSearch extends StatelessWidget {
  final   String url;
  const WebViewSearch({Key? key,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
       initialUrl: url,
      ),
    );
  }
}

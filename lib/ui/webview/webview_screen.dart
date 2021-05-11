import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wefinex/shared/constant/common.dart'; // Developed by  flutter team : widget  WebView

class WebViewScreen extends StatelessWidget {
  final key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final url = Common().myConfig.BASE_URL_XOSO + (Get.parameters['link'] ?? 'https://www.google.com');
    print('url=' + url);
    return WebView(
      key: key,
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: url,
      onWebViewCreated: (WebViewController webViewController) {},
    );
  }
}

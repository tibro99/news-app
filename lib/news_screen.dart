import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class News_Screen extends StatelessWidget {
  final newsLink;
   News_Screen({required this.newsLink, super.key});

  final controller = WebViewController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: WebViewWidget(
            controller: controller
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setBackgroundColor(const Color(0x00000000))
              ..setNavigationDelegate(
                NavigationDelegate(
                  onProgress: (int progress) {
                    // Update loading bar.
                  },
                  onPageStarted: (String url) {},
                  onPageFinished: (String url) {},
                  onWebResourceError: (WebResourceError error) {},
                  onNavigationRequest: (NavigationRequest request) {
                    if (request.url.startsWith('https://www.youtube.com/')) {
                      return NavigationDecision.prevent;
                    }
                    return NavigationDecision.navigate;
                  },
                ),
              )
              ..loadRequest(Uri.parse(newsLink))
            ,
          ),
      ),
    );
  }
}

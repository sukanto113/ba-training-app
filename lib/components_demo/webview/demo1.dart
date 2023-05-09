import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDemoDemo1 extends StatefulWidget {
  const WebViewDemoDemo1({super.key});

  @override
  State<WebViewDemoDemo1> createState() => _WebViewDemoDemo1State();
}

class _WebViewDemoDemo1State extends State<WebViewDemoDemo1> {
  double _progressValue = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
          setState(() {
            _progressValue = progress / 100;
          });
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://www.github.com"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Webview Demo"),
          actions: [
            IconButton(
              onPressed: () {
                controller.reload();
              },
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: _progressValue,
            ),
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

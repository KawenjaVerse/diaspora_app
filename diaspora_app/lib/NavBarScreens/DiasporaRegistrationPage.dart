import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DiasporaRegistrationPage extends StatefulWidget {
  final String url = 'https://ugandasdiaspora.org/';
  const DiasporaRegistrationPage({super.key});

  @override
  State<DiasporaRegistrationPage> createState() =>
      _DiasporaRegistrationPageState();
}

class _DiasporaRegistrationPageState extends State<DiasporaRegistrationPage> {
    late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
      
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Diaspora Registration',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFFF5C23),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

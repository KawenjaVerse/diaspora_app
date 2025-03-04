import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class DualPage extends StatefulWidget {
   final String url = 'https://www.immigration.go.ug/citizenship/dual';
  const DualPage({super.key});

  @override
  State<DualPage> createState() => _DualPageState();
}

class _DualPageState extends State<DualPage> {
    late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
      
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dual Citizenship',
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
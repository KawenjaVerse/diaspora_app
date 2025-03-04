import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class LandsPage extends StatefulWidget {
  final String url = 'https://mlhud.go.ug/';
  const LandsPage({super.key});

  @override
  State<LandsPage> createState() => _LandsPageState();
}

class _LandsPageState extends State<LandsPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
      
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ministry of Lands',
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
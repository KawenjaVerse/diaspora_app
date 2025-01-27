import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class NationalIDPage extends StatefulWidget {
  final String url = 'https://www.ugandaforms.org/appointment/';
  const NationalIDPage({super.key});

  @override
  State<NationalIDPage> createState() => _NationalIDPageState();
}

class _NationalIDPageState extends State<NationalIDPage> {
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
          'National ID Appointment',
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

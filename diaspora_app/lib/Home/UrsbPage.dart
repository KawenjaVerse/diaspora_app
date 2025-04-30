import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UrsbPage extends StatefulWidget {
  final String url = 'https://ursb.go.ug/';
  const UrsbPage({super.key});

  @override
  State<UrsbPage> createState() => _UrsbPageState();
}

class _UrsbPageState extends State<UrsbPage> {
  late final WebViewController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    // Optional: Show a dialog after loading, matching your other pages
    Future.delayed(Duration(seconds: 2), () {
      showNationalIDContactDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Uganda Registration Services Bureau',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFFF5C23),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFFF5C23),
              ),
            ),
        ],
      ),
    );
  }

  void showNationalIDContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('URSB follow up'),
          content: const Text(
            'After booking your appointment, please contact the diaspora team for further assistance and easy follow-up via: +256 414 674 906, info@diasporaaffairs.go.ug',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

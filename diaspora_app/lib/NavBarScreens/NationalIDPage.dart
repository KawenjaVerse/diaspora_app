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
          'National ID Appointment',
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
          title: const Text('National ID Appointment Follow-up'),
          content: const Text(
            'After booking your appointment, please contact the National ID team for further assistance and easy follow-up via: +256703034758',
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
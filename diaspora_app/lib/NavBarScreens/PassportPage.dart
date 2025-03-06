import 'package:flutter/material.dart';
      import 'package:webview_flutter/webview_flutter.dart';

      class PassportPage extends StatefulWidget {
        final String url = 'https://passports.go.ug/';
        const PassportPage({super.key});

        @override
        State<PassportPage> createState() => _PassportPageState();
      }

      class _PassportPageState extends State<PassportPage> {
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

          //delay for 3 seconds
          Future.delayed(Duration(seconds: 2), () {
            showPassportContactDialog(context);
          });
        }

        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Apply/Review Passport',
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

  void showPassportContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Passport Application Follow-up'),
          content: const Text(
            'After applying for the passport, please contact the passport team for further assistance and easy follow-up via: +256703034758',
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
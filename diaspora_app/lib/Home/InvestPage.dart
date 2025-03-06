import 'package:flutter/material.dart';
    import 'package:webview_flutter/webview_flutter.dart';

    class InvestPage extends StatefulWidget {
      final String url = 'https://www.ebiz.go.ug/';
      const InvestPage({super.key});


      @override
      State<InvestPage> createState() => _InvestPageState();
    }

    class _InvestPageState extends State<InvestPage> {
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
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Invest in Uganda',
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
    }
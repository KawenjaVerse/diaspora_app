import 'package:flutter/material.dart';
    import 'package:webview_flutter/webview_flutter.dart';

    class VisaPage extends StatefulWidget {
      final String url = 'https://visas.immigration.go.ug/';
      const VisaPage({super.key});

      @override
      State<VisaPage> createState() => _VisaPageState();
    }

    class _VisaPageState extends State<VisaPage> {
      late final WebViewController _controller;
      bool isLoading = true;

      @override
      void initState() {
        super.initState();

        _controller = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (p){
                print("Progress: $p");
              },
              onHttpError: (e) {
                print('HTTP error $e');
              },
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


        //delay for 5 seconds
        Future.delayed(Duration(seconds: 2), () {
          showDiasporaContactDialog(context);
        });
        //showDiasporaContactDialog(context);



      }
      void showDiasporaContactDialog(BuildContext context) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Visa Application Follow-up'),
              content: const Text(
                'After applying for the visa, please contact the diaspora team for further assistance and easy follow-up via: +256 414 674 906, info@diasporaaffairs.go.ug',
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

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Apply for Visa',
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
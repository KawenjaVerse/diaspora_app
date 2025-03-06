import 'package:flutter/material.dart';

class HeadMessagePage extends StatefulWidget {
  final String headImage;
  final String headName;
  final String headTitle;
  final String welcomeMessage;

  const HeadMessagePage({
    Key? key,
    required this.headImage,
    required this.headName,
    required this.headTitle,
    required this.welcomeMessage,
  }) : super(key: key);

  @override
  _HeadMessagePageState createState() => _HeadMessagePageState();
}

class _HeadMessagePageState extends State<HeadMessagePage> {
  bool _isExpanded = false;
  bool _showImage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Message from the Head',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFFF5C23),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[400],
            height: 1.0,
          ),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification.metrics.axis == Axis.vertical) {
            setState(() {
              _showImage = notification.metrics.pixels <= 0;
            });
          }
          return true;
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_showImage) // Conditionally display the image
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.headImage),
                      radius: 80,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.headName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.headTitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: const Color(0xFFFF5C23), // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      _isExpanded
                          ? widget.welcomeMessage
                          : widget.welcomeMessage.substring(
                              0,
                              widget.welcomeMessage.length > 100
                                  ? 100
                                  : widget.welcomeMessage.length,
                            ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                    if (widget.welcomeMessage.length > 100)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Text(
                          _isExpanded ? "Read Less" : "Read More",
                          style: const TextStyle(color: Color(0xFFFF5C23)),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
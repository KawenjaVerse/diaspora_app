import 'package:flutter/material.dart';

class HeadMessagePage extends StatelessWidget {
  final String headName;
  final String headTitle;
  final String headImage;
  final String welcomeMessage;

  const HeadMessagePage({
    Key? key,
    required this.headName,
    required this.headTitle,
    required this.headImage,
    required this.welcomeMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Message from the Head',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFFFF5C23),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[400],
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(headImage),
              radius: 80,
            ),
            const SizedBox(height: 16),
            Text(headName,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(headTitle,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Color(0xFFFF5C23), // Border color
                    width: 2.0, // Border width
                  )),
              child: Text(
                welcomeMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
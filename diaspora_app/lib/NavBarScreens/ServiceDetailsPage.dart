import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceDetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final String? document;

  const ServiceDetailsPage({
    super.key,
    required this.title,
    required this.description,
    this.document,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white,fontSize: 15),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: const Color(0xFFFF5C23),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            if (document != null)
              ElevatedButton.icon(
                onPressed: () async {
                  final Uri url = Uri.parse(document!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Could not open document.')),
                    );
                  }
                },
                icon: const Icon(Icons.file_download),
                label: const Text('Download Document'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5C23),
                  foregroundColor: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

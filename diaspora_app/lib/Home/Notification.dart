import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Notifications', style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFFFF5C23),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            NotificationCard(
              title: 'Welcome to State House Diaspora Unit App',
              description: 'You are receiving this message beacuse you have subscribed to receive notifications on this platform.',
              date: '2024-12-20',
            ),
            NotificationCard(
              title: 'DIASPORA UNIT APP Feedback',
              description: 'Thank you for installing and testing out the DIASPORA UNIT APP. Your feedback means alot to us as we progress.',
              date: '2024-12-19',
            ),
            NotificationCard(
              title: 'Event Reminder',
              description: 'Don’t forget the event happening tomorrow at 10:00 AM. See you there!',
              date: '2024-12-18',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  const NotificationCard({
    required this.title,
    required this.description,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 255, 239, 234),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side: Title and Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            // Right side: Date
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8.0),
                // Optional: A small circle icon (could represent something like a new indicator)
                Container(
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF5C23),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'DiasporaRegistrationPage.dart';
import 'NationalIDPage.dart';
import 'PassportPage.dart';
import 'VisaPage.dart';

class DiasporaServicePage extends StatefulWidget {
  const DiasporaServicePage({super.key});

  @override
  State<DiasporaServicePage> createState() => _DiasporaServicePageState();
}

class _DiasporaServicePageState extends State<DiasporaServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Diaspora Services',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFFF5C23),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          _buildServiceCard(
            imagePath: 'assets/images/diasp.jpg',
            title: 'Diaspora Registration',
            description: 'Diaspora Registration',
            onReadMore: () {
              // Navigate to the Diaspora Registration page (replace with your actual page)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DiasporaRegistrationPage()),
              );
            },
          ),
          _buildServiceCard(
            imagePath: 'assets/images/immg.jpg',
            title: 'Visas',
            description: 'New Application',
            onReadMore: () {
              // Navigate to the Visa page (replace with your actual page)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VisaPage()),
              );
            },
          ),
          _buildServiceCard(
            imagePath: 'assets/images/pssprt.jpg',
            title: 'Passports',
            description: 'Apply, Renew',
            onReadMore: () {
              // Navigate to the Passport page (replace with your actual page)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PassportPage()),
              );
            },
          ),
          _buildServiceCard(
            imagePath: 'assets/images/nat.jpg',
            title: 'National ID',
            description: 'National ID Appointment',
            onReadMore: () {
              // Navigate to the National ID page (replace with your actual page)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NationalIDPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required String imagePath,
    required String title,
    required String description,
    required VoidCallback onReadMore,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      shadowColor: Colors.black.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Service Image
            Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            // Service Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: onReadMore,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(8.0),
                      backgroundColor: const Color(0xFFFF5C23),
                     foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Read More',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}

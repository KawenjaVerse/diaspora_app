import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Partners',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0xFFFF5C23),
        elevation: 4.0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: _buildMinistryCards(),
      ),
    );
  }

  List<Widget> _buildMinistryCards() {
    final List<Map<String, String>> ministryData = [
      {
        "title": "MINISTRY OF FOREIGN AFFAIRS",
        "image": "assets/images/foreign.png",
        "url": "https://mofa.go.ug/",
      },
      {
        "title": "MINISTRY OF LANDS, HOUSING AND URBAN DEVELOPMENT",
        "image": "assets/images/lands.jpg",
        "url": "https://mlhud.go.ug/",
      },
      {
        "title": "MINISTRY OF ENERGY AND MINERAL DEVELOPMENT",
        "image": "assets/images/energy.png",
        "url": "https://dgsm.go.ug/contact/",
      },
      {
        "title": "MINISTRY OF TOURISM, WILDLIFE AND ANTIQUITIES",
        "image": "assets/images/wildlife.png",
        "url": "https://www.tourism.go.ug/",
      },
      {
        "title": "UGANDA REVENUE AUTHORITY",
        "image": "assets/images/ura.jpg",
        "url": "https://www.ura.go.ug",
      },
      {
        "title": "NIRA",
        "image": "assets/images/nira.jpg",
        "url": "https://www.nira.go.ug",
      },
      {
        "title": "BANK OF UGANDA",
        "image": "assets/images/bank.jpg",
        "url": "https://www.bou.or.ug",
      },
      {
        "title": "DIRECTORATE OF CITIZENSHIP AND IMMIGRATION CONTROL",
        "image": "assets/images/state.png",
        "url": "https://www.immigration.go.ug/home",
      },
      {
        "title": "STATE HOUSE INVESTORS PROTECTION UNIT",
        "image": "assets/images/state.png",
        "url": "https://www.statehouseinvest.go.ug/",
      },
    ];

    // Map each ministry to a ministry card
    return ministryData
        .map(
          (ministry) => buildMinistryCard(
            title: ministry['title']!,
            imagePath: ministry['image']!,
            url: ministry['url']!,
          ),
        )
        .toList();
  }

  Widget buildMinistryCard({
    required String title,
    required String imagePath,
    required String url,
  }) {
    return GestureDetector(
      onTap: () async {
        final Uri _url = Uri.parse(url); // Convert string URL to Uri
        if (await canLaunchUrl(_url)) {
          await launchUrl(_url); // Open the URL
        } else {
          throw 'Could not launch $url'; // Error if URL can't be opened
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ministry Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            // Ministry Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap to visit the website',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
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

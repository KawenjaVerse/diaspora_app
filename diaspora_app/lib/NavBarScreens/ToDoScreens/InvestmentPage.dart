import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Attraction {
  final String imagePath;
  final String type;
  final String name;
  final String description;
  final String location;

  Attraction({
    required this.imagePath,
    required this.type,
    required this.name,
    required this.description,
    required this.location,
  });
}
class InvestmentPage extends StatelessWidget {
  const InvestmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample dynamic data for accommodations
     final List<Attraction> investment = [
  Attraction(
        imagePath: 'assets/images/invest.jpg',
        type: 'INVESTMENTS',
        name: 'Several Investment Options in Uganda',
        description: 'Diversify your portfolio by investing in different industires.',
        location: '',
      ),
      Attraction(
        imagePath: 'assets/images/invest.jpg',
        type: 'INVESTMENTS',
        name: 'Several Investment Options in Uganda',
        description: 'Diversify your portfolio by investing in different industires.',
        location: '',
      )
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const SizedBox(height: 16),
            // Attraction Sites Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Investment Options',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle "View All" tap
                  },
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFF5C23),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: investment.length,
                itemBuilder: (context, index) {
                  final investments = investment[index];
                  return buildCard(investments);
                },
              ),
            ),
            const SizedBox(height: 32), // Spacer
            // Accommodation Section
            
          ],
        ),
      ),
    );
  }

  // Widget to build a card for attraction or accommodation
  Widget buildCard(Attraction data) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    data.imagePath,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.heart,
                        color: Color(0xFFFF5C23),
                      ),
                      onPressed: () {
                        // Handle like action
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.type,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF5C23),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          data.location,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

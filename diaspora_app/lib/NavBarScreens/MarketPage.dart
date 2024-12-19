import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'MarketDetails.dart';

class Attraction {
  final String imagePath;
  final String type;
  final String name;
  final String description; // New field for description

  Attraction({
    required this.imagePath,
    required this.type,
    required this.name,
    required this.description, // Initialize description in the constructor
  });
}


class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    final List<Attraction> attractions = [
      Attraction(
        imagePath: 'assets/images/baby.jpg',
        type: 'Document',
        name: 'How to acquire Birth Certificate',
        description: 'Learn the process to acquire a birth certificate in Uganda, '
                 'including the requirements and steps needed for application.',
      ),
      Attraction(
        imagePath: 'assets/images/passport.jpg',
        type: 'Document',
        name: 'How to Renew your Passport in Diaspora',
         description: 'Find out how to renew your passport while living abroad, '
                 'with detailed information on necessary documents and processing time.',
 
      ),
      Attraction(
        imagePath: 'assets/images/id.jpg',
        type: 'Document',
        name: 'How to get a National Id in Diaspora',
        description: 'The Uganda National Identification Card is a National document that is issued to all and only citizens of Uganda . The Card is a bio-metrically enhanced, machine readable card with digitally embedded information about the holder. One’s information can ONLY be accessed by law. The holder is required or encouraged to carry it as a means of confirming their identity where the need arises. The identification system uses bio-metric techniques such as the fingerprint and facial recognition to confirm the identity of the card holder'
      ),
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                'Our Publication',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: const Text(
                'We ensure that Ugandans Living abroad access the following services; passport Renewals, National ID registration, Visa Assistance for Former Ugandans, Legalisation of Documents, and Consular services',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Attraction Sites Section
            const SizedBox(height: 16),
            // Remove Expanded and let ListView take as much space as needed
            SizedBox(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: attractions.length,
                itemBuilder: (context, index) {
                  final attraction = attractions[index];
                  return buildCard(attraction,context);
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
Widget buildCard(Attraction data, BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Navigate to the AttractionDetailsPage and pass the data, including description
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AttractionDetailsPage(
            imagePath: data.imagePath,
            type: data.type,
            name: data.name,
            description: data.description, // Pass description
          ),
        ),
      );
    },
    child: Padding(
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
                  const SizedBox(height: 8),
                  const Divider(),
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

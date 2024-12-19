import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Define a data model for attractions and accommodations (optional)
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

class AllTab extends StatelessWidget {
  const AllTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample dynamic data for attractions
   final List<Attraction> attractions = [
      Attraction(
        imagePath: 'assets/images/rwenzori.webp',
        type: 'National Park',
        name: 'Rwenzori Mountains National park',
        description: 'Perched along the Uganda-Congo border in western Uganda, the Rwenzori Mountains National Park is a place of ancient beauty, rare wildlife, and challenging trekking trails. ',
        location: 'Kasese District',
      ),
      Attraction(
        imagePath: 'assets/images/kidepo.webp',
        type: 'National Park',
        name: 'Kidepo Valley National Park',
        description: 'Nestled between Uganda’s borders with South Sudan to the northwest and Kenya just 5 kilometers to the east, Kidepo Valley National Park spans rugged, semi-arid valleys. ',
        location: 'Kidepo',
      ),
      Attraction(
        imagePath: 'assets/images/bwindi.webp',
        type: 'National Park',
        name: 'Bwindi Impenetrable National park',
        description: 'Bwindi Impenetrable National Park lies in southwestern Uganda on the edge of the Rift Valley. Its mist-covered hillsides are blanketed by one of Uganda’s oldest and most biologically diverse rain forests, which dates back over 25,000 years and contains almost 400 species of plants..',
        location: 'Kasese District',
      ),
    ];

    // Sample dynamic data for accommodations
    final List<Attraction> accommodations = [
      Attraction(
        imagePath: 'assets/images/chimp.webp',
        type: 'HOTELS',
        name: 'Chimpundu Lodge',
        description: 'Chimpundu Lodge offers Luxury cottage accommodation and an array of authentic Kibale Forest and Kibale National Park experiences in a lush indigenous setting.',
        location: 'Kibale',
      ),
      Attraction(
        imagePath: 'assets/images/adere.webp',
        type: 'HOTELS',
        name: 'Adere Safari Lodge',
        description: 'Adere Safari Lodge gorgeous safari lodge perched on the edge of Kidepo Valley National Park in a unique natural setting sitting on jagged and semi-arid rocks of Kidepo, that date back to over a millennia.',
        location: 'Kidepo',
      ),
      Attraction(
        imagePath: 'assets/images/sanc.webp',
        type: 'HOTELS',
        name: 'Sanctuary Gorilla Forest Camp',
        description: 'Deep in the heart of Ugandas breathtaking Bwindi Impenetrable Forest lies Sanctuary Gorilla Forest Camp, an astonishing lodge where a once-in-a-lifetime opportunity to experience the majesty of one of Africas most remarkable creatures awaits.',
        location: 'Rubirizi District',
      ),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find Your Destination',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Attraction Sites Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Attraction Sites',
                  style: TextStyle(
                    fontSize: 16,
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
                      fontSize: 14,
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
                itemCount: attractions.length,
                itemBuilder: (context, index) {
                  final attraction = attractions[index];
                  return buildCard(attraction);
                },
              ),
            ),
            const SizedBox(height: 12), // Spacer
            // Accommodation Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Accommodation',
                  style: TextStyle(
                    fontSize: 16,
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
                      fontSize: 14,
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
                itemCount: accommodations.length,
                itemBuilder: (context, index) {
                  final accommodation = accommodations[index];
                  return buildCard(accommodation);
                },
              ),
            ),
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

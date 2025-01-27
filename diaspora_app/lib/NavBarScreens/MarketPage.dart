import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'MarketDetails.dart';

class Attraction {
  final String imagePath;
  final String type;
  final String name;
  final String description;

  Attraction({
    required this.imagePath,
    required this.type,
    required this.name,
    required this.description,
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
        description: 'The Uganda National Identification Card is a National document that is issued to all and only citizens of Uganda. The Card is a bio-metrically enhanced, machine-readable card with digitally embedded information about the holder. One’s information can ONLY be accessed by law.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Publications'),
        centerTitle: true,
        backgroundColor: Color(0xFFFF5C23),
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'We ensure that Ugandans Living abroad access the following services:',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Passport Renewals, National ID registration, Visa Assistance for Former Ugandans, '
              'Legalisation of Documents, and Consular services.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
            ),
            const SizedBox(height: 24),

            // Attraction Sites Section
            SizedBox(
              height: 420,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: attractions.length,
                itemBuilder: (context, index) {
                  final attraction = attractions[index];
                  return buildCard(attraction, context);
                },
              ),
            ),
            SizedBox(height: 8),
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
              description: data.description,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      data.imagePath,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.6),
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
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.type,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Color(0xFFFF5C23),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data.name,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      const Divider(thickness: 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

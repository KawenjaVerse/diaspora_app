import 'package:flutter/material.dart';

class AboutUgandaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'About Uganda',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          backgroundColor: const Color(0xFFFF5C23),
          foregroundColor: Colors.white,
          bottom: const TabBar(
            isScrollable: true, // Ensures labels are fully visible when tapped
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'The Pearl of Africa'),
              Tab(text: 'Location'),
              Tab(text: 'National Symbols'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // The Pearl of Africa Tab
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Center(
                    child: Text(
                      'The Pearl of Africa',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Uganda, known as the Pearl of Africa, is a stunningly diverse country in East Africa, famous for its rich landscapes, abundant wildlife, and warm hospitality. Its natural beauty includes the majestic Rwenzori Mountains, Lake Victoria, the source of the River Nile, and abundant flora and fauna. Uganda is a biodiversity hotspot, home to mountain gorillas, Africa’s Big Seven, and over 1,000 bird species. Culturally, Uganda boasts over 56 ethnic groups, each with unique traditions and languages. With its unspoiled wilderness, vibrant cities, and deep cultural heritage, Uganda offers a captivating experience for every traveler.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            // Location Tab (Displays Uganda map)
            SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset('assets/images/uganda.jpg', fit: BoxFit.contain),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '''Geography
              
              Uganda is situated in East Africa, spanning from 1° South to 4° North latitude, and between 30° and 35° East longitude. The country boasts a varied landscape, featuring volcanic hills, mountains, and numerous lakes. Positioned at an average altitude of 900 meters above sea level, Uganda’s eastern and western borders are marked by mountainous regions.
              
              Uganda is bordered to the east by Kenya, to the north by South Sudan, to the west by the Democratic Republic of the Congo, to the south-west by Rwanda, and to the south by Tanzania.
              
               ''',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            // National Symbols Tab (Displays Coat of Arms and National Flag)
            SingleChildScrollView(
              child: Column(
                children: [
                  Text('Coat of Arms', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/images/coat.png', fit: BoxFit.contain,width: 100,height: 100),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('''
                  The shield and spears represent the willingness of the Ugandan people to defend their country.
                  There are three images on the shield: those on top represent the waves of Lake Victoria;
                  the sun in the centre represents the many days of brilliant sunshine Uganda enjoys; and the traditional drum at the bottom is symbolic of dancing, and the summoning of people to meetings and ceremony.
                  
                  The shield is flanked on the right by a Crested Crane, a subspecies of the Grey-crowned Crane and the national bird of Uganda. On the left is the Ugandan Kob, a species of Kob that here represents abundant wildlife.
                  
                  The shield stands on a green mound, representing fertile land, and directly above a representation of the River Nile. Two main cash crops, coffee and cotton, flank the river. At the bottom is the national motto: “For God and My Country”.
                  '''),
                  ),
                  const SizedBox(height: 5),
                  Text('National Flag', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/images/flag.png', fit: BoxFit.contain,width: 100,height: 100),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('''
                  The Uganda Flag consists of six equal horizontal bands of black (top), yellow, red, black, yellow, and red (bottom); a white disc is superimposed at the centre and depicts the national symbol, a grey crowned crane, facing the hoist side.
                  The three colours are representative of African peoples (black), Africa’s sunshine (yellow), and African brotherhood (red being the colour of blood, through which all Africans are connected).
                  '''),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

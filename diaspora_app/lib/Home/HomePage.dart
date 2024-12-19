import 'dart:async';

import 'package:diaspora_app/NavBarScreens/SupportPage.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../NavBarScreens/MarketPage.dart';
import '../NavBarScreens/MorePage.dart';
import '../NavBarScreens/ToDoPage.dart';
import 'AboutPage.dart';
import 'ContactPage.dart';
import 'ForumPage.dart';
import 'GalleryPage.dart';
import 'HeadMessage.dart';

import 'ServicesPage.dart';



// Import the new page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;
  late Timer _timer;
  int _currentIndex = 0; // Track current bottom navigation item

  // Head of Organization Data
  
  final List<Widget> _pages = [
      HomeContent(), // Home
    const ToDoPage(), // To Do
    const SupportPage(), // Map
    const MarketPage(), // Market
    const ProfilePage(), // More
  ];

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel(); // Cancel the timer to prevent errors when disposing
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.page != null) {
        _currentPage = (_pageController.page!.round() + 1) % 4;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                'assets/images/logo.jpg',
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              'DIASPORA UNIT UGANDA',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
              icon: const Icon(Icons.person_outline),
              onPressed: () {
                // TODO: Implement Profile Functionality
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      unselectedLabelStyle: const TextStyle(color: Colors.yellow),
      showUnselectedLabels: true,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.yellow,
      unselectedItemColor: Colors.white,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home_filled),
            label: 'Home'),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.calendar_month),
            label: 'To Do'),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.support),
            label: 'Support'),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.shopping_cart),
            label: 'Market'),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.more_horiz),
            label: 'More'),
      ],
    );
  }
}


class HomeContent extends StatefulWidget {
    const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
   final _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;
  late Timer _timer;

    // Head of Organization Data
     final String _headName = "Mohammed Bagonza";
  final String _headTitle = "HEAD OF DIASPORA UNIT STATE HOUSE";
    final String _headImage = 'assets/images/bagonza.jpg';
    final String _welcomeMessage = '''
Dear Ugandans in the Diaspora,
I am pleased to welcome you to the Diaspora Unit. As the head of the  Unit, I am committed to supporting your engagement with the government  and empowering  you to contribute more effectively to the development of Uganda.
    ''';

    @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel(); // Cancel the timer to prevent errors when disposing
    super.dispose();
  }

    void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.page != null) {
        _currentPage = (_pageController.page!.round() + 1) % 4;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }
  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           _buildHeadCard(),
          Padding(
            padding: const EdgeInsets.only(left: 12.0,top: 12,bottom: 12),
            child: Text('News',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xFFFF5C23)
),),
          ),
          SizedBox(
            height: 200,
            
            child: PageView.builder(
              controller: _pageController,
              itemCount: 4,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return _buildSliderItem(context, index);
              },
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                effect: const ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Colors.black,
                  dotColor: Colors.grey,
                  spacing: 8,
                  expansionFactor: 3,
                ),
                onDotClicked: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.8,
              children: [
                _buildGridItem('Services', Icons.miscellaneous_services),
                _buildGridItem('Forum', Icons.forum),
                _buildGridItem('Contact Us', Icons.contact_phone),
                _buildGridItem('About Us', Icons.info_outline),
                _buildGridItem('Events', Icons.event_sharp),
                _buildGridItem('Gallery', Icons.picture_in_picture),
              ],
            ),
          ),
          SizedBox(height: 8,),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: const Text(
                "What We Do",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF5C23)
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildContainerItem(context, index);
              },
            ),
          ),
          SizedBox(height: 16,),
         Center(
        child: GestureDetector(
          onTap: () {
            showDialog(
              barrierDismissible: false ,
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.transparent, // Transparent background
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Colored container with rounded corners
                      Positioned(
                        top: 100,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 50), // Space for the logo
                              const Text(
                                'Support',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Could we have your contact info?',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Name TextField
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Email TextField
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Chat Button
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF5C23),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Message Sent'),
                                      backgroundColor: Color(0xFFFF5C23),
                                    ),
                                  );
                                },
                                child: const Text('Chat',style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Round container with app logo
                      Positioned(
                        top: 50,
                        child: CircleAvatar(
                          
                          radius: 60,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              const AssetImage('assets/images/logo.jpg'),
                              
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Container(
            width: 90,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFFF5C23),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: const [
                Icon(Icons.chat, color: Colors.white),
                SizedBox(width: 6),
                Text(
                  'Chat',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
           SizedBox(height: 16,),
        ],
      ),
    );
  }


  Widget _buildHeadCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(color: Color(0xFFFF5C23), width: 2.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.yellow, width: 2)),
              child: CircleAvatar(
                backgroundImage: AssetImage(_headImage),
                radius: 40,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _headName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _headTitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 8),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HeadMessagePage(
                                        headName: _headName,
                                        headTitle: _headTitle,
                                        headImage: _headImage,
                                        welcomeMessage: _welcomeMessage,
                                      )));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF5C23),
                        ),
                        child: const Text(
                          'Message from Head',
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderItem(BuildContext context, int index) {
    final List<String> images = [
      'assets/images/img6.jpg',
      'assets/images/img7.jpg',
      'assets/images/img3.jpg',
      'assets/images/img4.jpg',
    ];

    final List<String> texts = [
      'Uganda Embassy in Paris awards Ugandan diaspora Community in France upon taking part in the 12th edition of the Annual Rotary Cancer Run, August 2023',
      'Mr. Mohammed Bagonza, Senior Presidential Advisor for Diaspora Affairs and Head of the Diaspora Unit',
      'Senior Presidential Advisor on Diaspora Affairs and Head of the State House Diaspora Unit Mohammed Bagonza, after a fruitful discussion with Ambassador Santa Laker, Deputy Chief of Mission at the Ugandan Embassy to the US on how to serve the diaspora community',
      'Uganda North America Association UNAA elects its leadership. From right,Lambert Etibot President and CEO, Charles Bukenya Muvawala, Vice President and Shantel Mbabazi, Executive Secretary.',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Text(
                  texts[index],
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerItem(BuildContext context, int index) {
    final List<String> bgImages = [
      'assets/images/girl.webp',
      'assets/images/human.jpg',
      'assets/images/image3.jpg',
      'assets/images/image4.jpg',
      'assets/images/kampala.webp',
    ];

    final List<String> titles = [
      "Migrant Support",
      "Human Trafficking Prevention",
      "Legal Migration Assistance",
      "Diaspora Engagement",
      "Investment Opportunities"
    ];

    final List<String> descriptions = [
      "Offering comprehensive services to support migrants, from pre-departure to integration upon return.",
      "Collaborating with various agencies to combat human trafficking and support victims.",
      "Providing guidance and legal support for those seeking to migrate legally.",
      "Conducting events, tours, and conventions to engage with diaspora communities worldwide.",
      "Facilitating travel and investment opportunities for diaspora members, with dedicated support and incentives."
    ];

    return Container(
      width: 180,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            bgImages[index],
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: _getGradient(index),
              color: _getColor(index),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titles[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: index != 3 ? Colors.black : Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  descriptions[index],
                  style: TextStyle(
                    fontSize: 14,
                    color: index != 3 ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  LinearGradient? _getGradient(int index) {
    switch (index) {
      case 0:
      case 2:
      case 4:
        return LinearGradient(
          colors: [Colors.red.withOpacity(0.5), Colors.yellow.withOpacity(0.5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      default:
        return null;
    }
  }

  Color? _getColor(int index) {
    switch (index) {
      case 1:
        return Colors.white.withOpacity(0.7);
      case 3:
        return Colors.black.withOpacity(0.7);
      default:
        return null;
    }
  }

  // Grid item
  Widget _buildGridItem(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (title == 'Services') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ServicesPage()));
        } else if (title == 'Contact Us') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ContactPage()));
        } else if (title == 'Forum') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ForumPage()));
        } else if (title == 'About Us') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AboutPage()));
        } else if (title == 'Gallery') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GalleryPage()));
        }
      },
      child: SizedBox(
        height: 80,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Color(0xFFFF5C23), // Red background
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ), // White icons
              const SizedBox(height: 5.0),
              Text(title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)), // White text
            ],
          ),
        ),
      ),
    );
  }
}
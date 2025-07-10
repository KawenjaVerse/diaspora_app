import 'dart:async';

import 'package:diaspora_app/Home/BouPage.dart';
import 'package:diaspora_app/Home/ContactUs/ContactUsPage.dart';
import 'package:diaspora_app/Home/Forum/ForumPage.dart';
import 'package:diaspora_app/Home/NssfPage.dart';
import 'package:diaspora_app/Home/PlanPage.dart';
import 'package:diaspora_app/Home/Registration/DiasporaRegistrationPage.dart';
import 'package:diaspora_app/Home/UrsbPage.dart';
import 'package:diaspora_app/NavBarScreens/EmbassyPage.dart';
import 'package:diaspora_app/utils/Helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../NavBarScreens/DualPage.dart';
import '../NavBarScreens/LandsPage.dart';
import '../NavBarScreens/MarketDetails.dart';
import '../NavBarScreens/MarketPage.dart';
import '../NavBarScreens/MorePage.dart';
import '../NavBarScreens/NationalIDPage.dart';
import '../NavBarScreens/PassportPage.dart';
import '../NavBarScreens/ToDoPage.dart';
import '../NavBarScreens/ToDoScreens/attraction.dart';
import '../NavBarScreens/VisaPage.dart';
import 'AboutPage.dart';
import 'ContactPage.dart';
import 'EventsPage.dart';
import 'GalleryPage.dart';
import 'HeadMessage.dart';

import 'InvestPage.dart';
import 'NewsPage.dart';
import 'Notification.dart';
import 'ServiceDetails.dart';
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
    const EmbassyPage(), // Map
    const MarketPage(), // Market
    ProfilePage(), // More
  ];
  final String _headName = "Mohammed Bagonza";
  final String _headTitle = "HEAD OF DIASPORA UNIT STATE HOUSE";
  final String _headImage = 'assets/images/head.jpg';
  final String _welcomeMessage = '''
Dear Ugandans in the Diaspora,

I am pleased to welcome you to the Diaspora Unit. As the head of the  Unit, I am committed to supporting your engagement with the government  and empowering  you to contribute more effectively to the development of Uganda.

Our mission is to create an enabling environment that promotes Diaspora engagement, provides access to information and services, and strengthens the relationship between the government and Ugandans living abroad. We recognize the valuable contributions that you, as Ugandans living abroad, make to the country’s economy, and we are committed to addressing the challenges you face in accessing government services and information.

Through this Unit, we aim to provide you with information on government policies, programs, and investment opportunities and provide a platform for you to interact with government representatives, share your concerns and feedback, and participate in national affairs.

Our mandate is to facilitate your engagement with the government on issues of mutual interest, coordinate the flow of communication between you and relevant government agencies, advocate for your interests, and provide you with support and assistance.

We are committed to establishing an effective and responsive Unit that is accountable to you and the government. We believe that by working together, we can build a stronger and more prosperous Uganda.

I encourage you to explore our website, engage with us, and provide us with feedback on how we can improve our services to you. I look forward to working together with you to achieve our shared vision of a better Uganda for all.

Sincerely,

Mohammed Bagonza
Head of Diaspora Unit   
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.transparent),
        title: Row(
          children: [
            Image.asset(
              'assets/images/coat.png',
              height: 30,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'DIASPORA UGANDA',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
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
                child: Icon(
                  Icons.chat,
                  color: Color(0xFFFF5C23),
                )),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationPage()));
                },
                child: Icon(
                  Icons.notifications,
                  color: Color(0xFFFF5C23),
                ))
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
          icon: ImageIcon(
            AssetImage('assets/images/homed.png'), // Path to home icon
            size: 24, // Adjust size as needed
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: ImageIcon(
            AssetImage('assets/images/tourism.png'), // Path to tourism icon
            size: 24,
          ),
          label: 'Tourism',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: ImageIcon(
            AssetImage('assets/images/embassy.png'), // Path to embassies icon
            size: 24,
          ),
          label: 'Embassies',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: ImageIcon(
            AssetImage('assets/images/support.png'), // Path to support icon
            size: 24,
          ),
          label: 'Support',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: ImageIcon(
            AssetImage('assets/images/more.png'), // Path to more icon
            size: 24,
          ),
          label: 'More',
        ),
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


  var _loadingNews = false;
  var news = [];
  void _getNews() {
    print("Fetching news >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    requestAPIDirect("news/get", {"":""}, (loading){
      setState(() {
        _loadingNews = loading;
      });
    }, (response){
      setState(() {
        news = response;
      });
    }, (e){ }, method: "GET");
  }

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
    _getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 250,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: _buildServiceCard(
                    imagePath: 'assets/images/uia.jpg',
                    title: 'Investments',
                    description: 'Investments in Uganda',
                    onReadMore: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InvestPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: _buildServiceCard(
                    imagePath: 'assets/images/immg.jpg',
                    title: 'Visas',
                    description: 'New Application',
                    onReadMore: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VisaPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: _buildServiceCard(
                    imagePath: 'assets/images/pssprt.jpg',
                    title: 'Passports',
                    description: 'Apply, Renew',
                    onReadMore: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PassportPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: _buildServiceCard(
                    imagePath: 'assets/images/nat.jpg',
                    title: 'National ID',
                    description: 'National ID Appointment',
                    onReadMore: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NationalIDPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: _buildServiceCard(
                    imagePath: 'assets/images/coat.png',
                    title: 'Ministry of Lands',
                    description: 'Apply, Renew',
                    onReadMore: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LandsPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: _buildServiceCard(
                    imagePath: 'assets/images/immg.jpg',
                    title: 'Dual Citizenship',
                    description: 'Apply, Renew',
                    onReadMore: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DualPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: _buildServiceCard(
                    imagePath: 'assets/images/ursblogo.png',
                    title: 'URSB',
                    description: 'Uganda Registration Services Bureau',
                    onReadMore: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UrsbPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: _buildServiceCard(
                    imagePath: 'assets/images/BOU.png',
                    title: 'Bank of Uganda',
                    description: 'Services',
                    onReadMore: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BouPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: _buildServiceCard(
                    imagePath: 'assets/images/nssf.png',
                    title: 'NSSF',
                    description: 'National Social Security Fund',
                    onReadMore: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NssfPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: _buildServiceCard(
                    imagePath: 'assets/images/national.png',
                    title: 'National Planning Authority',
                    description: 'Contact Us',
                    onReadMore: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlanPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 15, left: 15),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.8,
            children: [
              _buildGridItem('Services', 'assets/images/setting.png'),
              _buildGridItem('Forum', 'assets/images/forum.png'),
              _buildGridItem('Contact Us', 'assets/images/contact.png'),
              _buildGridItem('Events', 'assets/images/events.png'),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 12.0,top: 16),
        //   child: const Text(
        //     "Services",
        //     textAlign: TextAlign.start,
        //     style: TextStyle(
        //         fontSize: 16,
        //         fontWeight: FontWeight.bold,
        //         color: Color(0xFFFF5C23)
        //     ),
        //   ),
        // ),

        const SizedBox(
          height: 3,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 12, bottom: 12),
          child: Text(
            'Latest News',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF5C23)),
          ),
        ),
        SizedBox(
          height: 200,
          child:
          _loadingNews ?
          Center(child: CircularProgressIndicator()) :
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: news.length,
            itemBuilder: (context, index) {
              return _buildSliderItem(context, index);
            },
          ),
        )
      ])),
      floatingActionButton: GestureDetector(
        onTap: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage() ) );
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DiasporaRegistrationPage()));
        },
        child: Card(
            color: Colors.orange,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Icon(Icons.support_agent),
                  //SizedBox(width: 8,),
                  //Text("Contact Us", style: TextStyle(fontWeight: FontWeight.bold),),
                  Icon(Icons.app_registration),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Diaspora Registration",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildServiceCard({
    required String imagePath,
    required String title,
    required String description,
    required VoidCallback onReadMore,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Image
            Image.asset(
              imagePath,
              width: 70,
              height: 70,
              fit: BoxFit.contain,
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
                      fontSize: 16,
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
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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

  Widget _buildSliderItem(BuildContext context, int index) {
    var newsItem = news[index];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailPage(
              image: newsItem['picture'],
              title: newsItem['title']!,
              description: newsItem['description']!,
              obj : newsItem,
            ),
          ),
        );
      },
      child: Container(
        width: 300,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                newsItem['picture'],
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
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    newsItem['title']!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              //Ministry->name
              if (newsItem['ministry'] != null)
              Positioned(
                top: 10,
                left: 10,
                right: 10,
                child: Container(
                  margin: EdgeInsets.only(left: 50),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(child: Text(newsItem['ministry']["name"], style: TextStyle(fontSize: 11), textAlign: TextAlign.right,)),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
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
            // Check if the URL can be launched
            await launchUrl(_url); // Open the URL
          } else {
            throw 'Could not launch $url'; // Error if URL can't be opened
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          padding: const EdgeInsets.all(16),
          width: 200, // Dynamic width for consistent layout
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IntrinsicWidth(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 6),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFFF4300),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(
                imagePath,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ));
  }

  Widget buildMinistryCardWithoutUrl(
      {required String title, required String imagePath}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.all(16),
      width: 200, // Dynamic width for consistent layout
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IntrinsicWidth(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 6),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFFF4300),
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Image.asset(
            imagePath,
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
        ],
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
      child: Container(
        width: 200,
        height: 200,
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
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
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

  // Grid item
  Widget _buildGridItem(String title, String imagePath) {
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
        } else if (title == 'Events') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => EventsPage()));
        }
      },
      child: SizedBox(
        height: 80,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.black12, // Red background
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  imagePath,
                  height: 25,
                  width: 25,
                  fit: BoxFit.cover,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ), // White text
              ),
            ],
          ),
        ),
      ),
    );
  }
}

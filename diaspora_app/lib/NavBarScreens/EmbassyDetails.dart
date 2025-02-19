import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Home/ContactPage.dart';
import '../Home/ContactUs/ContactUsPage.dart';
import 'AboutEmbassy.dart';
import 'AboutUgandaPage.dart';
import 'AmbassadorPage.dart';
import 'ContactUs.dart';
import 'DiasporaServicePage.dart';
import 'NewsPreview.dart';
import 'ToDoPage.dart';


class EmbassyDetailPage extends StatefulWidget {
  final Map<String, dynamic> embassy;

  const EmbassyDetailPage({super.key, required this.embassy});

  @override
  State<EmbassyDetailPage> createState() => _EmbassyDetailPageState();
}

class _EmbassyDetailPageState extends State<EmbassyDetailPage> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;
  List<dynamic> _news = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    final url = Uri.parse(
      'http://188.166.8.72:9019/api/news/get?embassy_id=${widget.embassy['id']}',
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          _news = json.decode(response.body);
        });
      }
    } catch (e) {
      print('Error fetching news: $e');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.embassy['name'] ?? "Embassy Details",
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
        backgroundColor: const Color(0xFFFF5C23),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: BottomCurvedClipper(),
                  child: Container(
                    height: 250,
                    child: Stack(
                      children: [
                        // Background Image
                        Image.network(
                          widget.embassy['picture'] ?? '',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(color: Colors.grey),
                        ),
                        // Black Overlay
                        Container(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        // Centered Name Text
                        Center(
                          child: Text(
                           widget.embassy['name'] ?? "Embassy Name",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 4,
                                  color: Colors.black45,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        
            Center(
              child: GestureDetector(
                onTap: () {
                  // Placeholder action for Ambassador message
                  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AmbassadorPage(
             
              ambassadorPicture: widget.embassy['ambassador_picture'] ?? '',
              ambassadorMessage: widget.embassy['ambassador_message'] ?? 'No message available.', 
              ambassadorName: widget.embassy['ambassador_name'] ?? 'Unknown Ambassador',
            ),
          ),
        );
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF5C23),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Message from the Ambassador",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            
             SizedBox(
              height: 8,
            ),
            // News Carousel
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "News Updates",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            if (_news.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselSlider.builder(
                  carouselController: _carouselController,
                  itemCount: _news.length,
                  itemBuilder: (context, index, realIndex) {
                    final newsItem = _news[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailedPage(
                              image: newsItem['picture'] ?? '',
                              title: newsItem['title'] ?? 'No Title',
                              description: newsItem['description'] ?? 'No Description',
                             
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          // News Image
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(newsItem['picture'] ?? ''),
                                fit: BoxFit.cover,
                                onError: (exception, stackTrace) =>
                                    const AssetImage('assets/images/placeholder.png'),
                              ),
                            ),
                          ),
                          // Dark Overlay
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          // Title
                          Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: Text(
                              newsItem['title'] ?? 'No Title',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    blurRadius: 4,
                                    color: Colors.black26,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Date
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                      DateFormat.yMMMd().format(DateTime.parse(newsItem['created_at'] ?? '')),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 0.9,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              // Smooth Indicator
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedSmoothIndicator(
                    activeIndex: _currentIndex,
                    count: _news.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: const Color(0xFFFF5C23),
                      dotColor: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
            ] else
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            // Grid Items
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.8,
                shrinkWrap: true, // Let GridView take only as much space as it needs
                
                children: [
                  _buildGridItem(
                    imagePath: 'assets/images/icons8-embassy-96.png',
                    label: "The Embassy",
                    context: context,
                    navigateTo: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutEmbassyPage(
                            id: widget.embassy['embassy_id']?? "",
                            details: widget.embassy['about'] ?? "",
                            
                          ),
                        ),
                      );
                    },
                  ),
                  _buildGridItem(
                    imagePath: 'assets/images/icons8-tourism-96.png',
                    label: "Tourism & Investment",
                    context: context,
                    navigateTo: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ToDoPage()),
                    ),
                  ),
                  _buildGridItem(
                    imagePath: 'assets/images/icons8-diaspora-96.png',
                    label: "Diaspora Services",
                    context: context,
                    navigateTo: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DiasporaServicePage()),
                    ),
                  ),
                  _buildGridItem(
                    imagePath: 'assets/images/icons8-phone-bubble-96.png',
                    label: "Contact",
                    context: context,
                    navigateTo: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactUs(
                            address: widget.embassy['address'] ?? '',
                            phone: widget.embassy['phone'] ?? '',
                            email: widget.embassy['email'] ?? '',
                            website: widget.embassy['website'] ?? '',
                           
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
         
          Center(
              child: GestureDetector(
                onTap: () {
                  // Placeholder action for Ambassador message
                  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AboutUgandaPage()
          ),
        );
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF5C23),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "About Uganda",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
            
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem({
    required String imagePath,
    required String label,
    required BuildContext context,
    required VoidCallback navigateTo,
  }) {
    return GestureDetector(
      onTap: navigateTo,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade50,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class BottomCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 30,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
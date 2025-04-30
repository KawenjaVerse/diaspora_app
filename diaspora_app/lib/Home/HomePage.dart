import 'dart:async';

import 'package:diaspora_app/Home/BouPage.dart';
import 'package:diaspora_app/Home/ContactUs/ContactUsPage.dart';
import 'package:diaspora_app/Home/Forum/ForumPage.dart';
import 'package:diaspora_app/Home/NssfPage.dart';
import 'package:diaspora_app/Home/PlanPage.dart';
import 'package:diaspora_app/Home/Registration/DiasporaRegistrationPage.dart';
import 'package:diaspora_app/Home/UrsbPage.dart';
import 'package:diaspora_app/NavBarScreens/EmbassyPage.dart';
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
    final List<String> images = [
      'assets/images/news1.jpg',
      'assets/images/news2.jpg',
      'assets/images/news3.jpg',
      'assets/images/news4.jpg',
    ];

    final List<Map<String, String>> newsItems = [
      {
        'title':
            'Museveni ready to support skilled Ugandan returnees from Turkey',
        'description': '''
          The Senior Presidential Advisor to the President and Head of Diaspora Unit of State House, Mohammed Bagonza, has told returnees from Turkey President Yoweri Museveni is ready to utilize the skills they learnt abroad for the country’s socio-economic transformation.

Bagonza was on Monday meeting leaders of the returnees from Turkey at his office in Kampala when he told them the president had set up various hubs and innovation centres, where their skills can be maximally utilized.

“President Museveni has been speaking a lot about small-scale industries. You are the people he wants who can use the skills you learnt abroad to set up small factories that will produce products to substitute imports,” Bagonza said.

“If we can all support our President in his message of socio-economic transformation, this country will be more developed in the next 10 years or less,” he added.

According to Bagonza, the President is ready to listen to and support anyone who is willing to focus on skills development and setting up of manufacturing plants however small.

“You see most of these Chinese manufacturers come here with very few resources and machines. However, they start manufacturing things in small quantities which they sell and get enough capital to set up big industries. We need to learn from them,” Bagonza said.

The returnees who were led by their chairman, Yasiin Kayondo, said they had acquired various skills, including garments making, shoe making, jewelry, fish farming, and poultry among others.

“We worked in Turkish factories for a long time and we have these skills which we are willing to share with other Ugandans once we are given the opportunity,” Kayondo said.

He explained that the Turkish have the same raw materials like Uganda from which they make garments and shoes that are sold expensively on the international market.

“Uganda is rich with hides and skins, as well as cotton from which we can get material to make world-class shoes and clothes such as suits,” Kayondo said.

However, he said that although they have the skills, they lack the standard machines like those used in Turkish garment factories to make expensive products.

“If the President can get us some of those machines, we can use them together with other Ugandans to put our skills to use,” Kayondo said, adding that for now they were scattered across the country (about 300 of them).

Bagonza asked them to organize themselves according to the skills they have for proper management and deployment by the Presidential hubs managers.

Uganda currently boasts of more than 21 Presidential Hubs set up in various sub-regions of the country under the Presidential Initiative on Skilling.

So far thousands of disadvantaged youth have graduated from the hubs with different skills that have enabled them to be self-employed.
          ''',
      },
      {
        'title':
            'State House officials, US professor discuss job opportunities in America',
        'description': '''
          Officials from State House have held discussions with a top American university over the possibility of recruiting Ugandans to work as nurses in the United States, where there is a shortage of about 100,000 nurses.

The team from State House which was led by the Senior Presidential Advisor and head of the Diaspora Unit, Mohammed Bagonza, met with Kennesaw State University Dean, Dr Monica Swahn, and other leaders of a local organisation, Uganda Youth Development Link (UYDL) in Kampala recently.

Dr Swahn is partnering with UYDL to provide services such as rehabilitation of victims of sexual exploitation, alcohol and drug abuse, as well as equipping girls and women with skills to become job creators.

During the meeting, Dr Swahn, a trained epidemiologist, said she had studied diseases and populations in the US, and had discovered a “nursing crisis” in the US.

“It is a crisis. We need nurses. So I don’t have an idea exactly yet, but I’m wondering if there is a way we could partner by strengthening nursing training here potentially so that there will be benefit to Ugandans and the nurses here,” she said.

“But also, see if there would be a path to invite some of those nurses to go to the US. That could be a huge capacity and training programme here,” she added.

The official who is currently working as lead social researcher at UYDEL said she had had preliminary conversation with authorities at Makerere University about the same topic where both countries could have “a win-win against strengthening capacity…even updating some of the technology that might not be available here”.

“We have at least 100,000 shortages right now, about 25,000 even just in the State of Georgia and probably a million nurses short by the end of the decade,” the Professor of Health Promotion and Physical Education said.

Mr Bagonza hailed Dr Swahn and UYDEL for engaging more than q300 young women in vocational skills training.

“You are complementing government efforts and supporting our National Development Plans. We request that you put in more energy so that we are able to achieve much more,” he said.

We still have a lot of work to do. We have skilled so many Ugandans so far but how do we proceed? How do we support them in terms of starting up small scale industries? The President is always ready to support such an initiative which is helping the people,” Bagonza added.

According to the Senior Presidential Advisor, currently Uganda does not have any agreements with the US to export labour there.

“This will be discussed with the President because we already have more than enough trained nurses who can take up that opportunity,” Bagonza who was accompanied by his Deputy Henry Wabyona and legal advisor Andrew Kibumba said.
          ''',
      },
      {
        'title': 'Vice President Alupo lauds Ugandans in southern Africa',
        'description': '''
          Johannesburg. The Vice President, Jessica Alupo, has received a formal invitation on behalf of President Yoweri Museveni to attend the highly anticipated Second Convention of Ugandans in Southern Africa (COUSA), which will be held in October 2024 in Pretoria, South Africa.

The formal invitation was presented by Uganda’s High Commissioner to South Africa Amb. Paul Amoru in the company of Deputy High Commissioner Amb. Kintu Nyago and Mr. Phillips Kakuru, a Board member of COUSA. 

The Confederation of Ugandans in southern Africa is an esteemed organisation with a mission to bring together Ugandans residing in the southern African region.

The organisation’s core objectives include promoting trade, investment, tourism, and enhancing remittances to Uganda, thereby boosting the nation’s economic development.

Vice President Alupo expressed appreciation to the Uganda High Commission in Pretoria for supporting COUSA’s initiatives and commended the unwavering commitment and resilience of

Ugandans in southern Africa who contribute significantly to Uganda’s growth and prosperity.

The COUSA executive is led by Mr. Moses Badru Ssentongo Kibombo as President while the Board is led by Dr. Daniel Echun as Chairman.

The Uganda High Commission also launched the Diaspora High Achievers Awards Committee led by Prof. Flavia Senkubuge, which will henceforth recognize Ugandans with outstanding contributions within the COUSA membership.

Vice President Alupo articulated her support by highlighting the vital role that the Ugandan diaspora plays in national development.

She emphasised that the government places immense value on the contributions of its diaspora community, recognizing them as crucial partners in the nation’s progress. 

The engagement with COUSA, according to Alupo, underscores the government’s determination to sustain and strengthen these ties, ensuring that the diaspora remains an integral part of Uganda’s socio-economic fabric.

During the Johannesburg meeting, Vice President Alupo further elaborated on the multifaceted benefits of events such as COUSA. 

She remarked that such fora are not merely networking opportunities but are strategic platforms for collaboration, knowledge exchange, and cultural representation. 

“They create a space for Ugandans abroad to share innovative ideas and best practices, fostering an environment conducive to mutual growth and development,” the Vice President said.

Highlighting the potential of the Ugandan diaspora, VP Alupo called for increased participation and investment from Ugandans living abroad. She pointed out that the government is focused on creating favourable policies and an enabling environment that encourages diaspora investments and contributions. 

This initiative, she remarked, “will significantly bolster national development efforts, bridging gaps and fostering inclusive progress”.

Alupo was in South Africa to represent President Yoweri Museveni at the inauguration ceremony of President Cyril Ramaphosa on Wednesday at the Union Buildings, highlighting continued support and strong bilateral relations between Uganda and South Africa.

Amb. Amoru said the series of discussions held with the Vice President revolved around various topics, including enhancing bilateral relations, exploring new avenues for trade and investment, and addressing challenges faced by the Ugandan diaspora in the Southern African region. 

“Her approach was both inclusive and solution-oriented, aiming to create a robust support system for Ugandans abroad,” Amb. Amoru explained.

It is anticipated that President Museveni’s personal presence or by delegation would further solidify the bonds between Uganda and its diaspora, facilitating deeper collaboration and understanding.

The Uganda High Commission is committed to its mission of fostering connections among Ugandans and building bridges with their homeland.

The official invitation to President Museveni and the strong endorsement from Vice President Alupo signify a promising future for diaspora engagement.

The government’s proactive stance reflects its recognition of the immense potential within the diaspora community and its commitment to harnessing this potential for national advancement.

COUSA 2024 is set to be a landmark event, spotlighting the unity, strength, and dynamism of Ugandans in southern Africa.

Below is the pictorial from the meeting between VP Alupo, Amb. Amoru and COUSA.
          ''',
      },
      {
        'title': 'Invest Back Home, President Museveni Urged Ugandans',
        'description': '''
         The President made the call while closing the second annual edition of the 2023 Canada National Resistance Movement (NRM) Chapter Symposium in a virtual meeting held at State Lodge- Nakasero on Sunday, 13th August 2023.

The two -day symposium which took place in Toronto, Canada, ran under the theme: “Dialogue, Unity and a Prosperous Diaspora”.

“It would be good if you also participate by bringing either foreign friends to invest with us or even you yourself, if you can collect your small money and add it up and put it into some of these enterprises. By combining savings, we can do more work,” the President appealed.

President Museveni, who also serves as the National chairman of the NRM, informed Ugandans living in Canada that currently, the government is focused on supporting and executing the knowledge-based economy, explaining that with investment sustained, the country will achieve more. 
          
         ''',
      },
    ];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailPage(
              image: images[index],
              title: newsItems[index]['title']!,
              description: newsItems[index]['description']!,
            ),
          ),
        );
      },
      child: Padding(
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
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    newsItems[index]['title']!,
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

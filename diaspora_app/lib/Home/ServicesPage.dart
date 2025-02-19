import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ServiceDetails.dart'; // For icons

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final List<Service> _services = [
    Service(
      name: 'Business Advisory',
      description:
'''
The Diaspora Unit recognizes that entrepreneurship and business are critical drivers of economic growth and development, and we are committed to providing support to Ugandans living abroad who are interested in starting or scaling their businesses in Uganda. Our Business Advisory service is designed to provide guidance and support to Ugandan entrepreneurs living abroad, from ideation stage to actualization.

Our Business Advisory service offers a range of services to support entrepreneurs, which includes market research, feasibility studies, legal and financial advice, partner matching, business planning, access to finance, and regulation compliance, among other services.

Through our Business Advisory service, we collaborate with relevant government agencies, embassies, and other private sector stakeholders to provide the necessary support and resources to Ugandan entrepreneurs living abroad. We believe that through this collaboration, we can create an enabling environment that promotes entrepreneurship and business growth, ultimately contributing to the development of both Uganda and the diaspora community.

Our Business Advisory service is available through our website, and our team of advisors will be readily available to respond to enquiries.''',
      icon: FontAwesomeIcons.briefcase,
    ),
    Service(
      name: 'Matching & Linking Diaspora',
      description:
'''
The Diaspora Unit recognizes that the Ugandan Diaspora community is a vast pool of talent, innovation, and creativity that can help drive the country’s development. Therefore, we have made it a priority to match and link the ideas and concepts of Ugandans living abroad to existing government initiatives and programs. This way, we can harness the full potential of the Ugandan Diaspora community to contribute to the country’s growth and development.

We offer a range of services to support this matching and linking process, which include:

1. Providing information on relevant government programs and initiatives.

2. Identifying opportunities for partnership and collaboration between the Diaspora community and government agencies.

3. Facilitating engagement sessions where the Diaspora community can pitch and present their ideas to the relevant government agencies.

4. Providing support and guidance to the Diaspora community in preparing proposals and engaging with government agencies.

Through our matching and linking service, we create a platform where the ideas, skills, and experiences of the Diaspora community are effectively integrated into the development initiatives of the government, ensuring that the contributions of the diaspora community are realized.''',
      icon: FontAwesomeIcons.link,
    ),
    Service(
      name: 'Trade & Investment Facilitation',
      description:
          '''
The Diaspora Unit recognizes that the Ugandan Diaspora community has an immense potential to contribute to the country’s economic growth and development through trade and investment. Therefore, we offer Trade and Investment Facilitation service that helps unlock the potential of the Diaspora community.

Our Trade and Investment Facilitation service is designed to provide support and guidance to the Diaspora community regarding investment opportunities, export promotion, market identification, and other relevant areas. Through our collaboration with relevant government agencies, trade associations, and other stakeholders, we provide the necessary support to make it easy for the Diaspora community to do business in Uganda.

We offer a range of services through our Trade and Investment Facilitation service, which includes:

1. Providing information on investment opportunities and export promotion programs.

2. Facilitating business linkages and matchmaking between the Diaspora community and local businesses.

3. Providing access to information on trade policies, laws, and regulations.

4. Facilitating access to finance and tax incentives.

5. Providing guidance and support on registration and compliance processes.

6. Facilitating market identification and entry strategies.

Through our Trade and Investment Facilitation service, we aim to create a platform that promotes the ease of doing business for the Diaspora community, contributing to the country’s economic growth and development.
 ''',
      icon: FontAwesomeIcons.coins,
    ),
    Service(
      name: 'Returning Migrants Advisory',
      description:
          '''
Returning to Uganda after living abroad can be a challenging experience for many Ugandan Diaspora community members. The Diaspora Unit understands these challenges and the difficulties that returnees face when readjusting to life in Uganda. Therefore, we offer Return Migrants Advisory and Support Service to help ease the transition for returnees.

Our Return Migrants Advisory and Support Service is designed to provide support and guidance to returning Ugandans, from pre-return to post-return. Our team of professionals works with returnees to prepare them for the cultural shock, connect them to relevant resources and services, and provide necessary information to make the return to Uganda as seamless as possible.

Through our Return Migrants Advisory and Support Service, we offer a range of services that includes:

1. Pre-return orientation provides information on the transition process, reintegration supports, and cultural differences.

2. Post-return support, which includes guidance on re-entry shock and emotional and social challenges.

3. Connect returnees with resources and services across the country, including but not limited to legal, housing, and healthcare services.

4. Information and guidance on setting up businesses, access to finance, and job placement opportunities.

5. Other support services, such as access to business opportunities and other additional services, are required during and after post-return.

Through our Return Migrants Advisory and Support Service, we aim to mitigate the challenges faced by returnee’s, provide support, and ensure a smooth transition back to Uganda.
 ''',
      icon: FontAwesomeIcons.userCheck,
    ),
   
    Service(
      name: 'Lobbying & Advocacy',
      description:
          ''' 
The Diaspora Unit recognizes the importance of increased participation of the Ugandan Diaspora community in shaping the political and economic landscape of the country. Therefore, we offer a Lobbying and Advocacy service that focuses on advocating for the inclusion of the Diaspora Community in national affairs.

Our Advocacy service is designed to create an enabling environment that promotes the participation of the Diaspora Community in both political and economic discourse in Uganda. We engage government institutions, policymakers, and relevant stakeholders to lobby for policies and programs that support Diaspora participation, including citizenship rights, voting rights, and access to information.

Through our Advocacy service, we aim to create a platform where the voices and perspectives of the Diaspora community are effectively integrated into national development initiatives. We believe that increasing the participation of the Diaspora in political and economic discourse will be beneficial for both the country and the Diaspora community.
          ''',
      icon: FontAwesomeIcons.bullhorn,
    ),
    Service(
      name: 'Diaspora Database',
      description:
          ''' 
The Diaspora Unit recognizes the importance of having accurate and reliable data about the Ugandan Diaspora community. Therefore, we offer the Creation of a Diaspora Database service that aims to collect and maintain comprehensive data about Ugandan Diaspora, which includes identification, personal information, location, skills set, and interests, among other relevant information.

Through our Diaspora Database service, we aim to create an online platform where the Diaspora community can access and share information about their community members, businesses, skills, and interests. This platform is designed to facilitate networking and collaboration among the Diaspora community and provide government agencies and stakeholders with an invaluable resource in the areas of trade, investment, and development.

Our Diaspora Database service collects data through various methods, which includes:

1. Survey questionnaires that are distributed to members of the Diaspora community.

2. Online registration forms that are available on our website and social media platforms.

3. Engaging with Diaspora community members during events.

Through our Diaspora Database service, we specifically aim to:

1. Facilitate Diaspora engagement and participation in Ugandan affairs.

2. Provide information for policy development and implementation.

3. Foster economic development and investment between Uganda and the Diaspora community.

4. Address issues of concern in the diaspora community.


          ''',
      icon: FontAwesomeIcons.database,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFFF5C23)),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            const Text(
              'Services',
              style: TextStyle(
                  color: Color(0xFFFF5C23), fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Image.asset(
              'assets/images/logo.jpg',
              height: 30,
              width: 90,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.9, // Adjusted for rectangular cards
          ),
          itemCount: _services.length,
          itemBuilder: (context, index) {
            return _buildServiceCard(_services[index]);
          },
        ),
      ),
    );
  }

 Widget _buildServiceCard(Service service) {
  return Container(
    height: 400,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: Colors.grey.shade200)
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 2,),
          Icon(service.icon, size: 22, color: const Color(0xFFFF5C23)),
          const SizedBox(height: 2),
          Text(
            service.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 3),
          Expanded(
            child: Text(
              service.description,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
           const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceDetailPage(service: service),
      ),
    );
            },
            child: Container(
              width: 110,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.arrow_forward, color: Colors.white, size: 12),
                  SizedBox(width: 5),
                  Text(
                    'Learn more',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


}

class Service {
  final String name;
  final String description;
  final IconData icon;

  Service({required this.name, required this.description, required this.icon});
}
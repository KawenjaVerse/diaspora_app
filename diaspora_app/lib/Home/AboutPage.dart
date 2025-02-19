import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  
  final List<String> strategies = [
      "Evidence-based Advocacy",
      "Conducting research to establish facts",
      "Membership education and training",
      "Lobbying and policy engagement",
      "Publications for information sharing",
      "Multi Stakeholder partnerships for a stronger bargaining force",
    ];
  final List<Map<String, dynamic>> _coreValues = [
    {
      'title': 'Migrant Run',
      'description': 'Annual events celebrating the contributions of migrants and promoting community well-being.',
      'isExpanded': false,
    },
    {
      'title': 'Diaspora Registration',
      'description': 'Maintaining a comprehensive registry to better serve and connect with our diaspora.',
      'isExpanded': false,
    },
    {
      'title': 'Global Diaspora Tour',
      'description': 'Engaging with our diaspora across the world through town hall meetings, cultural events, and business forums.',
      'isExpanded': false,
    },
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        iconTheme: IconThemeData(color: Color(0xFFFF5C23)
),
        backgroundColor: Colors.white,
     
        title: Row(
          children: [
          SizedBox(
              width: 30,
            ),
            Text('About Us',style: TextStyle(color: Color(0xFFFF5C23)
            ,fontWeight: FontWeight.bold),),
            Spacer(),
           
Image.asset(
                'assets/images/logo.jpg',
                height: 30,
                width: 90,
                fit: BoxFit.contain,
              ),
           
               ],
        ),
      ),
      body: Column(
        children: [
        
          Container(
  height: 250,
  child: Container(
    decoration: BoxDecoration(
      
      image: DecorationImage(image: AssetImage('assets/images/about.jpeg'),fit: BoxFit.cover,
      )
    ),
  ),
),

Expanded(child: 
                     SingleChildScrollView(
            child: Column(
              children: [
                  // Vision Section
                            Container(
             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
             padding: const EdgeInsets.all(16),
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
  crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
  children: [
    // Title with bottom border
    IntrinsicWidth(
      child: Container(
        alignment: Alignment.center, // Center the text inside the container
        padding: const EdgeInsets.only(bottom: 6), // Space below the text
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFFF4300), // Border color
              width: 1, // Border thickness
            ),
          ),
        ),
        child: const Text(
          "OUR MANDATE",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ),
    const SizedBox(height: 16), // Space between title and vision
    // Centered Vision Text
    const Text(
      "Our mandate is to facilitate Diaspora engagement with the government on issues of mutual interest, provide information, coordinate the flow of communication between the Diaspora and relevant government agencies, advocate for the interests of Ugandans living abroad and provide the necessary support and assistance to empower them to contribute effectively.",
      textAlign: TextAlign.center, // Center the text
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    ),
  ],
),


                            ),
              
                            // Vision Section
                            Container(
             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
             padding: const EdgeInsets.all(16),
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
  crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
  children: [
    // Title with bottom border
    IntrinsicWidth(
      child: Container(
        alignment: Alignment.center, // Center the text inside the container
        padding: const EdgeInsets.only(bottom: 6), // Space below the text
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFFF4300), // Border color
              width: 1, // Border thickness
            ),
          ),
        ),
        child: const Text(
          "Our Vision",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ),
    const SizedBox(height: 16), // Space between title and vision
    // Centered Vision Text
    const Text(
      "Our vision is to establish a highly responsive and effective Diaspora engagement unit that works to empower and promote the positive contributions of Ugandan diaspora in national development.",
      textAlign: TextAlign.center, // Center the text
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    ),
  ],
),


                            ),
                            // Mission Section
                            Container(
             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
             padding: const EdgeInsets.all(16),
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
             child:  Column(
  crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
  children: [
    // Title with bottom border
    IntrinsicWidth(
      child: Container(
        alignment: Alignment.center, // Center the text inside the container
        padding: const EdgeInsets.only(bottom: 6), // Space below the text
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFFF4300), // Border color
              width: 1, // Border thickness
            ),
          ),
        ),
        child: const Text(
          "Our Mission",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ),
    const SizedBox(height: 16), // Space between title and vision
    // Centered Vision Text
    const Text(
      "Our mission is to provide an enabling environment that promotes Diaspora engagement in national affairs and development by providing access to necessary information and services.",
      textAlign: TextAlign.center, // Center the text
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    ),
  ],
),
                            ),
                            // Additional Section (if needed)
                            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(8),
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
                  // Title with bottom border
                  IntrinsicWidth(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom: 6),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFFF4300), // Border color
                            width: 1, // Border thickness
                          ),
                        ),
                      ),
                      child: const Text(
                        "Our Objectives",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), // Space between title and vision
                  // Centered Vision Text
                 
               
            // List of Core Values
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _coreValues.length,
              itemBuilder: (context, index) {
                final coreValue = _coreValues[index];
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        coreValue['isExpanded']
                            ? Icons.remove // Minus icon
                            : Icons.add, // Plus icon
                        color: const Color(0xFFFF4300),
                      ),
                      title: Text(
                        coreValue['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF4300),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          coreValue['isExpanded'] = !coreValue['isExpanded'];
                        });
                      },
                    ),
                    // Show description if expanded
                    if (coreValue['isExpanded'])
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          coreValue['description'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
             ],
              ),
            ),
        
     ],
      ),
    )

)
          
    ]));
  }
}

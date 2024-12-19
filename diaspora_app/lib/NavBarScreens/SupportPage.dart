import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      body: Stack(
        children: [
         
          Container(
  height: 250,
  decoration: BoxDecoration(
    color: Color(0xFFFF5C23)
  ),
  
),

          SingleChildScrollView(
            child: Column(
              children: [
               SizedBox(
                height: 20,
               ),
             
             
             // Text
              Text(
               "DIASPORA UNIT UGANDA IS AN ACTIVE AND FORMALLY RECOGNISED MEMBER OF:",
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 16,
                 fontWeight: FontWeight.bold,
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
          "MINISTRY OF FOREIGN AFFAIRS",
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
   Image.asset('assets/images/foreign.png')
  ],
),


                            ),
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
          "MINISTRY OF LANDS, HOUSING AND URBAN DEVELOPMENT",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    const SizedBox(height: 16), // Space between title and vision
    // Centered Vision Text
   Image.asset('assets/images/lands.jpg')
  ],
),


                            ),
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
          "MINISTRY OF ENERGY AND MINERAL DEVELOPMENT",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    const SizedBox(height: 16), // Space between title and vision
    // Centered Vision Text
   Image.asset('assets/images/energy.png')
  ],
),


                            ),
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
          "MINISTRY OF TOURISM, WILDLIFE AND ANTIQUITIES",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    const SizedBox(height: 16), // Space between title and vision
    // Centered Vision Text
   Image.asset('assets/images/wildlife.png')
  ],
),


                            ),
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
          "UGANDA REVENUE AUTHORITY",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    const SizedBox(height: 16), // Space between title and vision
    // Centered Vision Text
   Image.asset('assets/images/ura.jpg')
  ],
),


                            ),
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
          "NIRA",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    const SizedBox(height: 16), // Space between title and vision
    // Centered Vision Text
   Image.asset('assets/images/nira.jpg')
  ],
),


                            ),
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
          "BANK OF UGANDA",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    const SizedBox(height: 16), // Space between title and vision
    // Centered Vision Text
   Image.asset('assets/images/bank.jpg')
  ],
),


                            ),
          
                            
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
          "DIRECTORATE OF CITIZENSHIP AND IMMIGRATION CONTROL",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    const SizedBox(height: 16), // Space between title and vision
    // Centered Vision Text
   Image.asset('assets/images/state.png')
  ],
),


                            ),
                     
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
          "STATE HOUSE INVESTORS PROTECTION UNIT",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    const SizedBox(height: 16), // Space between title and vision
    // Centered Vision Text
   Image.asset('assets/images/state.png')
  ],
),


                            ),
                        

       
        ]),


                            ),
        ],
      ),
    )
    ;
  }
}
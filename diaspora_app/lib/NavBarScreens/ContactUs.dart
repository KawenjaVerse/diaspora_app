

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';




class ContactUs extends StatefulWidget {
  final String address;
  final String phone;
  final String email;
  final String website;

  const ContactUs({super.key,
  required this.address,
  required this.phone,
  required this.email,
  required this.website
  });

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  // Define a GlobalKey for the form
  final _formKey = GlobalKey<FormState>();
  
  get _messageController => null;
  

 

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFFFF5C23),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  "Contact Us",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
               
              ],
            ),
            Row(
              children: [
               
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    // Add settings functionality
                    print("Settings menu clicked");
                  },
                  icon: const Icon(Icons.more_vert, color: Colors.white), // Vertical dots icon
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/human.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.1),
          ),
          Container(
            height: 250,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: const Color(0xFFFF5C23),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Text
               
               Container(
                margin: EdgeInsets.only(left: 20),
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                    "Hello ",
                    
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  const Text(
                    "WE`RE READY, LET`S TALK",
                    
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ],
                 ),
               ),
               SizedBox(
                height: 10,
               ),
                // Send Us a Message Section
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
                                color: const Color(0xFFFF5C23),
                                width: 1,
                              ),
                            ),
                          ),
                          child: const Text(
                            "Send us a Message",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Form section
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Full Name
                           
                            TextFormField(
                              controller: _messageController,
                              decoration: const InputDecoration(
                                labelText: 'Message',
                                border: OutlineInputBorder(),
                               
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: 4,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your message';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            // Send Message Button
                            ElevatedButton(
                              onPressed: (){},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: const Text('Send Message',style: TextStyle(color: Colors.white),),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF5C23),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
    crossAxisAlignment: CrossAxisAlignment.center, // Align the content to the left
    children: [
      // Title with bottom border
      IntrinsicWidth(
        child: Container(
          alignment: Alignment.center, // Center the text inside the container
          padding: const EdgeInsets.only(bottom: 6), // Space below the text
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: const Color(0xFFFF5C23), // Border color
                width: 1, // Border thickness
              ),
            ),
          ),
          child: const Text(
            "CONTACT INFO",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      const SizedBox(height: 16), // Space between title and contact info
      // Column with Address, Email, and Phone
      Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
        children: [
          // Address Row
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.black),
              const SizedBox(width: 8),
              Container(
                width: 1,
                height: 24,
                color: Color(0xFFFF4300),
              ),
              const SizedBox(width: 8),
              Text(
                      widget.address,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
         const SizedBox(
          height: 10,
         ),
          // Email Row
          Row(
  children: [
    const Icon(Icons.email, color: Colors.black),
    const SizedBox(width: 8),
    Container(
      width: 1,
      height: 24,
      color: const Color(0xFFFF4300),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () async {
        final Uri emailUri = Uri(
          scheme: 'mailto',
          path: widget.email,
          query: Uri.encodeQueryComponent('subject=Inquiry from App'), // Optional: pre-fill subject
        );

        if (await canLaunchUrl(emailUri)) {
          await launchUrl(emailUri);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not open email app')),
          );
        }
      },
      child: Text(
        widget.email,
        style: TextStyle(
          fontSize: 16,
          color:  const Color(0xFFFF5C23),
          decorationColor: const Color(0xFFFF5C23),
          decoration: TextDecoration.underline, // Underline for emphasis
        ),
      ),
    ),
  ],
),

           const SizedBox(
          height: 10,
         ),
          // Phone Number Row
          Row(
            children: [
              const Icon(Icons.phone, color: Colors.black),
              const SizedBox(width: 8),
              Container(
                width: 1,
                height: 24,
                color: const Color(0xFFFF5C23),
              ),
              const SizedBox(width: 8),
               Text(
                widget.phone,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
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
    crossAxisAlignment: CrossAxisAlignment.center, // Align the content to the left
    children: [
      // Title with bottom border
      IntrinsicWidth(
        child: Container(
          alignment: Alignment.center, // Center the text inside the container
          padding: const EdgeInsets.only(bottom: 6), // Space below the text
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: const Color(0xFFFF5C23), // Border color
                width: 1, // Border thickness
              ),
            ),
          ),
          child: const Text(
            "FOLLOW US",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      const SizedBox(height: 16), // Space between title and contact info
      // Column with Address, Email, and Phone
      Column(
        crossAxisAlignment: CrossAxisAlignment.center, 
        // Align content to the left
        children: [
          // Address Row
         Row(
         mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset('assets/images/icons8_facebook_48.png')),
            SizedBox(width: 20,),
          Container(
            height: 40,
            width: 40,
            child: Image.asset('assets/images/icons8_twitter_50.png')),
             SizedBox(width: 20,),
          Container(
            height: 40,
            width: 40,
            child: Image.asset('assets/images/icons8_instagram_48.png')),
         ],)
        ],
      ),
    ],
  ),
),


SizedBox(height: 20,)

              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // Define a GlobalKey for the form
  final _formKey = GlobalKey<FormState>();
  
  // Define text editing controllers to handle input data
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  // Function to handle message sending
  void _sendMessage() {
    if (_formKey.currentState?.validate() ?? false) {
      // Form is valid, process the data
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message Sent Successfully!')),
      );
      // Clear the form fields
      _nameController.clear();
      _phoneController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFFF5C23)
),
        backgroundColor: Colors.white,
     
        title: Row(
          children: [
          SizedBox(
              width: 30,
            ),
            Text('Contact Us',style: TextStyle(color: Color(0xFFFF5C23)
            ,fontWeight: FontWeight.bold),),
            Spacer(),
           
Image.asset(
                'assets/images/coat.png',
                height: 30,
                width: 90,
                fit: BoxFit.contain,
              ),
           
               ],
        ),
      ),
      body: Stack(
        children: [
         
          Container(
            height: 250,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF5C23),
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
                     Center(
                       child: Text(
                                           "GET INVOLVED",
                                           
                                           style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                                           ),
                                         ),
                     ),
                  SizedBox(height: 10,),
                  const Text(
                    "Whether you are looking to invest, stay informed, or participate in national development, our office is here to assist you. Explore our services and discover how you can contribute to our shared future.",textAlign: TextAlign.center,
                    
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
                                color: Color(0xFFFF5C23),
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
                              controller: _nameController,
                              decoration: const InputDecoration(
                                labelText: 'Full Name',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            // Phone Number
                            TextFormField(
                              controller: _phoneController,
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.phone),
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            // Email Address
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email Address',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            // Message
                            TextFormField(
                              controller: _messageController,
                              decoration: const InputDecoration(
                                labelText: 'Message',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.message),
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
                              onPressed: _sendMessage,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: const Text('Send Message',style: TextStyle(color: Colors.white),),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFF5C23),
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
                color: Color(0xFFFF5C23), // Border color
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
                color: Color(0xFFFF5C23),
              ),
              const SizedBox(width: 8),
              const Text('Nakasero'
             ,
                style: TextStyle(fontSize: 16, color: Colors.black),
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
      color: Color(0xFFFF5C23),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () async {
        final Uri emailUri = Uri(
          scheme: 'mailto',
          path: 'diaspora@statehouse.go.ug',
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
        'connect@spadiaspora.ug',
        style: TextStyle(
          fontSize: 16,
          color:  Color(0xFFFF5C23),
          decorationColor: Color(0xFFFF5C23),
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
                color: Color(0xFFFF5C23),
              ),
              const SizedBox(width: 8),
              const Text(
                '+256 414 674 906',
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
                color: Color(0xFFFF5C23), // Border color
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
            height: 60,
            width: 60,
            child: Icon(FontAwesomeIcons.facebook,color: Color(0xFFFF5C23),size: 40)),
            SizedBox(width: 20,),
          Container(
            height: 60,
            width: 60,
            child: Icon(FontAwesomeIcons.twitter,color: Color(0xFFFF5C23),size: 40)),
             SizedBox(width: 20,),
          Container(
            height: 60,
            width: 60,
            child: Icon(FontAwesomeIcons.instagram,color: Color(0xFFFF5C23),size: 40,)),
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

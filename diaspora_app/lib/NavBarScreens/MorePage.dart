import 'package:diaspora_app/Aunthentication/LoginPage.dart';
import 'package:diaspora_app/Home/AboutPage.dart';
import 'package:diaspora_app/Home/GalleryPage.dart';
import 'package:diaspora_app/SplashPage.dart';
import 'package:diaspora_app/utils/Helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'EditProfilePage.dart';

class ProfilePage extends StatefulWidget{
  @override
  State<ProfilePage> createState() {
    return _ProfilePage();
  }

}


class _ProfilePage extends State<ProfilePage>{
 File? _profileImage;
  @override
  void initState() {
    super.initState();
    getName();
  }
Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header with Circular Avatar and Edit Icon
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey.shade100,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!) // Display selected image
                          : null,
                      child: _profileImage == null
                          ? Icon(Icons.person, size: 50, color: Colors.grey.shade500)
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage, // Open gallery to pick an image
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 4,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            FontAwesomeIcons.pen,
                            size: 20,
                            color: const Color(0xFFFF5C23),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("$_name ($_phone)"),
                    Text("$_email", style: TextStyle(fontWeight: FontWeight.bold),),

                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Profile Settings Section: Edit Profile, Language, Notification
              buildSettingsSection(
                context,
                title: 'Profile Settings',
                items: [
                 _buildSettingItem(
  icon: FontAwesomeIcons.userEdit,
  title: 'Edit Profile',
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(
          name: _name,
          email: _email,
          phone: _phone,
        ),
      ),
    ).then((_) {
      // Refresh the profile data after returning from the edit page
      getName();
    });
  },
),
                  // _buildSettingItem(
                  //   icon: FontAwesomeIcons.language,
                  //   title: 'Language',
                  //   onTap: () {},
                  // ),
                  // _buildSettingItem(
                  //   icon: FontAwesomeIcons.bell,
                  //   title: 'Notification',
                  //   onTap: () {},
                  // ),
                   _buildSettingItem(
                    icon: FontAwesomeIcons.signOutAlt,
                    title: 'Logout',
                    onTap: () {
                      // Handle logout action
                      logoutPerson(context);
                       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage() ), (route) => false);
                    },
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Wishlist, Currency Converter Section
              buildSettingsSection(
                context,
                title: 'Other Options',
                items: [
                  _buildSettingItem(
                    icon: Icons.info,
                    title: 'About Us',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutPage(),
                        ),
                      );
                    },
                  ),
                  _buildSettingItem(
                    icon: Icons.photo_size_select_actual_rounded,
                    title: 'Gallery',
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GalleryPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),


              const SizedBox(height: 16),

             
            ],
          ),
        ),
      ),
    );
  }

  // Build a settings section with items
  Widget buildSettingsSection(BuildContext context, {
    required String title,
    required List<Widget> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF5C23),
              ),
            ),
          ),
          ...items,
        ],
      ),
    );
  }

  // Build a single setting item with an icon and title
  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
        child: Row(
          children: [
            Icon(
              icon,
              color: Color(0xFFFF5C23),
              size: 20,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey[600],
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  String? _name;
  String? _email;
  String? _phone;
  Future<void> getName() async {
    var pref = await SharedPreferences.getInstance();
    setState(() {
      _name = pref.getString('user_name');
      _email = pref.getString('user_email');
      _phone = pref.getString('user_phone');
    });
  }
}

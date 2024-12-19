import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
                      backgroundColor: Colors.grey.shade100,
                      radius: 60,
                      child: Icon(Icons.person,size: 50,color: Colors.grey.shade500,)
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          // Handle edit profile
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            FontAwesomeIcons.pen,
                            size: 20,
                            color: Color(0xFFFF5C23),
                          ),
                        ),
                      ),
                    ),
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
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: FontAwesomeIcons.language,
                    title: 'Language',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: FontAwesomeIcons.bell,
                    title: 'Notification',
                    onTap: () {},
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
                    icon: FontAwesomeIcons.heart,
                    title: 'Wishlist',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: FontAwesomeIcons.exchangeAlt,
                    title: 'Currency Converter',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Rating, Support, Quicklinks, Privacy Policy, Logout Section
              buildSettingsSection(
                context,
                title: 'Account Settings',
                items: [
                  _buildSettingItem(
                    icon: FontAwesomeIcons.star,
                    title: 'Rating',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: FontAwesomeIcons.headset,
                    title: 'Support',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: FontAwesomeIcons.link,
                    title: 'Quicklinks',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: FontAwesomeIcons.shieldAlt,
                    title: 'Privacy Policy',
                    onTap: () {},
                  ),
                  _buildSettingItem(
                    icon: FontAwesomeIcons.signOutAlt,
                    title: 'Logout',
                    onTap: () {
                      // Handle logout action
                    },
                  ),
                ],
              ),
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
}
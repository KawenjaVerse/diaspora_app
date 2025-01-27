import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AboutEmbassyPage extends StatefulWidget {
  final String details;
  final String id;

  const AboutEmbassyPage({super.key, required this.details, required this.id});

  @override
  State<AboutEmbassyPage> createState() => _AboutEmbassyPageState();
}

class _AboutEmbassyPageState extends State<AboutEmbassyPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;
  List<dynamic> _staffList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Two tabs
    _fetchStaffData(); // Fetch the staff data on page load
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Fetch staff data from the API
  Future<void> _fetchStaffData() async {
    try {
      final response = await http.get(Uri.parse("http://188.166.8.72:9019/api/staff/get?embassy_id=${widget.id}'"));

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> staffData = json.decode(response.body);
        setState(() {
          _staffList = staffData;
          _isLoading = false;
        });
      } else {
        throw Exception("Failed to load staff data");
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print("Error fetching staff data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
        title: const Text(
          'About Embassy',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: const Color(0xFFFF5C23),
        foregroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white,
          indicatorWeight: 5,
          labelColor: Colors.white,
          tabs: const [
            Tab(text: 'About Embassy'),
            Tab(text: 'Embassy Staff'),
          ],
        ),
      ),
     
      body: TabBarView(
        controller: _tabController,
        children: [
          // About Embassy Tab
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.details.isNotEmpty
                        ? widget.details
                        : 'No details available.',
                    style: const TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
          // Embassy Staff Tab
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _staffList.isEmpty
                    ? Center(child: Text('No staff available.'))
                    : ListView.builder(
                        itemCount: _staffList.length,
                        itemBuilder: (context, index) {
                          final staff = _staffList[index];
                          return _buildStaffCard(
                            name: staff['name'] ?? 'Unknown',
                            title: staff['position'] ?? 'No position',
                            imageUrl: staff['picture'] ?? '', // Use default image if null
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaffCard({
    required String name,
    required String title,
    required String imageUrl,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: imageUrl.isNotEmpty
                  ? NetworkImage(imageUrl)
                  : AssetImage('assets/images/default-avatar.png') as ImageProvider,
              backgroundColor: Colors.grey.shade200,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 8,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

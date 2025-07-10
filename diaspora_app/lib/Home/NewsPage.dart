import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {

  final String image;
  final String title;
  final String description;
  final dynamic obj;

  const NewsDetailPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.obj,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Collapsing App Bar with Image
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(image, fit: BoxFit.cover,), ),
          ),
          // Content Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF5C23)
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Description in a Card

                  if (obj["ministry"] != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6).copyWith(bottom: 8),
                    child: Text(
                      obj["ministry"]["name"] ?? "...",
                      style: const TextStyle(fontSize: 13, height: 1.5, color: Color(0xFFFF5C23),),
                    ),
                  ),

                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

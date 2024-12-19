import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  // Sample album data (replace these with your own album structure)
  final List<Map<String, dynamic>> albums = [
    {
      'title': 'Diaspora Events',
      'coverImage': 'assets/images/gallery1.jpg',
      'images': [
        'assets/images/gallery1.jpg',
          'assets/images/gallery2.jpg',
          'assets/images/gallery3.jpg',
          'assets/images/gallery4.jpg'
      ],
    },
    {
      'title': 'Community Meetings',
      'coverImage':'assets/images/gallery5.jpg',
      'images': [
       'assets/images/gallery5.jpg',
            'assets/images/gallery6.jpg',
            'assets/images/gallery7.jpg'
      ],
    },
    {
      'title': 'Project Launches',
      'coverImage': 'assets/images/gallery8.jpg',
      'images': [
        'assets/images/gallery8.jpg',
            'assets/images/gallery9.jpg',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFFF5C23)
),
        backgroundColor: Colors.white,
     
        title: Row(
          children: [
          SizedBox(
              width: 30,
            ),
            Text('Gallery',style: TextStyle(color: Color(0xFFFF5C23)
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 albums per row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.9, // Square cards
          ),
          itemCount: albums.length,
          itemBuilder: (context, index) {
            final album = albums[index];
            return _buildAlbumCard(album, context);
          },
        ),
      ),
    );
  }

  Widget _buildAlbumCard(Map<String, dynamic> album, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the album detail page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumDetailPage(album: album),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(album['coverImage']),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            album['title'],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class AlbumDetailPage extends StatelessWidget {
  final Map<String, dynamic> album;

  const AlbumDetailPage({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    final List<String> images = album['images'];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFFF5C23)
),
        backgroundColor: Colors.white,
     
        title: Row(
          children: [
          SizedBox(
              width: 10,
            ),
            Text(album['title'],style: TextStyle(color: Color(0xFFFF5C23)
            ,fontWeight: FontWeight.bold),),
           
               ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 images per row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
             childAspectRatio: 0.9,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            final image = images[index];
            return GestureDetector(
              onTap: () {
                // Open a full-screen image viewer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(imagePath: image),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: imagePath,
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
    );
  }
}

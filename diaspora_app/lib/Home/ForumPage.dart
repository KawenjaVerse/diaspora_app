import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Aunthentication/LoginPage.dart'; // For icons

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  // Sample Posts (Replace this with your data source)
  final List<Post> _posts = [
    Post(
      username: 'State House Uganda-Diaspora',
      userProfileImage: 'assets/images/logo.jpg',
      content:
          'Diaspora Unit led by SPA Mohammed Bagonza and deputy Head Henry Wabyona met with External Labour Agencies of Uganda (ELAU) led by Milton Omurwok to get familiar with the sector and find out challenges that Government of Uganda should address.',
      image: 'assets/images/about.jpeg',
      likes: 120,
      comments: [Comment(username: 'Alupo', content: 'Great job!')],
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    Post(
      username: 'Mohammed Bagonza',
      userProfileImage: 'assets/images/bagonza.jpg',
      content:
          '''Dear Ugandans in the Diaspora,
I am pleased to welcome you to the Diaspora Unit. As the head of the  Unit, I am committed to supporting your engagement with the government  and empowering  you to contribute more effectively to the development of Uganda.''',
      likes: 55,
      comments: [],
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
    ),
    // Post(
    //   username: 'AppDevGuru',
    //   userProfileImage: 'https://randomuser.me/api/portraits/men/3.jpg',
    //   content: 'What is your favorite package in flutter ?',
    //   likes: 32,
    //   comments: [
    //     Comment(username: 'DartMaster', content: 'I like provider'),
    //     Comment(username: 'CodingNinja123', content: 'Riverpod')
    //   ],
    //   timestamp: DateTime.now().subtract(const Duration(days: 2)),
    // ),
    // Post(
    //   username: 'DartMaster',
    //   userProfileImage: 'https://randomuser.me/api/portraits/women/4.jpg',
    //   content: 'Just discovered a new way to use streams in Flutter! It\'s amazing!!',
    //   image: 'https://picsum.photos/800/400?random=2',
    //   likes: 202,
    //   comments: [],
    //   timestamp: DateTime.now().subtract(const Duration(hours: 1)),
    // )
  ];

  final List<bool> _likedPosts = List.generate(4, (index) => false); // Track liked status of each post

  void _handleLike(int postIndex) {
    setState(() {
      if (!_likedPosts[postIndex]) {
       _posts[postIndex].likes++;
      }else{
        _posts[postIndex].likes--;
      }
      _likedPosts[postIndex] = !_likedPosts[postIndex]; // Toggle liked status
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFFF5C23)),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            const Text(
              'Forum',
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
      body: ListView.builder(
        itemCount: _posts.length + 1, // +1 for the create post card
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildCreatePostCard();
          }
          return PostWidget(
            post: _posts[index - 1],
             isLiked: _likedPosts[index-1],
            onLike: () => _handleLike(index - 1),
          );
        },
      ),
    );
  }

  // Widget for the "Create Post" card at the top
  Widget _buildCreatePostCard() {
    return GestureDetector(
      onTap: () async {

        var pref = await SharedPreferences.getInstance();
        var isLoggedIn = pref.getBool('is_user_logged_in') ?? false;

        if (isLoggedIn) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CreatePostPage(), // Navigate to the post creation screen
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }


      },
      child: Card(
        color: Colors.white,
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.add_circle_outline, color: Color(0xFFFF5C23)),
              const SizedBox(width: 10),
              Text('Create a new post',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF5C23))),
            ],
          ),
        ),
      ),
    );
  }
}

// Post Model
class Post {
  final String username;
  final String userProfileImage;
  final String content;
  final String? image; // Optional image
  dynamic likes;
  final List<Comment> comments;
  final DateTime timestamp;

  Post({
    required this.username,
    required this.userProfileImage,
    required this.content,
    this.image,
    required this.likes,
    required this.comments,
    required this.timestamp,
  });
}

// Comment Model
class Comment {
  final String username;
  final String content;

  Comment({required this.username, required this.content});
}

// Post Widget - Individual post item
class PostWidget extends StatelessWidget {
  final Post post;
  final VoidCallback onLike;
  final bool isLiked;

  const PostWidget({super.key, required this.post, required this.onLike, required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return Card(
  color: Color.fromARGB(255, 255, 239, 234),
  elevation: 4,
  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header (User Info)
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(post.userProfileImage),
              radius: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.username,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _formatTimestamp(post.timestamp),
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
         const SizedBox(height: 6),
        Divider(),
        const SizedBox(height: 3),
        // Post Content
        Text(
          post.content,
          style: const TextStyle(fontSize: 14),
        ),
        if (post.image != null)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                post.image!,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
          ),
        const SizedBox(height: 10),
        // Actions (Comment/Like/Share)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Comment Action
            GestureDetector(
              onTap: (){},
              child: Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.comment,
                    size: 16,
                    color: Color(0xFFFF5C23),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Comment',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            // Like Action
            GestureDetector(
              onTap: onLike,
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.thumbsUp,
                    size: 16,
                    color: isLiked ? Colors.red : Colors.blue,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Like',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            // Share Action
            GestureDetector(
              onTap: (){},
              child: Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.shareNodes,
                    size: 16,
                    color: Color(0xFFFF5C23),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Share',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Comments Section
        if (post.comments.isNotEmpty) _buildCommentSection(post.comments),
      ],
    ),
  ),
);

  }

  //Helper function to format the timestamp
  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 2) {
      return 'Yesterday';
    } else {
      return '${difference.inDays} days ago';
    }
  }
    //Helper function to build a comment section
    Widget _buildCommentSection(List<Comment> comments){
      return  Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            ...comments.map((comment) =>  Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child:  RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: '${comment.username} ',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: comment.content),
                            ],
                          ),
                        ),
                      ),
                    ]
                  )
              )
          ).toList(),
        ],
      );
    }
}


//Create Post Page
class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create New Post'),
          backgroundColor: Colors.red,
          elevation: 2,
          actions: [
            TextButton(
              onPressed: () {
                // Handle posting logic here
                Navigator.pop(context);
              },
              child: const Text('POST',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                 TextField(
                  controller: _textEditingController,
                   decoration: const InputDecoration(
                      hintText: 'What\'s on your mind?',
                     border: InputBorder.none,
                   ),
                    maxLines: 8,
                 )
              ],
            )
        )
    );
  }
}
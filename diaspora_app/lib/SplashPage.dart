import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _logoOpacityAnimation;
  late Animation<double> _textFadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Faster fade-in effect
    );

    // Fade-in animation for logo
    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    // Fade-in animation for text
    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    // Start animation and navigate to home page after completion
    _animationController.forward().then((_) {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // Background Image
              Image.asset(
                'assets/images/diaspora.jpeg', // Replace with your background image path
                fit: BoxFit.cover,
              ),

              // Overlay with lighter gradient
              Container(
                decoration:  BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF5C23).withOpacity(0.7), // Slightly darker orange
                      Color(0xFFFFC371).withOpacity(0.7), // Slightly darker yellow
                   
                       ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),

              // Centered Circle and Logo with fade-in effect
              Center(
                child: Opacity(
                  opacity: _logoOpacityAnimation.value, // Fade-in opacity for logo
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.jpg'), // Your logo image
                        fit: BoxFit.cover,
                      ),
                      color: Colors.white, // White circle background
                    ),
                    padding: const EdgeInsets.all(20), // Padding to size the circle
                  ),
                ),
              ),

              // Welcoming Word (Diaspora) with fade-in effect
              Positioned(
                bottom: 250,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: _textFadeAnimation.value, // Fade-in opacity for text
                  child: Text(
                    "DIASPORA UNIT UGANDA",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
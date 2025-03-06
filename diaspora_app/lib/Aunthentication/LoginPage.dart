import 'package:diaspora_app/Aunthentication/RegisterPage.dart';
import 'package:diaspora_app/utils/Helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Home/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _loading = false;
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    
    requestAPI("people/login", {"email": email, "password": password}, (loading) {
      setState(() {
        _loading = loading;
      });
    }, (value) {
      if (value["status"] == "success") {
        savePersonInPreference(value["data"]);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(value["message"]),
            backgroundColor: Colors.red,
          ),
        );
      }
    }, (error) {}, method: "POST");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/coat.png', width: 80, height: 80),
              const SizedBox(height: 16.0),
              const Text(
                "DIASPORA UNIT UGANDA",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "Our service to Ugandans",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                   Container(
  height: 60.0, // Reduced height
  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  decoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(30.0),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Email",
        style: TextStyle(color: Colors.black54, fontSize: 12.0), // Smaller font size
      ),
      SizedBox(
        height: 20.0, // Constrain the height of the TextField
        child: TextField(
          cursorColor: Colors.black,
          controller: _emailController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            isDense: true, // Reduces the height of the TextField
          ),
          style: TextStyle(fontSize: 12.0), // Smaller font size for the TextField
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    ],
  ),
),
                    const SizedBox(height: 16.0),
                   Container(
  height: 60.0, // Reduced height
  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
  decoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(30.0),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Password",
        style: TextStyle(color: Colors.black54, fontSize: 14.0), // Smaller font size for the label
      ),
      SizedBox(
        height: 20.0,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true, // Reduces the internal padding of the TextField
                ),
                style: TextStyle(fontSize: 14.0), // Smaller font size for the TextField
              ),
            ),
            IconButton(
              icon: Icon(
                _obscurePassword ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                size: 16.0, // Smaller icon size
              ),
              onPressed: _togglePasswordVisibility,
              padding: EdgeInsets.zero, // Reduce padding around the icon
              constraints: BoxConstraints(), // Remove constraints to make the button smaller
            ),
          ],
        ),
      ),
    ],
  ),
),
                  
                    const SizedBox(height: 16.0),
                    _loading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _login,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 12.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xFFFF5C23),
                              ),
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.white),
                              ),
                            ),
                          ),
                    const SizedBox(height: 8.0),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Color(0xFFFF5C23)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?", style: TextStyle(color: Colors.black)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: const Text("Register here", style: TextStyle(color: Color(0xFFFF5C23))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

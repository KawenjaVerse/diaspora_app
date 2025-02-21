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


  var _email = '';
  var _password = '';

  var _loading = false;
  action(){
    requestAPI("people/login", {"email":_email, "password":_password}, (loading){ setState(() {
      _loading = loading;
    }); }, (value){
      if (value["status"] == "success") {
        savePersonInPreference(value["data"]);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage() ), (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(value["message"]),
          backgroundColor: Colors.red,
        ));
      }
    }, (error){}, method: "POST");

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/gallery2.jpg'), // Add your background image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Overlay
          Container(
            color: Colors.black.withOpacity(0.5), // Adjust overlay opacity
          ),

          // Content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // App Logo or Title
                  Image.asset('assets/images/logo.jpg', width: 80, height: 80),
                  const SizedBox(height: 16.0),
                  const Text(
                    "DIASPORA UNIT UGANDA",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 32.0),

                  // White Rounded Container for the Form
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0), // Rounded corners
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Email TextField
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: const TextStyle(color: Colors.black),
                              prefixIcon: const Icon(FontAwesomeIcons.envelope, color: Colors.black,size: 20),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(color: Colors.orange),
                              ),
                            ),
                            style: const TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              _email = value!;
                            },
                          ),
                          const SizedBox(height: 16.0),

                          // Password TextField
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: const TextStyle(color: Colors.black),
                              prefixIcon: const Icon(FontAwesomeIcons.lock, color: Colors.black,size: 20),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(color: Colors.orange),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(FontAwesomeIcons.eye, color: Colors.black,size: 20,),
                                onPressed: () {}, // Toggle password visibility
                              ),
                            ),
                            style: const TextStyle(color: Colors.black),
                            obscureText: true,
                            onSaved: (value) {
                              _password = value!;
                            },
                          ),
                          const SizedBox(height: 16.0),

                          _loading ? const Center(child: CircularProgressIndicator()) :

                          // Sign In Button
                          ElevatedButton(
                            onPressed: () {
                              _formKey.currentState!.save();
                              action();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFF5C23),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                            ),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 16.0),

                          // Or Divider
                          Row(
                            children: [
                              const Expanded(child: Divider(color: Colors.black)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "OR",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Expanded(child: Divider(color: Colors.black)),
                            ],
                          ),
                          const SizedBox(height: 16.0),

                         
                         

                          // Sign Up Option
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account?", style: TextStyle(color: Colors.black)),
                              TextButton(
                                onPressed: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage() ) );
                                },
                                child: const Text("Sign Up", style: TextStyle(color: Color(0xFFFF5C23))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Afrosoft IT Solutions",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
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

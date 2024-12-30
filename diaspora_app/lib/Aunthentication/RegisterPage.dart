import 'package:diaspora_app/utils/Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();


  var _name = "";
  var _email = "";
  var _phone = "";
  var _password = "";
  var _address = "";
  var _country = "";
  var _city = "";



  var _loading = false;
  void action() {
    _formKey.currentState!.save();

    requestAPI("people/register", {
      "name": _name,
      "email": _email,
      "phone": _phone,
      "password": _password,
      "address": _address,
      "country": _country,
      "city": _city,
    }, (loading){
      setState(() {
        _loading = loading;
      });
    }, (value){
        if (value["status"] == "success") {
          savePersonInPreference(value["data"]);
          Navigator.pop(context);
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

                  const Text(
                    "REGISTER",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16.0),

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
                            decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: const TextStyle(color: Colors.black),
                              prefixIcon: const Icon(FontAwesomeIcons.person, color: Colors.black,size: 20),
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
                            onSaved: (value) {
                              _name = value!;
                            },
                            style: const TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16.0),
                          // Email TextField
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Phone",
                              labelStyle: const TextStyle(color: Colors.black),
                              prefixIcon: const Icon(FontAwesomeIcons.phone, color: Colors.black,size: 20),
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
                              _phone = value!;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          // Email TextField
                          TextFormField(
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



                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Address",
                              labelStyle: const TextStyle(color: Colors.black),
                              prefixIcon: const Icon(FontAwesomeIcons.addressBook, color: Colors.black,size: 20),
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
                              _address = value!;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Country",
                              labelStyle: const TextStyle(color: Colors.black),
                              prefixIcon: const Icon(FontAwesomeIcons.mapPin, color: Colors.black,size: 20),
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
                              _country = value!;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "City",
                              labelStyle: const TextStyle(color: Colors.black),
                              prefixIcon: const Icon(FontAwesomeIcons.mapPin, color: Colors.black,size: 20),
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
                              _city = value!;
                            },
                          ),
                          const SizedBox(height: 16.0),



                          // Password TextField
                          TextFormField(
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

                          // Sign In Button
_loading ? const Center(child: CircularProgressIndicator()) :
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
                              "Sign Up",
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
                          const SizedBox(height: 8.0),


                          // Sign Up Option
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account?", style: TextStyle(color: Colors.black)),
                              TextButton(
                                onPressed: () {
                                  // Navigate to sign-up page
                                  Navigator.pop(context);
                                },
                                child: const Text("Sign In", style: TextStyle(color: Color(0xFFFF5C23))),
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

        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

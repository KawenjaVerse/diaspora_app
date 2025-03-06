import 'package:diaspora_app/Aunthentication/OtpEmailPage.dart';
import 'package:diaspora_app/Aunthentication/OtpPhonePage.dart';
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
  var _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Future<void> action() async {
    _formKey.currentState!.save();

    var success = await Navigator.push(context, MaterialPageRoute(builder: (context) => OtpPhonePage(phone: _phone,) ) );
    if(success == null || success == false){ return; }

    var successEmail = await Navigator.push(context, MaterialPageRoute(builder: (context) => OtpEmailPage(email: _email,) ) );
    if(successEmail == null || successEmail == false){ return; }

    return;

    print("Registering...");
    requestAPI("people/register", {
      "name": _name,
      "email": _email,
      "phone": _phone,
      "password": _password,
      "address": _address,
      "country": _country,
      "city": _city,
    }, (loading) {
      setState(() {
        _loading = loading;
      });
    }, (value) {
      if (value["status"] == "success") {
        savePersonInPreference(value["data"]);
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(value["message"]),
          backgroundColor: Colors.red,
        ));
      }
    }, (error) {}, method: "POST");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 80.0), // Add some top padding

                      // App Logo
                      Image.asset(
                        'assets/images/coat.png', // Replace with your app logo path
                        height: 100.0,
                        width: 100.0,
                      ),
                      const SizedBox(height: 20.0),

                      // Title
                      const Text(
                        "REGISTER",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      // Name TextField
                      _buildTextField(
                        label: "Name",
                        icon: FontAwesomeIcons.person,
                        onSaved: (value) => _name = value!,
                      ),
                      const SizedBox(height: 16.0),

                      // Phone TextField
                      _buildTextField(
                        label: "Phone",
                        icon: FontAwesomeIcons.phone,
                        onSaved: (value) => _phone = value!,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16.0),

                      // Email TextField
                      _buildTextField(
                        label: "Email",
                        icon: FontAwesomeIcons.envelope,
                        onSaved: (value) => _email = value!,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16.0),

                      // Password TextField
                      _buildPasswordField(),
                      const SizedBox(height: 16.0),

                      // Sign Up Button
                      _loading
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                        onPressed: action,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF5C23),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      // Or Divider
                      _buildOrDivider(),
                      const SizedBox(height: 8.0),

                      // Sign In Option
                      _buildSignInOption(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required FormFieldSetter<String> onSaved,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20.0, color: Colors.black54),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(color: Colors.black54, fontSize: 12.0),
                border: InputBorder.none,
                isDense: true,
              ),
              style: const TextStyle(fontSize: 14.0),
              keyboardType: keyboardType,
              onSaved: onSaved,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        children: [
          const Icon(FontAwesomeIcons.lock, size: 20.0, color: Colors.black54),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: const TextStyle(color: Colors.black54, fontSize: 12.0),
                border: InputBorder.none,
                isDense: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                    size: 16.0,
                    color: Colors.black54,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              style: const TextStyle(fontSize: 14.0),
              obscureText: _obscurePassword,
              onSaved: (value) => _password = value!,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrDivider() {
    return Row(
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
    );
  }

  Widget _buildSignInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        const Text("Already have an account?", style: TextStyle(color: Colors.black)),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Sign In", style: TextStyle(color: Color(0xFFFF5C23))),
        ),
      ],
    );
  }
}
import 'package:diaspora_app/utils/Helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpPhonePage extends StatefulWidget{

  var phone;
  OtpPhonePage({this.phone});

  @override
  State<OtpPhonePage> createState() {
    return _OtpPhonePage(phone: phone);
  }

}

class _OtpPhonePage extends State<OtpPhonePage>{

  var phone;
  _OtpPhonePage({this.phone});

  var _message = "Sending verification code to your phone number";


  @override
  void initState() {
    super.initState();
    reviewPhone();
  }

  var _formKey = GlobalKey<FormState>();
  var _showForm = false;
  var _showLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify Phone"),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context, true);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("SKIP>",style: TextStyle(color: Colors.red),),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(_message),
            ),

            if(_showLoading)
              Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              )),

            if(_showForm)
            Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(children: [

                        artyTechTextInput("OTP Code", (value){
                          smsCode = value;
                        },keyboardType: TextInputType.number,prefixIcon:CupertinoIcons.lock),

                        (_loadingVerify) ?
                          Center(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          )) :
                        artyTechButtonOvalFilled("Submit", (){
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                            actionVerify();
                          }
                        })
                    ],),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Future<void> reviewPhone() async {
    //if phone starts with 0, remove it
    if(phone.startsWith("07")){
      phone = phone.substring(2);
      //make it start with +2567
      phone = "+2567$phone";
    } else if (phone.startsWith("2567")){
      phone = "+$phone";
    } else if (phone.startsWith("7")){
      phone = "+256$phone";
    }


    if( phone.startsWith("+2567") ){
      _message = "Sending a verification code to your phone number $phone...";
      _showLoading = true;
    } else {
      _message = "Invalid phone number";
    }
    setState(() {});



    await auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {
        _message = "Phone number verified";
        _showLoading = false;
        setState(() {});
      },
      verificationFailed: (FirebaseAuthException e) {
        _message = "Failed to send verification code to your phone number $phone. Please try again later.";
        _showLoading = false;
        setState(() {});
        showSnackBar(context, e.message ?? "");
      },
      codeSent: (String verificationId, int? resendToken) {
        _message = "We have sent a verification code to your phone number $phone. Please enter the code below to verify your phone number.";
        _showLoading = false;
        _showForm = true;
        setState(() {});

        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _message = "Failed to send verification code to your phone number $phone. Please try again later.";
        _showLoading = false;
        setState(() {});
      },
    );
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  var smsCode = '';
  var verificationId = "";
  var _loadingVerify = false;
  Future<void> actionVerify() async {
    // verify the code
    if( smsCode.isEmpty ){
      showSnackBar(context, "Please enter the verification code sent to your phone number $phone");
      return;
    }

    setState(() {
      _loadingVerify = true;
    });

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    try {
    } catch (e) {
      setState(() {
        _loadingVerify = false;
      });
      showSnackBar(context, "Verification failed: ${e.toString()}");
      return;
    }

    UserCredential? userCredential;
    try {
     userCredential = await auth.signInWithCredential(credential);
    } catch (e) {
      setState(() {
        _loadingVerify = false;
      });
      showSnackBar(context, "Verification failed: ${e.toString()}");
      return;
    }

    setState(() {
      _loadingVerify = false;
    });

    if(userCredential.user != null){
      showSnackBar(context, "Phone number verified");
      Navigator.pop(context, true);
    } else {
      showSnackBar(context, "Failed to verify phone number");
    }
  }
}
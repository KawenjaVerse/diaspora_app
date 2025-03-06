import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/Helper.dart';

class OtpEmailPage extends StatefulWidget{

  var email;
  OtpEmailPage({this.email});

  @override
  State<OtpEmailPage> createState() {
    return _OtpEmailPage( email: email );
  }

}

class _OtpEmailPage extends State<OtpEmailPage>{

  var email;
  _OtpEmailPage({this.email});

  var _formKey = GlobalKey<FormState>();
  var _showForm = false;
  var _showLoading = false;
  var _loadingVerify = false;
  var _message = "Sending verification code to your email";
  var smsCode = "";

  @override
  void initState() {
    super.initState();
    sendCodeToEmail();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify Email"),
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
    );;
  }

  void actionVerify() {
    print(smsCode);
    print(_systemOtp);
    if(smsCode == _systemOtp){
      Navigator.pop(context, true);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Invalid Email OTP Code"),
        backgroundColor: Colors.red,
      ));
    }
  }

  var _systemOtp ="";
  void sendCodeToEmail() {
    //sendOTPEmail
    requestAPI("sendOTPEmail", {"email":email}, (loading){
      setState(() {
        _showLoading = loading;
      });
    }, (response){
      if(response["status"] == "success"){
        _showForm = true;
        _systemOtp = "${response["data"]}";
        _message = "Enter the OTP code sent to your email : $email ";
        setState(() {});
      }
    }, (e){

    },method: "POST");
  }
}
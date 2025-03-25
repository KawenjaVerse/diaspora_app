import 'package:diaspora_app/utils/Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiasporaRegistrationPage extends StatefulWidget{
  @override
  State<DiasporaRegistrationPage> createState() {
    return _DiasporaRegistrationPage();
  }

}

class _DiasporaRegistrationPage extends State<DiasporaRegistrationPage>{

  final _formKey = GlobalKey<FormState>();
//country, surname, given names, other names,
  var _country = "";
  var _surname = "";
  var _givenNames = "";
  var _otherNames = "";
  var _gender = "";
  var _dob = "";
  var _email = "";
  var _phone = "";
  var _address = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Diaspora Registration"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Fill the details below to register"),
            Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [

                          artyTechTextInput("Country", (v){
                            _country = v;
                          }, prefixIcon: Icons.place_sharp,keyboardType: TextInputType.text),

                          artyTechTextInput("Surname", (v){
                            _surname = v;
                          }, prefixIcon: Icons.person,keyboardType: TextInputType.text),

                          artyTechTextInput("Given Names", (v){
                            _givenNames = v;
                          }, prefixIcon: Icons.person,keyboardType: TextInputType.text),

                          artyTechTextInput("Other Names", (v){
                            _otherNames = v;
                          }, prefixIcon: Icons.person,keyboardType: TextInputType.text),

                         //gender, dob, email, phone, address,

                          artyTechTextInput("gender", (v){
                            _gender = v;
                          }, prefixIcon: Icons.person,keyboardType: TextInputType.text),

                          artyTechTextInput("Date of Birth", (v){
                            _dob = v;
                          }, prefixIcon: Icons.person,keyboardType: TextInputType.text),

                          artyTechTextInput("Email", (v){
                            _email = v;
                          }, prefixIcon: Icons.email,keyboardType: TextInputType.emailAddress),

                          artyTechTextInput("Phone", (v){
                            _phone = v;
                          }, prefixIcon: Icons.phone,keyboardType: TextInputType.phone),

                          artyTechTextInput("Address", (v){
                            _address = v;
                          }, prefixIcon: Icons.place,keyboardType: TextInputType.text),



                         SizedBox(height: 10,),

                         _loading ? Center(child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: CircularProgressIndicator(),
                         ),) :
                         artyTechButtonOvalFilled("Submit", (){
                           if (_formKey.currentState!.validate()) {
                             _formKey.currentState?.save();
                             action();
                           }
                         })
                                          ],),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  var _loading = false;
  void action() {

    //country, surname, given names,
    if(_country.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Country is required"), backgroundColor: Colors.red,));
      return;
    }

    if(_surname.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Surname is required"), backgroundColor: Colors.red,));
      return;
    }

    if(_givenNames.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Given names are required"), backgroundColor: Colors.red,));
      return;
    }




    //send data
    //diaspora/register
    requestAPI("diaspora/register", {

      "country": _country,
      "surname": _surname,
      "given_names": _givenNames,
      "other_names": _otherNames,
      "gender":_gender,
      "dob":_dob,
      "email":_email,
      "phone":_phone,
      "address":_address

    }, (loading){
      setState(() {
        _loading = loading;
      });
    }, (response){
      if(response["status"] == "success"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration successful"), backgroundColor: Colors.green,));
        Navigator.pop(context);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response["message"]), backgroundColor: Colors.red,));
      }
    }, (e){}, method: "POST");
  }
}
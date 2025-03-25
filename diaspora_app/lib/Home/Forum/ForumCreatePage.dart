import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:diaspora_app/utils/Helper.dart';


class ForumCreatePage extends StatefulWidget{

  var forum;
  ForumCreatePage(this.forum);

  @override
  State<ForumCreatePage> createState() {
    return _ForumCreatePage(forum);
  }

}

class _ForumCreatePage extends State<ForumCreatePage>{

  var forum;
  _ForumCreatePage(this.forum);

  var _formKey = GlobalKey<FormState>();

  var typeMessage = "";
  var _selected_receipt_path = "";


  @override
  void initState() {
    super.initState();
    displayUser();
  }

  var person;
  Future<void> displayUser() async {
    var user = (await SharedPreferences.getInstance()).getString("user");
    setState(() {
      person = jsonDecode(user!);
    });
  }

  var _uploadingProfilePicture = false;
  Future<void> uploadPicture(String path) async {
    var user_id = (await SharedPreferences.getInstance()).getString("user_id");
    requestAPI("updateProfilePicture", {
      "person_id": user_id,
      "picture": await MultipartFile.fromFile(path),
    }, (loading) {
      setState(() {
        _uploadingProfilePicture = loading;
      });
    }, (list) {
      showSnackBar(context, "Picture Uploaded");
      savePersonInPreference(list['person']);
      displayUser();
    }, (e) {
      showSnackBar(context, "Error Uploading Picture");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( forum == null ? "New Message" : "New Comment"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){ // Handle camera button tap
                        artyTechPickPicture(context, (path){
                          uploadPicture(path);
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              image: DecorationImage(
                                image: person?["picture"] != null ? NetworkImage( person['picture']) :  AssetImage("assets/images/user.jpg"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(75),
                            ),
                          ),

                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(75),
                                ),
                                child: Icon(Icons.camera_alt, color: Colors.white, size: 15,)),
                          )

                        ],
                      ),
                    ),

                    if( _uploadingProfilePicture )
                      Center(child: Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator())),
                    SizedBox(width: 8,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Posting As", style: TextStyle(fontSize: 13,),),
                          if(person != null)
                            Text("${person["name"] ?? "No User"}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

                        ],
                      ),
                    ),


                  ],
                ),
              ),


              SizedBox(height: 10,),
              Container(
                child: Form(
                  key: _formKey,
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.all(smallMargin),
                    decoration: boxDecoration,
                    width: double.infinity,
                    child: TextFormField(
                      maxLines: 8,
                      decoration: inputDecoration("Type your message"),
                      onSaved: (value){
                        typeMessage = value!;
                      },
                    ),
                  ),
                ),
              ),



              if(_selected_receipt_path != "") Container(
                height: 200,
                margin: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: FileImage(File(_selected_receipt_path)),
                        fit: BoxFit.cover
                    )
                ),

              ),




              _loading ? Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),) :
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    GestureDetector(
                      onTap: (){
                        artyTechPickPicture(context, (value){
                          setState(() {
                            _selected_receipt_path = value;
                          });
                        },);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10 ),
                        padding: EdgeInsets.symmetric(vertical: 9),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          border: Border.all(color: Colors.black26, width: 1.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3),
                          child: Icon(Icons.camera_alt,size: 20,),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          _formKey.currentState?.save();
                          actionPost();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(child: Text("Post message", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                                  Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        border: Border.all(color: Colors.white, width: 1.5),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Icon(Icons.send,size: 15,color: Colors.white,)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var _loading = false;
  Future<void> actionPost() async {
    var user_id = (await SharedPreferences.getInstance()).getString("user_id");
    requestAPI("forums_create", {
      "parent_id": forum == null ? '' : forum["id"],
      "person_id": user_id,

      "message": typeMessage,
      if(_selected_receipt_path != "")
        "picture": await MultipartFile.fromFile(_selected_receipt_path),
    }, (loading){
      setState(() {
        _loading = loading;
      });
    }, (response){
      if( response["status"] == "success" ){
        Navigator.pop(context, true);
      }else{

      }

    }, (e){}, method: "POST");
  }
}
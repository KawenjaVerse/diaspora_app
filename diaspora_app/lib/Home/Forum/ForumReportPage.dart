import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:diaspora_app/utils/Helper.dart';



class ForumReportPage extends StatefulWidget{

  var forum;
  ForumReportPage({required this.forum});

  @override
  State<ForumReportPage> createState() {
    return _ForumReportPage(forum: forum);
  }

}

class _ForumReportPage extends State<ForumReportPage>{

  var forum;
  _ForumReportPage({required this.forum});

  var _reason = "Abusive Language";
  var _comment = "";

  var _loading = false;
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report Post"),),
      body: SingleChildScrollView(
        child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [

                      artyTechDropDown("Reason", _reason, [
                        "Abusive Language",
                        "Violent speech",
                        "Spam",
                        "Inappropriate Content",
                        "Others"
                      ], (value){
                        setState(() {
                          _reason = value;
                        });
                      }),
                      SizedBox(height: 10,),
                      artyTechTextArea("Comment", (v){
                        setState(() {
                          _comment = v;
                        });
                      }),

                      _loading ? CircularProgressIndicator() : artyTechButtonOvalFilled("Submit", (){
                        _formKey.currentState?.save();
                        action();
                      })

                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Future<void> action() async {
    if( _comment.isEmpty ){
      showSnackBar(context, "Please provide a comment");
      return;
    }

    var user_id = (await SharedPreferences.getInstance()).getString("user_id");
    requestAPI("report_forum", {
      "forum_id": forum["id"],
      "person_id": user_id,
      "reason": _reason,
      "comment": _comment
    }, (loading){
      setState(() {
        _loading = loading;
      });
    }, (response){
      if( response["status"] == "success" ){
        showSnackBar(context, "Report submitted successfully");
        Navigator.pop(context);
      } else {
        showSnackBar(context, response["message"]);
      }
    }, (e){
      showSnackBar(context, "An error occurred");
    });
  }
}
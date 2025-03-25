import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:diaspora_app/utils/Helper.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Aunthentication/LoginPage.dart';
import 'ForumCommentsPage.dart';
import 'ForumCreatePage.dart';
import 'ForumReportPage.dart';
import 'PreviewPicturePage.dart';

class ForumPage extends StatefulWidget{
  @override
  State<ForumPage> createState() {
    return _ForumPage();
  }

}

class _ForumPage extends State<ForumPage>{


  var forums = [];
  @override
  void initState() {
    super.initState();
    get_forums();
  }

  var _loading = true;
  get_forums() async {
    var user_id = (await SharedPreferences.getInstance()).getString("user_id");
    requestAPI("forums", {"person_id":user_id}, (loading){
      setState(() {
        _loading = loading;
      });
    }, (list){
      setState(() {
        forums = list;
      });
    }, (e){}, method: "POST");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFFF5C23)),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            const Text(
              'Forum',
              style: TextStyle(
                  color: Color(0xFFFF5C23), fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Image.asset(
              'assets/images/coat.png',
              height: 30,
              width: 90,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                //check if is logged in
                var is_user_logged_in = (await SharedPreferences.getInstance()).getBool("is_user_logged_in");
                if( is_user_logged_in == null || !is_user_logged_in ){
                  //need an account to post in the forum/community dialog
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text("You need an account to post in the community"),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage() ) );
                        }, child: Text("Login/Register")),
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("Cancel")),
                      ],
                    );
                  });
                  return;
                }
                var refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => ForumCreatePage(null) ) );
                if( refresh == true ){
                  get_forums();
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 5, right: 5, bottom: 5),
                child: Card(
                  color: mainColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(child: Text("Add a New Message", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                        Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              border: Border.all(color: Colors.white, width: 1.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(Icons.add,size: 15,color: Colors.white,)),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: _loading ? Center(child: CircularProgressIndicator()) : ListView.builder(
                itemCount: forums.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage( requestFile(forums[index]["person"]["picture"] ?? "") ),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(forums[index]["person"]["name"] ?? "", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text(formatLaravelTime( forums[index]["created_at"]), style: TextStyle(fontSize: 12, color: Colors.grey),),
                                      ],
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      showDialog(context: context, builder: (context){
                                        return AlertDialog(
                                          title: Text("Report Post or Block?"),
                                          actions: [
                                            TextButton(onPressed: (){
                                              Navigator.pop(context);
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => ForumReportPage(forum :forums[index]) ) );
                                            }, child: Text("Report Post")),
                                            TextButton(onPressed: (){
                                              Navigator.pop(context);
                                              blocUser(forums[index]);
                                            }, child: Text("Block User")),

                                          ],
                                        );
                                      });
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Icon(Icons.more_horiz,size: 15,)),
                                  )
                                ],
                              ),
                            ),

                            if( forums[index]["message"] != null)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text( forums[index]["message"] ?? "",style: TextStyle( fontSize: 12),),
                              ),

                            if(forums[index]["picture"] != null)
                              GestureDetector(
                                onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewPicturePage( picture : forums[index]["picture"] ?? "") ) );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage( forums[index]["picture"] ?? ""),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 150,
                                  width: double.infinity,
                                ),
                              ),


                            if(forums[index]["reply_message"] != null)
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  color: mainColor.withAlpha(50),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("iCanSave Support Team", style: TextStyle(fontWeight: FontWeight.bold, color: mainColor, fontSize: 12),),
                                    Text( forums[index]["reply_message"] ?? "",style: TextStyle( fontSize: 12),),
                                  ],
                                ),
                              ),


                            if( forums[index]["last_comment"] != null)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Commenter",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: mainColor),),
                                    SizedBox(width: 5,),
                                    Expanded(child: Text(forums[index]["last_comment"]["message"],style: TextStyle(fontSize: 11),))
                                  ] ,),
                              ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        requestAPI("forums/${forums[index]["id"]}/like", {"forum_id": forums[index]["id"]}, (loading){
                                          if( loading ) {
                                            setState(() {
                                              forums[index]["count_likes"] =
                                                  forums[index]["count_likes"] +
                                                      1;
                                            });
                                          }
                                        }, (list){}, (e){}, method: "GET");
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Icon(Icons.thumb_up_off_alt,size: 15,)),
                                    ),
                                    SizedBox(width: 5,),
                                    Text("${forums[index]["count_likes"]}", textAlign: TextAlign.end, style: TextStyle(fontSize: 12),),
                                  ],
                                ),
                                SizedBox(width: 8,),
                                GestureDetector(
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(children: [
                                      Icon(Icons.chat_bubble_outline_outlined,size: 15,),
                                      SizedBox(width: 5,),
                                      Text("${forums[index]["count_comments"]}", textAlign: TextAlign.end, style: TextStyle(fontSize: 12),),
                                      SizedBox(width: 5,),
                                      Text("Comments",style: TextStyle( fontSize: 12),),
                                    ],),
                                  ),
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForumCommentsPage( forum : forums[index]) ) );
                                  },
                                ),

                                Spacer(),

                                GestureDetector(
                                  onTap: (){
                                    Share.share('DiasporaApp: "${forums[index]["message"]}" by ${forums[index]["person"]["name"]} ');
                                    showSnackBar(context, "Sharing...");
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Icon(Icons.share,size: 15,)),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  void blocUser(forum) {
    if( forum["person"] == null ){
      return;
    }


    //show dialog you are about to block all content coming from this user
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Block User"),
        content: Text("You are about to block all content coming from ${ forum["person"]["name"] }"),
        actions: [

          TextButton(onPressed: () async {
            Navigator.pop(context);
            //block user
            var user_id = (await SharedPreferences.getInstance()).getString("user_id");
            requestAPI("block_user", {
              'forum_id' : forum["id"],
              "person_id": user_id ?? 0,

              "reported_person_id": forum["person_id"],
              "reason": "Block User",
            },
                    (loading){
                  setState(() {
                    _loading = loading;
                  });
                }, (data){
                  print("LOADED");
                  get_forums();
                }, (e){
                  print("ERROR");
                }, method: "POST");
          }, child: Text("Block")),
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Cancel")),
        ],
      );
    });
  }

}
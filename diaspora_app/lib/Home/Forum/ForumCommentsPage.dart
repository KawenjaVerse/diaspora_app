import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Aunthentication/LoginPage.dart';
import 'ForumCreatePage.dart';

import 'package:diaspora_app/utils/Helper.dart';

class ForumCommentsPage extends StatefulWidget{

  var forum;
  ForumCommentsPage({required this.forum});

  @override
  State<ForumCommentsPage> createState() {
    return _ForumCommentsPage(forum: forum);

  }

}

class _ForumCommentsPage extends State<ForumCommentsPage>{

  var forum;
  _ForumCommentsPage({required this.forum});

  var forums = [];
  @override
  void initState() {
    super.initState();
    get_forums();
  }

  var _loading = true;
  get_forums() async {
    var user_id = (await SharedPreferences.getInstance()).getString("user_id");
    requestAPI("forums", {"parent_id":forum["id"],"person_id":user_id}, (loading){
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
      appBar: AppBar(title: Text("${forum["person"]["name"] ?? ""} Comments"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text("${forums.length} comments"),
          ),

          Expanded(
            child:_loading ? Center(child: CircularProgressIndicator()) :  ListView.builder(
                      itemCount: forums.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage( requestFile(forums[index]["person"]["picture"] ?? "") ),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(forums[index]["person"]["name"] ?? "", style: TextStyle(fontWeight: FontWeight.bold),),
                                        SizedBox(width: 10,),
                                        Text(formatLaravelTime( forums[index]["created_at"]), style: TextStyle(fontSize: 12, color: Colors.grey),),
                                       ],
                                    ),
                                    if( forums[index]["message"] != null)
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text( forums[index]["message"] ?? "",style: TextStyle( fontSize: 12),),
                                      ),


                                    if(forums[index]["picture"] != null)
                                      Container(
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

                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
          ),

          GestureDetector(
            onTap: () async {


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
              var refresh = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForumCreatePage( forum)));
              if (refresh == true) {
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
                      Expanded(child: Text("Add Comment", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
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
        ],
      ),
    );
  }

}
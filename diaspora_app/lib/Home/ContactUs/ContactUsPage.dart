import 'package:diaspora_app/utils/Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chats/ChatPage.dart';

class ContactUsPage extends StatefulWidget{
  @override
  State<ContactUsPage> createState() {
    return _ContactUsPage();
  }

}

class _ContactUsPage extends State<ContactUsPage>{

  var contacts = [1,2,3,2,3,2,3,2,3,2,3];
  var actions = [];

  @override
  void initState() {
    super.initState();
    actions = [
      {"name":"Call", "icon":Icons.call, "subtitle":"Call us now", "color":Colors.green, "id":1},
      {"name":"SMS", "icon":Icons.sms, "subtitle":"Send us a message", "color":Colors.blue, "id":2},
      {"name":"Chat", "icon":Icons.chat, "subtitle":"Chat with us", "color":Colors.orange, "id":3 },
      {"name":"Video Call", "icon":Icons.video_call, "subtitle":"Zoom Workspace" , "color":Colors.red, "id":4 },
    ];
    getSocialMedia();
  }



  var social_media = [];
  bool _loading = false;
  getSocialMedia() {
    requestAPI("social_media", {"":""}, (loading){ setState(() {
      _loading = loading;
    }); }, (value){
      setState(() {
        social_media = value;
      });
    }, (error){}, method: "POST");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Us"),),
      body: Column(children: [



        Container(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: actions.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  if( actions[index]["id"] == 3 )
                   Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage() ) );
                },
                child: Container(
                  width: 150,
                  margin: EdgeInsets.only(left: 5),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: actions[index]["color"] ,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(actions[index]["icon"], size: 20, color: Colors.white,)),
                                SizedBox(height: 5,),
                                Text(actions[index]["name"], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),)
                          ),
                            padding: EdgeInsets.symmetric(vertical: 8),
                            width: double.infinity,
                            child: Text(actions[index]["subtitle"], style: TextStyle(fontSize: 11, color: Colors.white),textAlign: TextAlign.center,)),
                      ],
                    ),
                  ),
                ),
              );
            }
          ),
        ),


        //2 by varing grid
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text("Social Media", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        ),
        _loading ? CircularProgressIndicator() :
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: social_media.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 2.9
            ),
            itemBuilder: (context, index){
              var sm = social_media[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(sm["picture"]),
                                  fit: BoxFit.cover
                              )
                          )),
                      SizedBox(width: 10,),
                      Text("${sm["name"]}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              );
            }
          ),
        )

      ],),
    );
  }
}
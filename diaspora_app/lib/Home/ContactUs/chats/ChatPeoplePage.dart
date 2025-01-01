import 'package:diaspora_app/Home/ContactUs/chats/ChatPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/Helper.dart';
import '../call/VideoPage.dart';
import '../call/join_screen.dart';

class ChatPeoplePage extends StatefulWidget{
  @override
  State<ChatPeoplePage> createState() {
    return _ChatPeoplePage();
  }

}

class _ChatPeoplePage extends State<ChatPeoplePage>{

  @override
  void initState() {
    super.initState();
    getPeople();
  }

  var people = [];
  var _loading = false;
  getPeople() {
    requestAPI("chats_people", {
      "":""
    }, (loading){
      setState(() {
        _loading = loading;
      });
    }, (value){
      setState(() {
        people = value;
      });
    }, (error){},method: "POST");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("People"),),
      body: _loading ? Center(child: CircularProgressIndicator()) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            var person = people[index];
            return Container(
              padding: const EdgeInsets.all(2),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: Text("${person["name"]}", style: TextStyle(fontWeight: FontWeight.bold),)),
                                Text("${person["type"]}", style: TextStyle(fontSize: 12),)
                              ],
                            ),
                            Divider(height: 3,),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${person["email"]}",style: TextStyle(fontSize: 12),),
                                      Text("${person["phone"]}",style: TextStyle(fontSize: 12),),
                                    ],
                                  ),
                                ),

                                IconButton(
                                  color: Colors.red,
                                  icon: Icon(Icons.video_call),
                                  onPressed: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => JoinScreen() ) );
                                  },
                                ),
                                SizedBox(width: 10,),
                                IconButton(
                                  color: Colors.blue,
                                  icon: Icon(Icons.chat),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(reciever_id:"${person["id"]}") ) );
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ) ;
          },
        ),
      ),
    );
  }
}
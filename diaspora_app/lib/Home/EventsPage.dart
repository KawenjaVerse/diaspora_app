import 'package:diaspora_app/utils/Constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/Helper.dart';

class EventsPage extends StatefulWidget{
  @override
  State<EventsPage> createState() {
    return _EventsPage();
  }

}

class _EventsPage extends State<EventsPage>{

@override
  void initState() {
    super.initState();
    _getEvents();
  }

  var _loadingEvents = false;
  var events = [];
  void _getEvents() {
    print("Fetching events >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    requestAPIDirect("events/get", {"":""}, (loading){
      setState(() {
        _loadingEvents = loading;
      });
    }, (response){
      setState(() {
        events = response;
      });
    }, (e){ }, method: "GET");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text("Events",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFFFF5C23),
      ),
      body: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {

                      //create a dialog to show the description of the event
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(events[index]["description"]),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Close"),
                              ),
                            ],
                          );
                        },
                      );


                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(children: [
                                    Icon(Icons.date_range,size: 16,),
                                    Text( formatTime( events[index]["start_date"] ), style: TextStyle(fontSize: 12),),
                                  ],),
                                  const SizedBox(width: 10,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${events[index]["title"]}".toUpperCase() , style: TextStyle(fontSize: 24, color: colorO, fontWeight: FontWeight.bold),),
                                        Container(
                                          margin: const EdgeInsets.symmetric(vertical: 5),
                                          height: 200,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            image: DecorationImage(
                                              image: NetworkImage(events[index]["picture"]),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5,),

                                        Row(
                                          children: [
                                            Icon(Icons.date_range,size: 15,),
                                            const SizedBox(width: 5,),
                                            Text(events[index]["start_date"], style: TextStyle(fontSize: 12),),
                                            Text(" - "),
                                            Text(events[index]["start_date"], style: TextStyle(fontSize: 12),),
                                          ],
                                        ),   Row(
                                          children: [
                                            Icon(Icons.location_on,size: 15,),
                                            const SizedBox(width: 5,),
                                            Text(events[index]["location"], style: TextStyle(fontSize: 12),),
                                          ],
                                        ),

                                        if(events[index]["link"] != null)
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(Icons.link,size: 15,),
                                            const SizedBox(width: 5,),
                                            Expanded(child: Text(events[index]["link"], style: TextStyle(fontSize: 12),),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: colorO,
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.business,size: 15,color: Colors.white),
                                    const SizedBox(width: 5,),
                                    Expanded(child: Text(events[index]["ministry"]["name"], textAlign: TextAlign.start, style: TextStyle(fontSize: 12, color: Colors.white),)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }

  String formatTime(event_date) {
    DateTime dateTime = DateTime.parse(event_date);
    String formattedDate = "${dateTime.day} / ${dateTime.month}";
    return formattedDate;
  }
}

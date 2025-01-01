import 'package:flutter/material.dart';
import 'api_call.dart';
import 'meeting_screen.dart';
import 'package:flutter/cupertino.dart';

class JoinScreen extends StatefulWidget{

  String? meeting_id;
  JoinScreen({this.meeting_id});

  @override
  State<JoinScreen> createState() {
    return _JoinScreen(meeting_id: meeting_id);
  }

}

class _JoinScreen extends State<JoinScreen>{

  String? meeting_id;
  _JoinScreen({this.meeting_id});

  @override
  void initState() {
    super.initState();

    if(meeting_id == null){
      message = "New Meeting ...";
      createMeeting().then((meetingId) {
        setState(() {
          message = "Meeting Created ...$meetingId";
        });
      });
    } else {
      message = "Continuing Meeting ...$meeting_id";
    }
  }

  final _meetingIdController = TextEditingController();

  void onCreateButtonPressed(BuildContext context) async {
    // call api to create meeting and then navigate to MeetingScreen with meetingId,token
    await createMeeting().then((meetingId) {
      if (!context.mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MeetingScreen(
            meetingId: meetingId,
            token: token,
          ),
        ),
      );
    });
  }

  void onJoinButtonPressed(BuildContext context) {
    String meetingId = _meetingIdController.text;
    var re = RegExp("\\w{4}\\-\\w{4}\\-\\w{4}");
    // check meeting id is not null or invaild
    // if meeting id is vaild then navigate to MeetingScreen with meetingId,token
    if (meetingId.isNotEmpty && re.hasMatch(meetingId)) {
      _meetingIdController.clear();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MeetingScreen(
            meetingId: meetingId,
            token: token,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter valid meeting id"),
      ));
    }
  }

  var message = "Getting Things Ready...";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Call Dialer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                          width: 20, height: 20,
                          margin: EdgeInsets.only(bottom: 10, top: 5),
                          child: const CircularProgressIndicator()),
                      Text("$message"),
                    ],
                  ),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () => onCreateButtonPressed(context),
              child: const Text('Create New Meeting'),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Meeting Id',
                  border: OutlineInputBorder(),
                ),
                controller: _meetingIdController,
              ),
            ),
            ElevatedButton(
              onPressed: () => onJoinButtonPressed(context),
              child: const Text('Join Meeting'),
            ),
          ],
        ),
      ),
    );
  }
}

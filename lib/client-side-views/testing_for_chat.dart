import 'package:flutter/material.dart';
import 'package:soulgood/client-side-views/log.dart';


class TestingChat extends StatefulWidget {
  const TestingChat({ Key? key }) : super(key: key);

  @override
  _TestingChatState createState() => _TestingChatState();
}

class _TestingChatState extends State<TestingChat> {
  final userId = TextEditingController();
  final channelName = TextEditingController();
 
 LogController logController = LogController();

 @override
  void initState() {
    super.initState();
    createClient();
  }
  void createClient ()async{}
  void login()async{}
  void joinChannel(BuildContext context)async{

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: userId,decoration: InputDecoration(hintText: 'UserId'),),
            TextField(controller: channelName,decoration: InputDecoration(hintText: 'channel'),),
            ElevatedButton(onPressed: login, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
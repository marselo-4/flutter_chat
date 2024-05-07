// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat/src/services/authentication.dart';
import 'package:flutter_chat/src/services/message_service.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => new _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final auth = FirebaseAuth.instance;
  TextEditingController messageController = TextEditingController();

  InputDecoration _messageTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: 'Type your message here...',
    border: InputBorder.none,
  );

  BoxDecoration _messageContainerDecoration = BoxDecoration(
    border: Border(
      top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    ),
  );

  TextStyle _sendButtonStyle = TextStyle(
      color: Colors.lightBlueAccent,
      fontWeight: FontWeight.bold,
      fontSize: 18.0);

  User? loggedInUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    _getMessages();
  }

  void getUser() async {
    var authentication = Authentication();
    var user = await authentication.getCurrentUser();
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser?.email);
    } else {
      print("User null");
    }
  }

  void _getMessages() async {
    await for (var snapshot in MessageService().getMessageStream()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              auth.signOut();
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: MessageService().getMessageStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final messages = snapshot.data?.docs;
                List<ChatItem> chatItems = [];
                for (var message in messages!) {
                  final messageText = message['value'];
                  final messageSender = message['sender'];
                  chatItems.add(ChatItem(
                      message: messageText,
                      sender: messageSender,
                      isMe:
                          loggedInUser?.email == messageSender ? true : false));
                }
                return Expanded(
                  child: ListView(
                    children: chatItems,
                  ),
                );
              },
            ),
            Container(
              decoration: _messageContainerDecoration,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    decoration: _messageTextFieldDecoration,
                    controller: messageController,
                  )),
                  ElevatedButton(
                      onPressed: () {
                        MessageService().save(
                            collectionName: "messages",
                            collectionValues: {
                              'value': messageController.text,
                              'sender': loggedInUser?.email
                            });
                      },
                      child: Text(
                        "Enviar",
                        style: _sendButtonStyle,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String message;
  final String sender;
  final bool isMe;

  ChatItem({required this.message, required this.sender, this.isMe = true});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              sender,
              style: TextStyle(fontSize: 15.0, color: Colors.grey),
            ),
            Material(
              color: isMe ? Colors.lightBlueAccent : Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  message,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: isMe ? Colors.white : Colors.black),
                ),
              ),
            ),
          ],
        ));
  }
}

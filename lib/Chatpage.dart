import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moments/Mytextfiled.dart';
import 'package:moments/chatbubble.dart';
import 'package:moments/services/chat/chat_service.dart';

class Chatpage extends StatefulWidget {
  final String receieveruseremail;
  final String receieveruserid;
  const Chatpage(
      {super.key,
      required this.receieveruseremail,
      required this.receieveruserid});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  final TextEditingController _messagecontroller = TextEditingController();
  final Chatservice _chatservice = Chatservice();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendmessage() async {
    if (_messagecontroller.text.isNotEmpty) {
      await _chatservice.sendmessage(
          widget.receieveruserid, _messagecontroller.text);
      _messagecontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.receieveruseremail)),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(child: _buildmessagelist()),
          _buildmessageinput(),
        ],
      ),
    );
  }

  //build message list
  Widget _buildmessagelist() {
    return StreamBuilder(
      stream: _chatservice.getmessages(
        widget.receieveruserid,
        _firebaseAuth.currentUser!.uid,
      ),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return const Text("No messages found.");
        }

        return ListView(
          children: snapshot.data!.docs.map((document) {
            if (document.data() != null) {
              return _buildmessageitem(document);
            } else {
              return Container(); // Return an empty container or handle the case when data is null
            }
          }).toList(),
        );
      },
    );
  }

  Widget _buildmessageitem(DocumentSnapshot document) {
    Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

    if (data == null || data.isEmpty) {
      return Container(); // Return an empty container or handle the case when data is null or empty
    }

    // set alignment
    var isCurrentUserMessage =
        (data['senderid'] == _firebaseAuth.currentUser!.uid);
    var alignment =
        isCurrentUserMessage ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(data['senderemail'] ??
                ''), // Use ?? to provide a default value in case 'senderemail' is null
            Chatbubble(
              message: data['message'],
              isCurrentUserMessage: isCurrentUserMessage,
            ),
          ],
        ),
      ),
    );
  }

  //build message input

  Widget _buildmessageinput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Mytextfield(
              controller: _messagecontroller,
              hinttext: 'Enter the message',
              obscuretext: false,
            ),
          ),
          IconButton(
              onPressed: sendmessage,
              icon: Icon(
                Icons.arrow_upward,
                color: Colors.black,
                size: 40,
              ))
        ],
      ),
    );
  }
}

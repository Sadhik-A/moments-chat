import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moments/model/message.dart';

class Chatservice extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //send message
  Future<void> sendmessage(String recieverid, String message) async {
    // get current user id
    final String currentuserid = _firebaseAuth.currentUser!.uid;
    final String currentusermail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();
    //create a new message
    Message newmessage = Message(
        senderid: currentuserid,
        senderemail: currentusermail,
        recieverid: recieverid,
        message: message,
        timestamp: timestamp);
    //construct chat room id
    List<String> ids = [currentuserid, recieverid];
    ids.sort();
    String chatroomid = ids.join('_');
    //add new message to database
    await _firestore
        .collection('chat_rooms')
        .doc(chatroomid)
        .collection('messages')
        .add(newmessage.toMap());
  }
//get message

  Stream<QuerySnapshot> getmessages(String userid, String otheruserid) {
    List<String> ids = [userid, otheruserid];
    ids.sort();
    String chatroomid = ids.join('_');
    return _firestore
        .collection('chat_rooms')
        .doc(chatroomid)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}

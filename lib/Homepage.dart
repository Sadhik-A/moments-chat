import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moments/Chatpage.dart';
import 'package:provider/provider.dart';
import 'package:moments/services/Auth/Auth_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void Sighnout() {
    final authService =
        Provider.of<Authserive>(context as BuildContext, listen: false);
    authService.Sighnout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Moments")),
        actions: [
          IconButton(onPressed: Sighnout, icon: const Icon(Icons.exit_to_app))
        ],
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: _builduserlist(),
    );
  }

// build a list of users except for the current logged in user
  Widget _builduserlist() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("loading");
          }
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _builduserlistitem(doc))
                .toList(),
          );
        });
  }
new changes 
  Widget _builduserlistitem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    // dispaly all users except the current user

    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Text(data['email']),
        onTap: () {
          Navigator.push(
            context as BuildContext,
            MaterialPageRoute(
              builder: (context) => Chatpage(
                  receieveruseremail: data['email'],
                  receieveruserid: data['uid']),
            ),
          );
        },
      );
    }
    return Container();
  }
}

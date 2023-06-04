import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_flower/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flower/pages/flower_shop.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Becky\'s Bouquet');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _title(),
          backgroundColor: Color.fromARGB(255, 101, 185, 253),
        ),
        body: Container(
            // height: double.infinity,
            // width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _userUid(),
                _signOutButton(),
                const FlowerShop(),
              ],
            )));
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Views/CreateUser.dart';
import 'package:untitled/firebase_options.dart';

class HomepageManager extends StatelessWidget {
  const HomepageManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manager view')),
      // body:
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the RegisterUserForm page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateUser()),
            );
          },
          child: Text('Register New User'),
        ),
      ),
    );
  }
}

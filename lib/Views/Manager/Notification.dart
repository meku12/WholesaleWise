import 'package:flutter/material.dart';
import 'package:untitled/Views/Manager/HomeManager.dart';
// import '../Manager/HomeManager.dart';

class NotificationManager extends StatelessWidget {
  const NotificationManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomepageManager()), // Navigate to accounts screen
        );;
          },
        ),
        title: const Text('Notifications'),
        backgroundColor: Color.fromARGB(255, 6, 116, 219) 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildNotificationCard('New Message', 'You have a new message from John Doe.'),
            buildNotificationCard('Reminder', 'Don\'t forget to attend the meeting at 3 PM.'),
            buildNotificationCard('Event Notification', 'The event "Tech Conference" is tomorrow.'),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationCard(String title, String message) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(message),
        leading: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 6, 116, 219) ,
          child: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: const NotificationManager(),
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    debugShowCheckedModeBanner: false,
  ));
}
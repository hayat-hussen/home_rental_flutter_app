import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        color: Colors.purple[50],
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // User Profile Section
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with user image
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text('johndoe@example.com', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Settings List
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      // Navigate to settings page
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.history),
                    title: Text('Order History'),
                    onTap: () {
                      // Navigate to order history page
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help & Support'),
                    onTap: () {
                      // Navigate to help page
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    onTap: () {
                      // Handle logout
                      _logout();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _logout() {
    // Implement your logout logic here
    print('User logged out');
  }
}
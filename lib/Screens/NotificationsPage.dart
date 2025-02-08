import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<Map<String, String>> notifications = [
    {
      'title': 'New Booking Confirmed',
      'description': 'Your booking at the Beach House has been confirmed.',
      'timestamp': '2025-02-05 14:30',
    },
    {
      'title': 'Payment Successful',
      'description': 'Your payment of \$150.00 was successful.',
      'timestamp': '2025-02-04 10:15',
    },
    {
      'title': 'Special Offer',
      'description': 'Get 20% off on your next booking!',
      'timestamp': '2025-02-03 09:00',
    },
    {
      'title': 'Reminder',
      'description': 'Don’t forget your upcoming stay at the Mountain Cabin.',
      'timestamp': '2025-02-02 08:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.blue[50],
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  notification['title']!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notification['description']!),
                    SizedBox(height: 4),
                    Text(
                      notification['timestamp']!,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
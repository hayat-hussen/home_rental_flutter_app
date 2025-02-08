import 'package:flutter/material.dart';

class BookedPage extends StatefulWidget {
  @override
  _BookedPageState createState() => _BookedPageState();
}

class _BookedPageState extends State<BookedPage> {
  final List<Map<String, dynamic>> bookedItems = [
    {
      'title': 'Beach House',
      'date': '2025-02-10',
      'price': 150.00,
    },
    {
      'title': 'Mountain Cabin',
      'date': '2025-02-15',
      'price': 200.00,
    },
    {
      'title': 'City Apartment',
      'date': '2025-02-20',
      'price': 120.00,
    },
  ];

  double get totalCost {
    return bookedItems.fold(0, (sum, item) => sum + item['price']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booked Items'),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        color: Colors.pink[50],
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Booked Items List
            Expanded(
              child: ListView.builder(
                itemCount: bookedItems.length,
                itemBuilder: (context, index) {
                  final item = bookedItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(item['title'], style: TextStyle(fontSize: 18)),
                      subtitle: Text('Date: ${item['date']}'),
                      trailing: Text('\$${item['price'].toStringAsFixed(2)}'),
                    ),
                  );
                },
              ),
            ),
            // Total Cost
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Total Cost: \$${totalCost.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // Confirm and Cancel Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle confirmation logic
                    _confirmBooking();
                  },
                  child: Text('Confirm Booking'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle cancellation logic
                    _cancelBooking();
                  },
                  child: Text('Cancel Booking'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _confirmBooking() {
    // Implement your booking confirmation logic here
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Booking Confirmed'),
          content: Text('Your booking has been confirmed!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _cancelBooking() {
    // Implement your booking cancellation logic here
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Booking Canceled'),
          content: Text('Your booking has been canceled.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
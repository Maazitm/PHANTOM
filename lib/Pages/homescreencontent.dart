import 'package:flutter/material.dart';

// Define your screens
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Card(
          child: Container(
            child: Row(
              children: [],
            ),
            // Using the custom widget ,
            height: 150,
            width: double.infinity,
          ),
          color: Colors.blue.shade300,
        ),
        // Add other widgets displaying PDF list if needed
      ],
    ));
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            'Hello Flutter',
            style: TextStyle(color: Colors.red, fontSize: 30,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}

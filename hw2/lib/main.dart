import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Counter'),
        centerTitle: true,
      ),
      body: const Body(),
      backgroundColor: Colors.blue,
    ),
  ));
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int counter = 50;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Tap \"-\" to decrement'),
          ElevatedButton(
            onPressed: null,
            child: Container(
              width: 115,
              height: 50,
              child: Row(
                children: [
                  IconButton(
                      onPressed: _decrement, icon: const Icon(Icons.remove)),
                  Text('$counter'),
                  IconButton(onPressed: _increment, icon: const Icon(Icons.add))
                ],
              ),
            ),
          ),
          const Text('Tap \"+\" to increment'),
        ],
      ),
    );
  }

  void _decrement() {
    counter--;
    setState(() {});
  }

  void _increment() {
    counter++;
    setState(() {});
  }
}

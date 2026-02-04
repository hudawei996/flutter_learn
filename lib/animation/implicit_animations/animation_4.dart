import 'package:flutter/material.dart';

class Animation4 extends StatefulWidget {
  const Animation4({super.key});

  @override
  State<Animation4> createState() => _Animation4State();
}

class _Animation4State extends State<Animation4> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              flag = !flag;
            });
          },
        ),
        appBar: AppBar(title: const Text('Title')),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            width: 300,
            height: 300,
            color: Colors.blue,
            // AnimatedDefaultTextStyle
            child: AnimatedDefaultTextStyle(
              style: TextStyle(
                fontSize: flag ? 20 : 30,
                color: flag ? Colors.red : Colors.white,
              ),
              duration: Duration(milliseconds: 500),
              child: Text("你好flutter"),
            ),
          ),
        ),
      ),
    );
  }
}

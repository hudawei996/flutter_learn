import 'package:flutter/material.dart';

class Animation2 extends StatefulWidget {
  const Animation2({super.key});

  @override
  State<Animation2> createState() => _Animation2State();
}

class _Animation2State extends State<Animation2> {
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
          child:
              // AnimatedOpacity  AnimatedPadding
              // Opacity(
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: flag ? 0.2 : 1,
                child: // Padding(
                AnimatedPadding(
                  curve: Curves.bounceInOut,
                  duration: Duration(milliseconds: 500),
                  padding: EdgeInsetsGeometry.fromLTRB(
                    10,
                    flag ? 10 : 600,
                    0,
                    0,
                  ),
                  child: Container(width: 100, height: 100, color: Colors.red),
                ),
              ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Animation3 extends StatefulWidget {
  const Animation3({super.key});

  @override
  State<Animation3> createState() => _Animation3State();
}

class _Animation3State extends State<Animation3> {
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
        body: Stack(
          children: [
            // AnimatedPositioned
            // 加入购物车动画效果
            // Positioned(
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              right: flag ? 10 : 320,
              top: flag ? 10 : 600,
              child: Container(width: 60, height: 60, color: Colors.blue),
            ),
            ListView(
              children: [
                ListTile(title: Text("我是一个列表")),
                ListTile(title: Text("我是一个列表")),
                ListTile(title: Text("我是一个列表")),
                ListTile(title: Text("我是一个列表")),
                ListTile(title: Text("我是一个列表")),
                ListTile(title: Text("我是一个列表")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

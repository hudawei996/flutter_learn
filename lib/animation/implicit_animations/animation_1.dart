import 'package:flutter/material.dart';

class Animation1 extends StatefulWidget {
  const Animation1({super.key});

  @override
  State<Animation1> createState() => _Animation1State();
}

class _Animation1State extends State<Animation1> {
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
        body:
            // AnimatedContainer 动画效果
            // Center(
            //   child:
            //       // Container(
            //       AnimatedContainer(
            //         duration:
            //             //Duration(milliseconds: 1100),// 1.1秒
            //             Duration(seconds: 1, milliseconds: 100),
            //         // 1.1秒
            //         transform: flag
            //             ? Matrix4.translationValues(0, 0, 0)
            //             : Matrix4.translationValues(-100, 0, 0),
            //         curve: Curves.easeIn,
            //         width: flag ? 200 : 100,
            //         height: flag ? 200 : 100,
            //         color: Colors.yellow,
            //       ),
            // ),
            // 抽屉功能
            Stack(
              children: [
                ListView(children: const [ListTile(title: Text("我是一个列表"))]),
                Positioned(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    transform: flag
                        ? Matrix4.translationValues(-200, 0, 0)
                        : Matrix4.translationValues(0, 0, 0),
                    curve: Curves.easeIn,
                    width: flag ? 200 : 100,
                    height: double.infinity,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Animation5 extends StatefulWidget {
  const Animation5({super.key});

  @override
  State<Animation5> createState() => _Animation5State();
}

class _Animation5State extends State<Animation5> {
  bool flag = false;
  String url = "https://www.itying.com/images/flutter/2.png";

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
            //当子元素改变的时候会触发动画
            child: AnimatedSwitcher(
              transitionBuilder: (child, animation) {
                // 可以改变动画效果
                return ScaleTransition(
                  scale: animation,
                  // child: child,
                  // 还可以叠加效果
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              duration: Duration(milliseconds: 1000),
              child:
                  // 组件变化，触发动画
                  // flag
                  //     ? CircularProgressIndicator(
                  //         backgroundColor: Colors.red,
                  //         valueColor: AlwaysStoppedAnimation(Colors.yellow),
                  //       )
                  //     : Image.network(url, fit: BoxFit.cover),
                  // 组件没有变化，但是内容变化了，也要触发动画
                  Text(
                    // 有了这个后，每次页面刷新都会生成一个新的UniqueKey，系统会认为是换了一个组件，就能触发动画
                    key: UniqueKey(),
                    flag ? "你好flutter" : "你好大地老师",
                    style: TextStyle(color: Colors.yellow, fontSize: 50),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

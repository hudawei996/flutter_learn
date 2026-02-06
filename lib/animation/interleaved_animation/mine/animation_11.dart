import 'package:flutter/material.dart';

class Animation11 extends StatefulWidget {
  const Animation11({super.key});

  @override
  State<Animation11> createState() => _Animation11State();
}

class _Animation11State
    extends
        State<Animation11> // todo 这个with一定要有:
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool flag = true;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, //让程序和手机的刷新频率统一
      duration: const Duration(seconds: 1),
    ); // 往复重复播放
    _controller.addListener(() {
      print("value:${_controller.value}");
    });
  }

  // 自定义 两个图标切换动画
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            flag?_controller.forward():_controller.reverse();
            flag = !flag;
          },
        ),
        appBar: AppBar(title: const Text('自定义动画组件AnimatedIcon（交错动画）')),
        body: Center(
          child: Stack(
            children: [
              // 1 首先把要变换的两个图标叠放
              // Icon(Icons.close, size: 40,),
              // 2 用ScaleTransition包裹
              ScaleTransition(
                scale: _controller.drive(
                  Tween(
                    begin: 0.0,
                    end: 1.0,
                  ).chain(CurveTween(curve: Interval(0.5, 1.0))),
                ),
                child: Icon(Icons.close, size: 40),
              ),
              // Icon(Icons.search, size: 40,),
              ScaleTransition(
                scale: _controller.drive(
                  Tween(
                    begin: 1.0,
                    end: 0.0,
                  ).chain(CurveTween(curve: Interval(0, 0.5))),
                ),
                child: Icon(Icons.search, size: 40),
              ),
              // 3想实现：0-0.5秒 search消失，0.5-1秒 close显式
            ],
          ),
        ),
      ),
    );
  }
}

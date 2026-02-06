import 'package:flutter/material.dart';
import 'package:flutter_learn/animation/interleaved_animation/mine/widget/sliding_box_my.dart';

import '../teacher/main.dart';

class Animation12 extends StatefulWidget {
  const Animation12({super.key});

  @override
  State<Animation12> createState() => _Animation12State();
}

class _Animation12State
    extends
        State<Animation12> // todo 这个with一定要有:
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    // 这里已经是页面了，不需要再被人使用，所以使用下划线，禁止别人再使用
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
            flag ? _controller.forward() : _controller.reverse();
            flag = !flag;
          },
        ),
        appBar: AppBar(title: const Text('自定义动画效果的组件')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // // Container(width: 120, height: 60, color: Colors.blue[300]),
              // SlideTransition(
              //   position: _controller.drive(
              //     Tween(
              //       begin: const Offset(0.0, 0.0),
              //       end: const Offset(0.5, 0.0),
              //     ).chain(CurveTween(curve: Interval(0, 0.3))),
              //   ),
              //   child: Container(
              //     width: 120,
              //     height: 60,
              //     color: Colors.blue[300],
              //   ),
              // ),
              //
              // // Container(width: 120, height: 60, color: Colors.blue[500]),
              // SlideTransition(
              //   position: _controller.drive(
              //     Tween(
              //       begin: const Offset(0.0, 0.0),
              //       end: const Offset(0.5, 0.0),
              //     ).chain(CurveTween(curve: Interval(0.3, 0.6))),
              //   ),
              //   child: Container(
              //     width: 120,
              //     height: 60,
              //     color: Colors.blue[500],
              //   ),
              // ),
              //
              // // Container(width: 120, height: 60, color: Colors.blue[800]),
              // SlideTransition(
              //   position: _controller.drive(
              //     Tween(
              //       begin: const Offset(0.0, 0.0),
              //       end: const Offset(0.5, 0.0),
              //     ).chain(CurveTween(curve: Interval(0.6, 1.0))),
              //   ),
              //   child: Container(
              //     width: 120,
              //     height: 60,
              //     color: Colors.blue[800],
              //   ),
              // ),

              SlidingBoxMy(
                controller: _controller,
                color: Colors.blue[100],
                curve: const Interval(0.0, 0.3),
              ),
              SlidingBoxMy(
                controller: _controller,
                color: Colors.blue[300],
                curve: const Interval(0.2, 0.5),
              ),
              SlidingBoxMy(
                controller: _controller,
                color: Colors.blue[500],
                curve: const Interval(0.4, 0.7),
              ),
              SlidingBoxMy(
                controller: _controller,
                color: Colors.blue[700],
                curve: const Interval(0.6, 0.9),
              ),
              SlidingBoxMy(
                controller: _controller,
                color: Colors.blue[900],
                curve: const Interval(0.8, 1.0),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

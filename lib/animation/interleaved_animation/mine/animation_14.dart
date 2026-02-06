import 'package:flutter/material.dart';
import 'package:flutter_learn/animation/interleaved_animation/mine/widget/sliding_box_my.dart';

import '../teacher/main.dart';

class Animation14 extends StatefulWidget {
  const Animation14({super.key});

  @override
  State<Animation14> createState() => _Animation14State();
}

class _Animation14State
    extends
        State<Animation14> // todo 这个with一定要有:
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
            setState(() {
              flag = !flag;
            });
          },
        ),
        appBar: AppBar(title: const Text('TweenAnimationBuilder')),
        body: Center(
          child:
              // 希望在改变大小的时候显示出来动画，所以需要在外层包裹一个TweenAnimationBuilder
              // Icon(Icons.star, size: 40),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.2, end: flag ? 0.2 : 1),
                duration: const Duration(seconds: 1),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.red,
                    ),
                  );
                },
              ),
        ),
      ),
    );
  }
}

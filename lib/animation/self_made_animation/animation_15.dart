import 'package:flutter/material.dart';
import 'package:flutter_learn/animation/interleaved_animation/mine/widget/sliding_box_my.dart';

import '../interleaved_animation/teacher/main.dart';

class Animation15 extends StatefulWidget {
  const Animation15({super.key});

  @override
  State<Animation15> createState() => _Animation15State();
}

class _Animation15State
    extends
        State<Animation15> // todo 这个with一定要有:
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

    // 自定义 显式动画 需要用到的
    Animation y = Tween(begin: -200.0, end: 200.0)
        .chain(CurveTween(curve: Curves.bounceInOut))
        .chain(CurveTween(curve: const Interval(0.3, 0.8)))
        .animate(_controller);


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
              // 原图
              // Icon(Icons.star, size: 40),


              // 自定义隐式动画
              // 希望在改变大小的时候显示出来动画，所以需要在外层包裹一个TweenAnimationBuilder
              // TweenAnimationBuilder(
              //   tween: Tween<double>(begin: 0.2, end: flag ? 0.2 : 1),
              //   duration: const Duration(seconds: 1),
              //   builder: (context, value, child) {
              //     // 改变图标大小
              //     return Icon(Icons.star, size: value * 4);
              //
              //     // 改变容器透明度
              //     // return Opacity(
              //     //   opacity: value,
              //     //   child: Container(
              //     //     width: 200,
              //     //     height: 200,
              //     //     color: Colors.red,
              //     //   ),
              //     // );
              //
              //   },
              // ),

              // 自定义显示动画
              // AnimatedBuilder(
              //   animation: _controller,
              //   builder: (BuildContext context, Widget? child) {
              //     return Opacity(
              //       // opacity: _controller.value,
              //       opacity: Tween(
              //         begin: 0.2,
              //         end: 1.0,
              //       ).animate(_controller).value,
              //       child: Container(
              //         width: 200,
              //         height: 200,
              //         color: Colors.red,
              //       ),
              //     );
              //   },
              // ),

              AnimatedBuilder(animation: _controller, builder: (context,child){
                return Container(
                  width: 100,
                    height: 100,
                    transform: Matrix4.translationValues(0, y.value, 0),
                  color: Colors.red[200],
                );
              })
        ),
      ),
    );
  }
}

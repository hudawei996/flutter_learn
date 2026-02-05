import 'package:flutter/material.dart';

class Animation9 extends StatefulWidget {
  const Animation9({super.key});

  @override
  State<Animation9> createState() => _Animation9State();
}

class _Animation9State extends State<Animation9>
// todo 这个with一定要有:
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, //让程序和手机的刷新频率统一
      duration: const Duration(seconds: 2),
      // lowerBound: 0.5,
      // upperBound: 1.5,
    )..repeat(reverse: true);// 往复重复播放
    _controller.addListener(() {
      print("value:${_controller.value}");
    });
  }

  // ScaleTransition 学习
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _controller.repeat();
          },
        ),
        appBar: AppBar(title: const Text('RotationTransition')),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              SlideTransition(
                // todo 通过Tween 来设置动画的范围 ,以下两种写法效果一样
                // position: _controller.drive(Tween(begin: Offset(0, 0), end: Offset(0.5, 0.5))),
                position: Tween(begin: Offset(0, 0), end: Offset(0, 3))
                .chain(CurveTween(curve: Curves.bounceOut))
                // 当前时间的20%开始运动，80%的时间停止
                .chain(CurveTween(curve: Interval(0.2, 0.8)))
                    .animate(_controller),
                child: const FlutterLogo(size: 60),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _controller.forward();
                    },
                    child: const Text("forward"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _controller.reverse(); //倒序播放一次
                    },
                    child: const Text("Reverse"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _controller.stop();
                      //停止播放
                    },
                    child: const Text("Stop"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _controller.reset(); //重置
                    },
                    child: const Text("rest"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

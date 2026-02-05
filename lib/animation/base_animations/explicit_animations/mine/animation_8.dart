import 'package:flutter/material.dart';

class Animation8 extends StatefulWidget {
  const Animation8({super.key});

  @override
  State<Animation8> createState() => _Animation8State();
}

class _Animation8State extends State<Animation8>
// todo 这个with一定要有:
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, //让程序和手机的刷新频率统一
      duration: const Duration(seconds: 2),
      lowerBound: 0.5,
      upperBound: 1.5,
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
              ScaleTransition(
                // 通过Tween 来设置动画的范围
                scale: _controller.drive(Tween(begin: 0.5, end: 1.5)),
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

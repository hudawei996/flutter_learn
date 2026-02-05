import 'package:flutter/material.dart';

class Animation6 extends StatefulWidget {
  const Animation6({super.key});

  @override
  State<Animation6> createState() => _Animation6State();
}

class _Animation6State extends State<Animation6>
    // 这个with一定要有:
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this, //让程序和手机的刷新频率统一
      duration: const Duration(seconds: 1),
    );
  }

  // RotationTransition 学习
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _controller.repeat();
            // _animationController.forward();
            // _animationController.stop();
            // _animationController.reset();
            // _animationController.repeat();
            // _animationController.reverse();
          },
        ),
        appBar: AppBar(title: const Text('RotationTransition')),
        body: Center(
          child: Column(
            children: [
              const  SizedBox(height: 40),
              RotationTransition(
                turns: _controller,
                child: const FlutterLogo(
                  size: 60,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _controller.forward();
                      },
                      child: const Text("forward")),
                  ElevatedButton(
                      onPressed: () {
                        _controller.reverse(); //倒序播放一次
                      },
                      child: const Text("Reverse")),
                  ElevatedButton(
                      onPressed: () {
                        _controller.stop();
                        //停止播放
                      },
                      child: const Text("Stop")),
                  ElevatedButton(
                      onPressed: () {
                        _controller.reset(); //重置
                      },
                      child: const Text("rest")),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

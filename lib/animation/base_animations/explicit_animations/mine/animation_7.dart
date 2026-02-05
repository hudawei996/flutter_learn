import 'package:flutter/material.dart';

class Animation7 extends StatefulWidget {
  const Animation7({super.key});

  @override
  State<Animation7> createState() => _Animation7State();
}

class _Animation7State extends State<Animation7>
    // 这个with一定要有:
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this, //让程序和手机的刷新频率统一
      duration: const Duration(seconds: 2),
      lowerBound: 0.5,
      upperBound: 1
    );
    _controller.addListener(() {
      print("value:${_controller.value}");
    });
  }

  // FadeTransition 学习
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
              const  SizedBox(height: 40),
              FadeTransition(
                opacity: _controller,
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

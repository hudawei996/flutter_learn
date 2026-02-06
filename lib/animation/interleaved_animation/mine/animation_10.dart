import 'package:flutter/material.dart';

class Animation10 extends StatefulWidget {
  const Animation10({super.key});

  @override
  State<Animation10> createState() => _Animation10State();
}

class _Animation10State
    extends
        State<Animation10> // todo 这个with一定要有:
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, //让程序和手机的刷新频率统一
      duration: const Duration(seconds: 1),
      // lowerBound: 0.5,
      // upperBound: 1.5,
    )..repeat(reverse: true); // 往复重复播放
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
          child: Icon(Icons.refresh),
          onPressed: () {
            _controller.repeat();
          },
        ),
        appBar: AppBar(title: const Text('AnimatedIcon')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _controller,
                size: 40,
              ),

              const SizedBox(height: 40),
              AnimatedIcon(
                icon: AnimatedIcons.home_menu,
                progress: _controller,
                size: 40,
              ),
              const SizedBox(height: 40),
              AnimatedIcon(
                icon: AnimatedIcons.search_ellipsis,
                progress: _controller,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          _controller.repeat(reverse: true);
        },
      ),
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            ScaleTransition(  //Tween配置运动的参数
              scale: _controller.drive(Tween(begin: 0.5,end: 1.2)),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
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
    );
  }
}

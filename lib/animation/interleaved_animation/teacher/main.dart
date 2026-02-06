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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool flag = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            flag ? _controller.forward() : _controller.reverse();
            flag = !flag;
          }),
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlidingBox(
             controller: _controller,
             color: Colors.blue[100],
             curve: const Interval(0.0, 0.3),
            ),
            SlidingBox(
             controller: _controller,
             color: Colors.blue[300],
             curve: const Interval(0.2, 0.5),
            ),
             SlidingBox(
             controller: _controller,
             color: Colors.blue[500],
             curve: const Interval(0.4, 0.7),
            ),
            SlidingBox(
             controller: _controller,
             color: Colors.blue[700],
             curve: const Interval(0.6, 0.9),
            ),
             SlidingBox(
             controller: _controller,
             color: Colors.blue[900],
             curve: const Interval(0.8, 1.0),
            ),         
          ],
        ),
      ),
    );
  }
}

class SlidingBox extends StatelessWidget {
  final AnimationController controller;
  final Color? color;  //注意可空类型
  final Curve curve;
  const SlidingBox(
      {super.key,
      required this.controller,
      required this.color,
      required this.curve});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: controller.drive(
          Tween(begin: const Offset(0.0, 0.0), end: const Offset(1, 0.0))
              .chain(CurveTween(curve: curve))),
      child: Container(
        width: 120,
        height: 60,
        color: color,
      ),
    );
  }
}

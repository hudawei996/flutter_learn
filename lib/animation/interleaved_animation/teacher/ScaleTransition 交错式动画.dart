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
  bool flag=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {          
            flag?_controller.forward():_controller.reverse();
            flag=!flag;
          }),
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Stack(
          children: [
            //0-0.5秒 search消失    0.5到1秒的时候让 close显示
            ScaleTransition(
                scale: _controller.drive(Tween(begin: 0.0, end: 1.0)
                    .chain(CurveTween(curve: const Interval(0.5, 1)))),
                child: const Icon(Icons.close, size: 40)),
            ScaleTransition(
                scale: _controller.drive(Tween(begin: 1.0, end: 0.0)
                    .chain(CurveTween(curve: const Interval(0, 0.5)))),
                child: const Icon(Icons.search, size: 40)),
          ],
        ),
      ),
    );
  }
}

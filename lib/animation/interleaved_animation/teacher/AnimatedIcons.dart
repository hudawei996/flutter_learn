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
        child: Icon(Icons.refresh),
        onPressed:(){
          // _controller.forward();
           _controller.repeat(reverse: true);
        }
      ),
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedIcon(
              icon: AnimatedIcons.close_menu, progress: _controller, size: 40),

              const SizedBox(height: 40),
              AnimatedIcon(
              icon: AnimatedIcons.home_menu, progress: _controller, size: 40),
             const SizedBox(height: 40),
              AnimatedIcon(
              icon: AnimatedIcons.search_ellipsis, progress: _controller, size: 40),
            ]),
          ),
    );
  }
}

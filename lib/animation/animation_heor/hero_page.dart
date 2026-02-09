import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  Map arguments;

  HeroPage({super.key, required this.arguments});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: const Text('Hero')),
        body: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Hero(
              tag: widget.arguments['imageUrl'],
              child: Image.network("https://www.itying.com/images/flutter/2.png"),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  const HmCategory({super.key});

  @override
  State<HmCategory> createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blue,
            margin: const EdgeInsets.all(5),
            child: Text(
              "分类$index",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}

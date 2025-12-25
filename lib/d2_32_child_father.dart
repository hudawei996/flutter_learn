import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPageChildFather extends StatefulWidget {
  const MainPageChildFather({super.key});

  @override
  _MainPageChildFatherState createState() => _MainPageChildFatherState();
}

class _MainPageChildFatherState extends State<MainPageChildFather> {
  final List<String> _list = ["鱼香肉丝", "宫保鸡丁", "西红柿鸡蛋", "麻婆豆腐", "京酱肉丝", "水煮肉片"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('组件通信')),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(_list.length, (int index) {
            return ChildMy(
              foodName: _list[index],
              currentIndex: index,
              delFood: (int i) {
                print("成功掉用到父组件的函数$i");
                setState(() {
                  _list.removeAt(i);
                });
              },
            );
          }),
        ),
      ),
    );
  }
}

/// 组件通信：子组件向父组件传递数据
class ChildMy extends StatefulWidget {
  final String foodName;
  final int currentIndex;
  final Function(int index) delFood;

  const ChildMy({super.key,
    required this.foodName,
    required this.currentIndex,
    required this.delFood
  });


  @override
  _ChildMyState createState() => _ChildMyState();
}

class _ChildMyState extends State<ChildMy> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            widget.foodName,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        IconButton(
          onPressed: () {
            widget.delFood(widget.currentIndex);
          },
          color: Colors.red,
          icon: Icon(Icons.delete),
        ),
      ],
    );
  }
}

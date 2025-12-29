import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 组件通信-父传子（构造函数传递参数）
/// 步骤：1.子组建定义接收属性
///      2.子组建在构造函数中接收参数
///      3.父组件传递属性给子组建
///      4.有状态组件在‘对外的类’接收属性，‘对内的类’通过widget接收属性
///      5.注意：子组件定义接收属性需要使用final关键字-
///      因为属性是父组件决定的（传递过来的），子组建不能随意更改
///

// class MainPageFatherChild extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('组件通信-父传子')),
//         body: Container(
//           alignment: Alignment.center,
//           child: Column(
//             children: [
//               Text(
//                 '父组件',
//                 style: TextStyle(fontSize: 20, color: Colors.blue),
//               ),
//               ChildStateless(
//                 title: '无状态子组件',
//                 content: '子组件内容',
//               ),
//               ChildStateful(
//                 title: '有状态子组件',
//                 content: '子组件内容',
//               )
//             ],
//           )
//         ),
//       ),
//     );
//   }
// }
//
// /// 无状态的子组件
// class ChildStateless extends StatelessWidget {
//   final String title;
//   final String content;
//
//   const ChildStateless({
//     super.key,
//     required this.title,
//     required this.content,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       child: Column(
//         children: [
//           Text(
//             title,
//             style: TextStyle(fontSize: 20, color: Colors.red),
//           ),
//           Text(
//             content,
//             style: TextStyle(fontSize: 20, color: Colors.red),
//           )
//         ]
//       )
//     );
//   }
// }
//
//
// /// 有状态的子组件
// class ChildStateful extends StatefulWidget {
//   final String title;
//   final String content;
//   const ChildStateful({super.key, required this.title, required this.content});
//
//   @override
//   State<ChildStateful> createState() => _ChildStatefulState();
// }
//
// class _ChildStatefulState extends State<ChildStateful> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       child: Column(
//         children: [
//           Text(
//             widget.title,
//             style: TextStyle(fontSize: 20, color: Colors.red),
//           ),
//           Text(
//             widget.content,
//             style: TextStyle(fontSize: 20, color: Colors.red),
//           )
//         ],
//       ),
//     );
//   }
// }

class MainPageFatherChild extends StatefulWidget {
  const MainPageFatherChild({super.key});

  @override
  State<MainPageFatherChild> createState() => _MainPageFatherChildState();
}

class _MainPageFatherChildState extends State<MainPageFatherChild> {
  final List<String> _list = ["鱼香肉丝", "宫保鸡丁", "西红柿鸡蛋", "麻婆豆腐", "京酱肉丝", "水煮肉片"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('组件通信-父传子')),
        body: GridView.count(
          padding: EdgeInsets.all(10),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: List.generate(_list.length, (index) {
            return Container(
              alignment: Alignment.center,
              child: D231FatherChild(foodName: _list[index]),
            );
          }),
        ),
      ),
    );
  }
}

class D231FatherChild extends StatefulWidget {
  final String foodName;

  const D231FatherChild({super.key, required this.foodName});

  @override
  State<D231FatherChild> createState() => _D231FatherChildState();
}

class _D231FatherChildState extends State<D231FatherChild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        widget.foodName,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

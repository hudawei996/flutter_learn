import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter组件初体验-无状态组件',
//       theme: ThemeData(scaffoldBackgroundColor: Colors.white),
//       home: Scaffold(
//         appBar: AppBar(title: Text("头部区域")),
//         body: Container(child: Center(child: Text("中部区域"))),
//         bottomNavigationBar: Container(height: 80,child: Center(
//           child: Text("底部区域"),
//         ),), ,
//       ),
//     );
//   }
// }

// 有状态组件的爹一个类 对外
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

// 有状态组件的子一个类 对内
class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter组件初体验-有状态组件',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(title: Text("头部区域")),
        body: Container(child: Center(child: Text("中部区域"))),
        bottomNavigationBar: Container(
          height: 80,
          child: Center(child: Text("底部区域")),
        ),
      ),
    );
  }
}

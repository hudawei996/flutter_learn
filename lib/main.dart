import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/app/routes/index.dart';
import 'package:flutter_learn/base_learn/d2_21_29_main.dart';

import 'base_learn/d2_31_father_child.dart';
import 'base_learn/d2_32_child_father.dart';
import 'base_learn/d2_3456_dio_use.dart';
import 'base_learn/d2_37890_route.dart';
import 'base_learn/d2_412_route_senior.dart';

void main(List<String> args) {
  // runApp(MainPage());
  // runApp(MainPageTest());
  // runApp(MainPageFatherChild());
  // runApp(MainPageChildFather());

  // 直接使用，不封装
  // Dio()
  //     .get("https://geek.itheima.net/v1_0/channels")
  //     .then((value) {
  //       print(value.data);
  //     })
  //     .catchError((error) {
  //       print("$error");
  //     });
  // 封装一下使用
  // runApp(MainPageDio());

  // runApp(MainPageRoute());
  // runApp(MainPageRouteSenior());




  runApp(getRootWidget());


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
    print("createState()");
    return _MainPageState();
  }
}

// 有状态组件的子一个类 对内
class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    print("initState()");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies()");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MainPage oldWidget) {
    print("didUpdateWidget()");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print("deactivate() 当statefulWidget从树中暂时移除时调用");
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose() 当statefulWidget从树中永久被移除时调用");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build()阶段执行");

    return MaterialApp(
      title: 'Flutter组件初体验-有状态组件',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(title: Text("头部区域")),
        body: Center(
          child:
              // GestureDetector(
              //   onTap: () {
              //     print("点击了中间区域");
              //   },
              //   onDoubleTap: () {
              //     print("双击了中间区域");
              //   },
              //   onLongPress: () {
              //     print("长按了中间区域");
              //   },
              //   child: Text("中部区域"),
              // ),
              Center(
                child: TextButton(
                  onPressed: () {
                    print("点击了中间区域");
                  },
                  child: Text("按钮"),
                ),
              ),
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: Center(child: Text("底部区域")),
        ),
      ),
    );
  }
}

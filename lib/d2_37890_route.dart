import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/d2_33_dio.dart';

class MainPageRoute extends StatefulWidget {
  const MainPageRoute({super.key});

  @override
  State<MainPageRoute> createState() => _MainPageRouteState();
}

class _MainPageRouteState extends State<MainPageRoute> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        /// 这个'/': (context) => ListPage(),
        /// 和 home: ListPage(),只能有一个
        /// 推荐只使用'/'，更统一
        '/': (context) => ListPage(),
        '/list': (context) => ListPage(),
        //以前是靠页面传递具体参数的方式
        // '/detail': (context) => DetailPage(index:0),
        //现在使用路由参数，就不用写对应的构造函数了
        '/detail': (context) => DetailPage(),
      },
      // home: ListPage(),
    );
  }
}

// 列表页面
class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("列表页")),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              /// 写法一：
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (BuildContext context) {
              //       return DetailPage(index: index);
              //     },
              //   ),
              // );

              /// 写法二：用页面传参
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) {
              //       return DetailPage(index: index);
              //     },
              //   ),
              // );

              /// 写法二简写
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DetailPage(index: index),
              //   ),
              // );
              
              /// 写法三：注册路由表之后，使用arguments传参
              Navigator.pushNamed(context, "/detail", arguments: {"index": index});

            },
            child: Container(
              color: Colors.blue,
              margin: EdgeInsets.only(top: 10),
              height: 100,
              alignment: Alignment.center,
              child: Text(
                "第 $index 个",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  // final int index;

  // const DetailPage({super.key, required this.index});
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _routeGetArguments = "";
  @override
  void initState() {
    super.initState();
    /// 异步微任务接收
    Future.microtask((){
      if(ModalRoute.of(context) != null){
        print("获取到路由参数");
        // print(ModalRoute.of(context)!.settings.arguments);
        Map<String,dynamic> params = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
        _routeGetArguments = params["index"].toString();
        ///更新视图,要不然UI中不会显示出来，记住一定要写
        setState(() {});
      } else {
        print("获取不到路由参数");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("详情页")),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.pop(context);
              },
              child:
              // Text("这里是第${widget.index}页，点击返回上一个页面"),
              Text("路由传递的参数为$_routeGetArguments 点击返回上一个页面"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/list");
              },
              child: Text("点击返回列表页"),
            )
          ],
        ),
      ),
    );
  }
}
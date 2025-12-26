import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/d2_33_dio.dart';

class MainPageDio extends StatefulWidget {
  const MainPageDio({super.key});

  @override
  State<MainPageDio> createState() => _MainPageDioState();
}

class _MainPageDioState extends State<MainPageDio> {
  @override
  void initState() {
    super.initState();
    // 发起网络请求
    _getChannels();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Dio使用-频道管理")),
        body: GridView.extent(
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          maxCrossAxisExtent: 140,
          childAspectRatio: 2.0,
          children: List.generate(_channelsList.length, (index) {
            return GestureDetector(
              onTap: () {
                print("点击了: ${_channelsList[index]['name']}");
              },
              child: Container(
                alignment: Alignment.center,
                child:
                    // ChannelItem(_channelsList[index]),
                    ChannelItem(channelItem: _channelsList[index]),
              ),
            );
          }),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _channelsList = [];

  void _getChannels() async {
    final DioUtils dioUtils = DioUtils();

    try {
      // dioUtils.get("channels").then((value) {});

      final Response response = await dioUtils.get("channels");

      print("状态码: ${response.statusCode}");
      if (response.statusCode == 200) {
        // 这个数据的外层还有一个 {data: {}}，data对应的值，才是我们要的
        // print("请求成功: ${response.data}");

        Map<String, dynamic> res = response.data as Map<String, dynamic>;
        // print("数据: ${res['data']}");

        /// 错误的类型转换
        // _channelsList = res['data']['channels'] as List<Map<String,dynamic>>;
        /// 正确的类型转换
        // _channelsList = res['data']['channels'].cast<Map<String,dynamic>>() as List<Map<String,dynamic>>;
        // _channelsList = res['data']['channels'].cast<Map<String,dynamic>>();

        /// cast方法青汁转化列表项的数据类型
        // _channelsList = (res['data']['channels'] as List).cast<Map<String,dynamic>>() as List<Map<String,dynamic>>;
        _channelsList = (res['data']['channels'] as List)
            .cast<Map<String, dynamic>>(); // 简写

        setState(() {});
        print("数据: $_channelsList");
      } else {
        print("响应数据: ${response.data}");
      }
    } catch (e) {
      print("请求异常: $e");
    } finally {
      /// 最好是在这里使用数据更新，
      /// 而不是在78行处，不判断页面是否挂在，直接更新数据
      /// 在这里更新数据，即使是错误的，也可以更新显示错误提示
      if (mounted) {
        setState(() {});
      }
    }
  }
}

class ChannelItem extends StatelessWidget {
  final Map<String, dynamic> channelItem;

  // 这两种写法都可以，但是这种在调用时只能写成：xxxx，不能写成 channelItem:xxxx
  // 如：ChannelItem(_channelsList[index])
  // const ChannelItem(this.channelItem);
  // const ChannelItem(this.channelItem, {super.key});

  // 这两种写法都可以，这种可以在参数使用时写成 channelItem:xxxx
  // 如：ChannelItem(channelItem:_channelsList[index])
  // const ChannelItem({super.key, required Map<String, dynamic> this.channelItem});
  const ChannelItem({super.key, required this.channelItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        channelItem['name'] ?? "空",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}

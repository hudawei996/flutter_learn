import 'package:flutter/material.dart';
import 'package:flutter_learn/app/pages/cart/index.dart';
import 'package:flutter_learn/app/pages/category/index.dart';
import 'package:flutter_learn/app/pages/mine/index.dart';
import 'package:flutter_learn/app/stores/TokenManager.dart';
import 'package:flutter_learn/app/stores/UserController.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../api/user_api.dart';
import '../home/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 定义数据 根据数据惊醒渲染4个导航
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/app/assets/ic_public_home_normal.png",
      "active_icon": "lib/app/assets/ic_public_home_active.png",
      "label": "首页",
    },
    {
      "icon": "lib/app/assets/ic_public_pro_normal.png",
      "active_icon": "lib/app/assets/ic_public_pro_active.png",
      "label": "分类",
    },
    {
      "icon": "lib/app/assets/ic_public_cart_normal.png",
      "active_icon": "lib/app/assets/ic_public_cart_active.png",
      "label": "购物车",
    },
    {
      "icon": "lib/app/assets/ic_public_my_normal.png",
      "active_icon": "lib/app/assets/ic_public_my_active.png",
      "label": "我的",
    },
  ];

  int _currentIndex = 0;
  
  @override
  void initState() {
    super.initState();
    // 初始化用户
    _initUser();
  }

  final UserController _userController = Get.put(UserController());
  void _initUser() async{
    await tokenManager.init();
    if(tokenManager.getToken().isNotEmpty){
      _userController.updateUserInfo(await getUserInfoAPI());
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea避开安全区域组件
      body:
      // SafeArea(
      //   child: IndexedStack(index: _currentIndex, children: _getChildren()),
      // ),
      // 不使用安全区域，就会更像沉浸式，但是搜索框会和摄像头区域重合，所以还要给搜索框处理一下
      IndexedStack(index: _currentIndex, children: _getChildren()),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: _getTabBarWidget(),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!, width: 24, height: 24),
        activeIcon: Image.asset(
          _tabList[index]["active_icon"]!,
          width: 24,
          height: 24,
        ),
        label: _tabList[index]["label"],
      );
    });
  }

  List<Widget> _getChildren() {
    return [HomeView(), CategoryView(), CartView(), MineView()];
  }

}

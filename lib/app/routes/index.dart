// 管理路由
import 'package:flutter/material.dart';
import 'package:flutter_learn/app/pages/login/index.dart';
import 'package:flutter_learn/app/pages/main/index.dart';

// 返回App根级组件
Widget getRootWidget(){
  return MaterialApp(
    initialRoute: "/",
    routes: getRootRoutes(),
  );
}

// 返回该App的路由配置
Map<String,Widget Function(BuildContext)> getRootRoutes(){
  return {
    "/":(context) => MainPage(), // 主页路由
    "/login":(context) => LoginPage(),// 登录页路由
  };
}
